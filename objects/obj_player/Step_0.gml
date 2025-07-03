  /// @description Controle do jogador

///referente a porta
// Impede passagem por porta fechada

if (keyboard_check_pressed(ord("G")))
{
    // Chama a sua nova função na posição exata do jogador
    scr_drop_item(x, y, obj_star_1);
	show_message(global.estrelas_coletadas)
}
// Iniciando a máquina de estados
/// @description Controle do jogador (Reorganizado)


//==============================================================================
// 1. CONFIGURAÇÕES E VERIFICAÇÕES GLOBAIS
//==============================================================================

// Se uma transição de tela estiver ativa, interrompe todo o código do jogador.
if (instance_exists(obj_trasicao)) {
    exit;
}

// Inicializações que ocorrem a cada frame.
dei_dash = false;
defesa = false;

// Inicialização única da variável de cooldown (idealmente, isso fica no evento Create).
if (!variable_global_exists("dash_cooldown")) {
    global.dash_cooldown = 0;
}

// Debug para exibir a etapa da história
if (keyboard_check_pressed(ord("R"))) {
    show_message(etapa_historia);
}

// Lógica da história (controla a seta e outros elementos)
switch(etapa_historia) {
    case 1:
        global.alvo_x = obj_sensor.x;
        global.alvo_y = obj_sensor.y;
        if (instance_exists(obj_seta)) {
            obj_seta.status = true;
        }
        break;
}

// Lógica de interação com NPCs
if (distance_to_object(obj_par_npcs) <= 10) {
    if (keyboard_check_pressed(ord("F")) && !global.dialogo) {
        var _npc = instance_nearest(x, y, obj_par_npcs);
        var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
        _dialogo.npc_nome = _npc.nome;
    }
}


//==============================================================================
// 2. CAPTURA DE ENTRADAS (INPUTS)
//==============================================================================

// Inicializa as variáveis de input como falsas.
var right = false, left = false, jump = false, attack = false, esquiva = false, attack_projetil = false;

// Permite a leitura dos inputs apenas se o jogo não estiver pausado ou em diálogo.
if (!global.dialogo && !global.menu_existe && !global.game_paused) {
    right = keyboard_check(ord("D"));
    left = keyboard_check(ord("A"));
    jump = keyboard_check_pressed(vk_space);
    attack = keyboard_check_pressed(ord("J"));
    esquiva = keyboard_check_pressed(ord("L"));
    attack_projetil = keyboard_check_pressed(ord("H"));
    
    // Habilidade de defesa (só pode ser ativada se desbloqueada)
    if (etapa_historia >= 6) {
        defesa = keyboard_check(ord("K"));
    }
}


//==============================================================================
// 3. MÁQUINA DE ESTADOS E LÓGICA DE JOGO
//==============================================================================

// Definições importantes para a máquina de estados
var chao = place_meeting(x, y + 1,obj_parede_solida_pai);
var estou_na_parede = place_meeting(x - 1, y, obj_block); // Nota: Este só checa um lado

// Cálculo da velocidade horizontal desejada
// Se o jogo estiver pausado ou em diálogo, velh será 0.
// Cálculo da velocidade horizontal desejada
if (!global.game_paused && !global.dialogo) {
    velh = (right - left) * max_velh;
} else {
    velh = 0;
}

if !chao and velv > 0{
	estado = "pulando"
}
// ^^^^^^ FIM DO BLOCO DE CÓDIGO PARA ADICIONAR ^^^^^^

// Checagem de vida para forçar o estado "morto"
if (vida_atual <= 0) {
    estado = "morto";
}

// Lógica específica que depende de um estado (pode ficar aqui ou dentro do case)
if (estado == "defesa" && place_meeting(x, y, obj_projetil2)) {
    instance_create_layer(x - 15, y - 20, "instances", obj_projetil);
}

// O CÉREBRO DO JOGADOR: A MÁQUINA DE ESTADOS
switch (estado) {
    
    
    // vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    
    // Estado: Parado
     case "parado": {
         // Comportamento do estado
		//errro
		if global.balas  > 0 and attack_projetil{
			estado = "ataque projetil"
			
			global.balas--
		}
         sprite_index = spr_player;
         if (defesa) {
             estado = "defesa";
         }
         // Condições de troca de estado
         if (right || left and global.game_paused == false) {
             estado = "movendo";
         } else if (jump || !chao and global.game_paused == false) {
             estado = "pulando";
             velv = (-max_velv * jump);
             image_index = 0;
         } else if (attack and global.game_paused == false) {
             inicia_ataque(chao);
         }
         break;
		 
     }
      // Estado: Movendo
    case "movendo": {
        sprite_index = spr_player_run;
		if (place_meeting(x,y,obj_vida)){
	        if (velv > 0) {
	            sprite_index = spr_player_cura;
	            if (image_index >= image_number - 1) {
	                image_index = image_number - 1;
	            }
	        }
	    } 
        if (defesa) {
            estado = "defesa";
        }
        if (!right && !left && !jump && !esquiva) {
            estado = "parado";
        } else if (jump || !chao) {
            estado = "pulando";
            velv = (-max_velv * jump);
            image_index = 0;
        } else if (attack) {
            inicia_ataque(chao);
        }
        break;
    }
    
    // Estado: Pulando
   case "pulando": {
    if (place_meeting(x,y,obj_vida)){
        if (velv < 0) {
            sprite_index = spr_player_fall_cura;
            if (image_index >= image_number - 1) {
                image_index = image_number - 1;
            }
        }
    } 

    if (attack) {
        inicia_ataque(chao);
    }

    if (chao) {
        estado = "parado";
        velh = 0;
    }

    var wall = place_meeting(x - 1, y, obj_wall_slide) || place_meeting(x + 1, y, obj_wall_slide);
    if (wall) {
        if (jump) {
            velv = -max_velv;
        }
        sprite_index = spr_player_wall;
        if (velv > 1) {
            velv = 3;
        } else {
            aplica_gravidade();
        }
    } else {
        aplica_gravidade();
    }

    if (esquiva && !dei_dash && global.dash_cooldown <= 0) {
        estado = "dash";
    }
    break;
}
    // Estado: Ataque Aéreo
    case "ataque aereo": {
        aplica_gravidade();
        if (sprite_index != spr_player_attack2) {
            sprite_index = spr_player_attack2;
            image_index = 0;
        }
        if (image_index >= image_number - 1) {
            estado = "pulando";
        }
        if (chao) {
            estado = "parado";
        }
        if (image_index >= 1) {
            if (image_xscale == 1) {
                instance_create_layer(x + sprite_width / 2 + velh * 2, y - 12, layer, obj_hit_box);
            } else if (image_xscale == -1) {
                instance_create_layer(x - 28, y - 12, layer, obj_hit_box);
            }
        }
        if (esquiva && !dei_dash && global.dash_cooldown <= 0) {
            estado = "dash";
        }
        break;
    }
    
    // Estado: Ataque Aéreo para Baixo
	//codigo vinculado com on_block_quebra
   case "ataque aereo down": {
    aplica_gravidade();
    velv += 0.3;
    velh = 0;

    // ----- LÓGICA DE IMPACTO NO CHÃO (Prioridade Máxima) -----
    if (chao) {
        // Se uma hitbox aérea existia, ela cumpriu sua função. Destrua-a.
        if (instance_exists(hitbox_aerea_id)) {
            instance_destroy(hitbox_aerea_id);
            hitbox_aerea_id = noone; // Limpa a variável
        }

        // Reseta o ataque para o valor base após o golpe aéreo
        ataque = 1;

        // Executa a animação de finalização e o screenshake
        if (sprite_index != spr_player_attack_down_end) {
            sprite_index = spr_player_attack_down_end;
            image_index = 0;
            screenshake(8, true, 270);
            // Você pode até criar uma última hitbox de impacto aqui, se quiser
            // instance_create_layer(x, y, layer, obj_hitbox_impacto);
        }

        // Espera a animação de finalização acabar para voltar ao estado "parado"
        if (image_index >= image_number - 0.1) {
            estado = "parado";
        }
    }
    // ----- LÓGICA DE QUEDA (Só executa se NÃO estiver no chão) -----
    else {
        // Transição da animação de início para a de loop
        if (sprite_index != spr_player_attack_aer_down && sprite_index != spr_player_attack_down_loop) {
            sprite_index = spr_player_attack_aer_down;
            image_index = 0;
        }
        if (sprite_index == spr_player_attack_aer_down && image_index >= image_number - 0.1) {
            sprite_index = spr_player_attack_down_loop;
        }

        // Lógica da hitbox contínua durante o loop de queda
        if (sprite_index == spr_player_attack_down_loop) {
            // Se a hitbox ainda não foi criada, crie UMA.
            if (!instance_exists(hitbox_aerea_id)) {
                ataque += 3; // Aumenta o poder do ataque
                hitbox_aerea_id = instance_create_layer(x, y + 10, layer, obj_hit_box);
            }
            
            // Se a hitbox JÁ existe, apenas atualize sua posição para seguir o player.
            else {
                hitbox_aerea_id.x = x;
                hitbox_aerea_id.y = y + 10;
            }
        }
    }
    break;

}
    // Estado: Ataque
    case "ataque": {
    if (sprite_index != spr_player_attack) {
        image_index = 0;
        sprite_index = spr_player_attack;
        
        // **PASSO 1: Reseta a variável no início de CADA ataque**
        hitbox_criada = false; 
    }

    // **PASSO 2: Condição para criar a hitbox APENAS UMA VEZ**
    if (image_index >= 2 && !hitbox_criada) {
        if (image_xscale == 1) {
            instance_create_layer(x + 40, y - 12, layer, obj_hit_box);
        } else if (image_xscale == -1) {
            instance_create_layer(x - 40, y - 12, layer, obj_hit_box);
        }
        
        // **PASSO 3: Avisa que a hitbox deste ataque já foi criada**
        hitbox_criada = true;
    }

    if (image_index > image_number - 1) {
        estado = "parado";
        velh = 0;
        posso = true;
    }

    if (esquiva && !dei_dash && global.dash_cooldown <= 0) {
        estado = "dash";
    }
    
    break;
}
	case "ataque projetil": {
    // ... seu código para calcular posições ...
    var _xx = x + lengthdir_x(15, image_angle);

    if (sprite_index != spr_player_attack_projetil) {
        image_index = 0;
        sprite_index = spr_player_attack_projetil;
        tiro_disparado = false; // Reinicia a flag para o próximo ataque
    }

    // Dispara o projétil UMA VEZ quando a animação atinge o frame 3
    if (image_index >= 3 && !tiro_disparado) {
        with (instance_create_layer(_xx - 10, y - 20, layer, obj_shoot)) {
            speed = 5;
            direction = -90 + 90 * other.image_xscale;
            image_angle = direction;
        }
        tiro_disparado = true; // Impede que mais tiros sejam disparados
    }

    // Transição para o estado parado no fim da animação
    if (image_index > image_number - 1) {
        estado = "parado";
        posso = true;
    }

    // ... sua lógica de dash ...
    break;
}
    
    // Estado: Defesa
   case "defesa": {
    velh = 0;
    resistencia += 0.5;

    if (sprite_index != spr_player35) {
        sprite_index = spr_player35;
        image_index = 0;
    }

    // Controle manual da animação de escudo ativo
    var penultimo = sprite_get_number(sprite_index) - 2;
    var ultimo = sprite_get_number(sprite_index) - 1;

    // Se ainda não chegou no frame de escudo completo, deixa rodar normal
    if (image_index < penultimo) {
        image_speed = 1; // ou o valor desejado para animação
    } else {
        // Quando chega nos frames finais, trava em loop entre penúltimo e último
        image_speed = 0;

        if (floor(current_time / 6) mod 2 == 0) {
            image_index = penultimo;
        } else {
            image_index = ultimo;
        }
    }

    // Sai da defesa
    if (!defesa) {
        estado = "parado";
    }

    // Se quiser permitir dash na defesa
    if (esquiva && !dei_dash && global.dash_cooldown <= 0) {
        estado = "dash";
    }

    break;
}

    
    // Estado: Dash
   case "dash": {
    tempo_dash--;

    // Ajusta sprite do dash (exemplo usa spr_player_jump)
    if (sprite_index != spr_player_jump) {
        sprite_index = spr_player_jump;
        image_index = 0;
    }

    // Só executa o dash uma vez ao entrar nesse estado
    if (!dei_dash) {
        // Pega input WASD para dash
        var dir_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
        var dir_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

        // Se nenhum input, dash na direção que o player está virado
        if (dir_x == 0 && dir_y == 0) {
            dir_x = sign(image_xscale); // direção do sprite
            dir_y = 0;
        }

        // Normaliza vetor direção
        var length_dir = point_distance(0, 0, dir_x, dir_y);
        if (length_dir != 0) {
            dir_x /= length_dir;
            dir_y /= length_dir;
        }

        // Define velocidades horizontais e verticais do dash
        velh = dir_x * vel_dash;
        velv = dir_y * vel_dash;

        // Inicia cooldown global do dash
        global.dash_cooldown = 35; // Ajuste conforme necessidade

        dei_dash = true;
    }

    // Reseta a animação (se necessário)
    image_index = 0;

    // Quando acabar o tempo do dash, volta para estado parado
    if (tempo_dash <= 0) {
        estado = "parado";
        tempo_dash = duracao_dash;
        dei_dash = false; // Permite novo dash futuramente
        velh = 0;
        velv = 0;
    }

    break;
}
    
    // Estado: Dano
    case "hit": {
		
		
		if(hitbaiacu == true){
			vida_atual -= obj_boss_baiacu.ataque
		}
        if (sprite_index != spr_player_hit) {
            sprite_index = spr_player_hit;
            image_index = 0;
            screenshake(2);
        }
        if (vida_atual > 0) {
            if (image_index >= image_number - 1) {
                estado = "parado";
				hitbaiacu = false
            }
        } else {
            if (image_index >= image_number - 1) {
                estado = "morto"; 
				hitbaiacu = false
            }
        }
		if max_vida > 10 {
			max_vida--;
		}
        break;
    }
    
    // Estado: Morto
    case "morto": {
		morreu = true;
        velh = 0;
        if (sprite_index != spr_player_morto) {
            image_index = 0;
            sprite_index = spr_player_morto;
        }
        if (image_index >= image_number - 1) {
            image_index = image_number - 1;
        }
        if (instance_exists(obj_controller)) {
            with (obj_controller) {
                game_over = true;
            }
        }
		if (keyboard_check(vk_enter)) {
			carregar_checkpoint(global.nome_jogador)
			estado = "parado"
			morreu = false;
			if (instance_exists(obj_controller)) {
            with (obj_controller) {
                game_over = false;
				
            }
        }
		}
        break;
    }
	case "cha": {
    if (sprite_index != spr_player_cha) {
        sprite_index = spr_player_cha;
        image_index = 0; // reinicia animação sempre que entrar no estado
    }

    obj_seta.alarm[0] = 10;

    if (image_index >= sprite_get_number(spr_player_cha) - 1) {
        estado = "parado"; // volta quando animação terminar
    }
    break;
}
	case "cura":
	{ 
		
		var tipoCura = "simples";
		
		velh=0;
		 if (sprite_index != spr_player_cura) {
            image_index = 0;
            sprite_index = spr_player_cura;
        }
		
		if (image_index == sprite_get_number(spr_player_cura) - 1) {
		
			estado = "parado"; // Volta para "parado" quando a animação termina
		}
		break;
	}
    default:
        estado = "parado";
        break;
}

 if (estado != "defesa") {
    image_speed = 1;
} 
    
    // (AQUI TERMINA A SUA MÁQUINA DE ESTADOS)
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



//==============================================================================
// 4. APLICAÇÃO FINAL DO MOVIMENTO (COLISÃO IRÁ AQUI NO FUTURO)
//==============================================================================

// ATENÇÃO: Seu código original não tinha as linhas que efetivamente movem o personagem.
// As variáveis `velh` e `velv` eram calculadas, mas nunca aplicadas a `x` e `y`.
// Adicionei-as aqui. Sem elas, o personagem não se move.
// NO PRÓXIMO PASSO, VAMOS SUBSTITUIR ESTA PARTE SIMPLES PELO SISTEMA DE COLISÃO COMPLETO.

// ---> Início da seção que vamos substituir


// ---> Fim da seção que vamos substituir
scr_colisao_movimento()

//==============================================================================
// 5. ATUALIZAÇÕES FINAIS E EFEITOS VISUAIS
//==============================================================================

// Vira o sprite para a direção do movimento
if (velh != 0) {
    image_xscale = sign(velh);
}

// Efeito de piscar ao sofrer dano
if (alarm[0] > 0) { // Usando alarm[0] como exemplo para o timer de dano
    if (image_alpha >= 1) {
        alfa_hit = -0.5;
    } else if (image_alpha <= 0) {
        alfa_hit = 0.05;
    }
    image_alpha += alfa_hit;
} else {
    image_alpha = 1;
}

// Efeito de rastro do dash
if (estado == "dash" && tempo_dash % 3 == 0) {
    var _rastro = instance_create_depth(x, y, depth + 1, obj_player_rastro);
    _rastro.sprite_index = sprite_index;
    _rastro.image_index = image_index;
    _rastro.image_speed = 0;
}

// Controle do Cooldown do Dash
if (global.dash_cooldown > 0) {
    global.dash_cooldown--;
}

// Verificação de excesso de vida
if(vida_atual > max_vida) {
    max_vida++;
}
