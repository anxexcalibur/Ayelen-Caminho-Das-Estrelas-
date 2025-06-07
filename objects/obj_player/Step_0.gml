  /// @description Controle do jogador
event_inherited();
test = keyboard_check_pressed(ord("R"));
if test {
	show_message(etapa_historia)
}
//etapa do jogo, controla a direção da  seta
switch(etapa_historia){
	case 1:
		global.alvo_x = obj_sensor.x
		global.alvo_y = obj_sensor.y
		if instance_exists(obj_seta){
			obj_seta.status = true
		}
	break	
}
// Checando se o objeto transição existe
if (instance_exists(obj_trasicao)) exit;
 var chao = place_meeting(x, y + 1, obj_block);
// Inicializando variáveis de entrada
if (!global.dialogo and !global.menu_existe) {
    var right = keyboard_check(ord("D"));
    var left = keyboard_check(ord("A"));
    var jump = keyboard_check_pressed(vk_space);
   
    var attack = keyboard_check_pressed(ord("J"));
    var esquiva = keyboard_check_pressed(ord("L"));
    var attack_projetil = keyboard_check_pressed(ord("H"));
} else {
    // Se o diálogo está aberto, bloqueia o movimento e ações
    var right = false;
    var left = false;
    var jump = false;
    var attack = false;
    var esquiva = false;
    var attack_projetil = false;
}


// Checando se eu já dei o dash
dei_dash = false;
//variavel que verifica se a habilidade de defesa foi desbloqueada
defesa = false;
var resert_bonus = 0;
var estou_na_parede = place_meeting(x - 1, y,obj_block);



if(vida_atual > max_vida)
{
	max_vida++;
	
}
//codigo que verifica e controla quando exibir os dialogos dentro do jogo, obs transforma em função
if (distance_to_object(obj_par_npcs) <= 10) {
    if (keyboard_check_pressed(ord("F")) && global.dialogo == false) {
        var _npc = instance_nearest(x, y, obj_par_npcs);
        var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
        _dialogo.npc_nome = _npc.nome;
    }
}

// desbloquea a habilidade de defesa
if (keyboard_check(ord("K"))and etapa_historia >= 6) {
    defesa = true;
} else {
    defesa = false;
}

// Cálculo da velocidade horizontal
if global.game_paused == false{
	velh = (right - left) * max_velh;
}else if instance_exists(obj_dialogo){
	velh = 0;
}else{
	velh = 0;
}

// Verificando se o jogador está morto
if (vida_atual <= 0) {
    estado = "morto";
}

// Criando sistema se o escudo tocar o projetil da cobra
if (estado == "defesa" && place_meeting(x, y, obj_projetil2)) {
    instance_create_layer(x - 15, y - 20, instances, obj_projetil);
}
// animação o player sofrer dano
if (alarm > 0) {
    if (image_alpha >= 1) {
        alfa_hit = -0.5;
    } else if (image_alpha <= 0) {
        alfa_hit = 0.05;
    }
    image_alpha += alfa_hit;
} else {
    image_alpha = 1;
}

// Variável global para o cooldown do dash
if (!variable_global_exists("dash_cooldown")) {
    global.dash_cooldown = 0;
}

// Iniciando a máquina de estados
switch (estado) {
	
	
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
        if (velv > 0) {
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
    case "ataque aereo baixo": { 
        aplica_gravidade();
        velv += 0.3;
        velh = 0;
        if (!ataque_down) {
            sprite_index = spr_player_attack_aer_down;
            image_index = 0;
            ataque_down = true;
        }
        if (sprite_index == spr_player_attack_aer_down) {
            if (image_index > image_number - 0.2) {
                sprite_index = spr_player_attack_down_loop;
            }
        }
        if (chao) {
            if (sprite_index != spr_player_attack_down_end) {
                sprite_index = spr_player_attack_down_end;
                image_index = 0;
                screenshake(8, true, 270);
            } else {
                if (image_index >= image_number - 0.2) {
                    ataque_down = false;
                    estado = "parado";
                }
            }
        }
        if (sprite_index == spr_player_attack_down_loop) {
            ataque += 3;
            dano = instance_create_layer(obj_player.x, obj_player.y + 10, layer, obj_hit_box);
        } else {
            ataque = 1;
        }
        break;
    }
    
    // Estado: Ataque
    case "ataque": {   
        velh = 0;
        if (sprite_index != spr_player_attack) {
            image_index = 0;
            sprite_index = spr_player_attack;
        }
        if (image_index >= 2) {
            if (image_xscale == 1) {
                instance_create_layer(x + 40, y - 12, layer, obj_hit_box);
            } else if (image_xscale == -1) {
                instance_create_layer(x - 40, y - 12, layer, obj_hit_box);
            }
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
		var flipped = direction;
		var gun_x = (x+4)*(flipped)
		var _xx = x+ lengthdir_x(15, image_angle)
		var y_offset = lengthdir_y(-20,image_angle)
		
		
        velh = 0;
		
        if (sprite_index != spr_player_attack_projetil) {
            image_index = 0;
            sprite_index = spr_player_attack_projetil;
        }
        if (image_index > 3) {
			
			
	            with  (instance_create_layer(_xx -10,y-30,layer,obj_shoot)){
				
				
					//velocidade
					speed = 5;
					//direcao
					direction  = -90 + 90 *other.image_xscale
					//anglo
					image_angle = direction;
				}
			
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
    
    // Estado: Defesa
    case "defesa": {
        velh = 0;
		resistencia += 0.5
        if (sprite_index != spr_player35) {
            image_index = 0;
            sprite_index = spr_player35;
        }
        if (image_index > image_number - 1) {
            image_index = image_number - 1;
        }
        if (!defesa) {
            estado = "parado";
        }
        if (esquiva && global.dash_cooldown <= 0) {
            estado = "dash";
        }
        break;
    }
    
    // Estado: Dash
    case "dash": {
        tempo_dash--;
        if (sprite_index != spr_player_jump) {
            sprite_index = spr_player_jump;
        }
        if (!dei_dash) {
            var _down = keyboard_check(ord("S"));
            var _up = keyboard_check(ord("W"));
            var _dir = point_direction(0, 0, (right - left), (_down - _up));
            velh = lengthdir_x(vel_dash, _dir);
            velv = lengthdir_y(vel_dash, _dir);
            global.dash_cooldown = 65;  // Ajuste o valor conforme necessário para o tempo de cooldown do dash
        }
        dei_dash = true;
        image_index = 0;
        if (tempo_dash <= 0) {
            estado = "parado";
            tempo_dash = duracao_dash;
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
				instance_destroy()
            }
        }
		}
        break;
    }
	case "cha": {
    sprite_index = spr_player_cha;
		obj_seta.alarm[0] = 10
    if (image_index == sprite_get_number(spr_player_cha) - 1) {
		
        estado = "parado"; // Volta para "parado" quando a animação termina
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

// Reinicia a sala quando a tecla Enter é pressionada


// Criando meu Rastro
if (tempo_dash % 3 == 0) {
    var _rastro = instance_create_depth(x, y, depth + 1, obj_player_rastro);
    _rastro.sprite_index = sprite_index;
    _rastro.image_index = image_index;
    _rastro.image_speed = 0;
}

// Decrementando o cooldown do dash
if (global.dash_cooldown > 0) {
    global.dash_cooldown--;
}
	
	