/// @description Máquina de Estados e Comportamento da Cobra

// Herda o código do obj_inimigo_pai (se estiver usando)
event_inherited();

// Atualiza o timer de cooldown do ataque
if (timer_cooldown > 0) {
    timer_cooldown--;
}

// --- LÓGICA DE DIREÇÃO (SEMPRE ATIVA) ---
// Este bloco faz a cobra sempre se virar para o jogador,
// a menos que esteja nos estados "hit" ou "morto".
if (estado != "hit" && estado != "morto") {
    if (instance_exists(obj_player)) {
        // Vira o sprite na direção do jogador
        if (obj_player.x < x) {
            image_xscale = -1; // Vira para a esquerda
        } else {
            image_xscale = 1;  // Vira para a direita
        }
    }
}

// --- MÁQUINA DE ESTADOS ---
switch (estado)
{
    #region parado
    case "parado":
    {
        // Neste estado, a cobra está vulnerável.
        pode_levar_dano = true;
        sprite_index = spr_snake;
        
        if (instance_exists(obj_player)) {
            var _dist = distance_to_object(obj_player);
            
            // Se o jogador está no alcance e o ataque não está em cooldown...
            if (_dist < alcance_visao && timer_cooldown <= 0) {
                // ...muda para o estado de ataque.
                estado = "atacando";
                image_index = 0;
                atirou_neste_ciclo = false; // Prepara para o novo tiro
            }
        }
        break;
    }
    #endregion

    #region atacando
    case "atacando":
    {
        // Durante o ataque, ela também está vulnerável.
        pode_levar_dano = true;
        sprite_index = spr_snake_shoot;

        // Define o frame exato para o disparo (ajuste conforme sua animação)
        var _frame_do_disparo = 4;
        
        if (image_index >= _frame_do_disparo && !atirou_neste_ciclo) {
            
            // Calcula a posição ideal para o projétil sair
            var _offset_x = 20;
            var _spawn_x = x + (_offset_x * image_xscale);
            var _spawn_y = (bbox_top + bbox_bottom) / 2;

            var _proj = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_projetil2);
            _proj.direcao = image_xscale;
            
            atirou_neste_ciclo = true;
        }

        if (image_index >= image_number - 1) {
            timer_cooldown = cooldown_ataque;
            estado = "parado";
        }
        break;
    }
    #endregion
        
    #region hit
    case "hit":
    {
        // Ao ser atingida, a cobra fica temporariamente invencível.
        pode_levar_dano = false;
        
        if (sprite_index != spr_snake_hit) {
            sprite_index = spr_snake_hit;
            image_index = 0;
        }
        
        // Ao final da animação de dano...
        if (image_index >= image_number - 1) {
            // ...verifica se a vida acabou.
            // CERTIFIQUE-SE QUE 'vida_atual' É O NOME CORRETO DA SUA VARIÁVEL DE VIDA!
            if (vida_atual <= 0) {
                estado = "morto";
                image_index = 0;
            } else {
                // Se ainda tem vida, volta a ficar parada.
                estado = "parado";
            }
        }
        break;
    }
    #endregion
        
    #region morto
    case "morto":
    {
        // Morta, não pode mais levar dano.
        pode_levar_dano = false;
        
        if (sprite_index != spr_snake_dead) {
            sprite_index = spr_snake_dead;
            image_index = 0;
        }
        
        // Trava a animação no último frame para o corpo ficar no chão
        if (image_index >= image_number - 1) {
            image_speed = 0;
            image_index = image_number - 1;
			instance_destroy()
        }
        break;
    }
    #endregion
}