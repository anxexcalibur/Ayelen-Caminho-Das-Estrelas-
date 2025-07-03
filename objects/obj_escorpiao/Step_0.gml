/// @description Máquina de Estados do Escorpião
// Você pode escrever seu código neste editor

// Herda o código do obj_inimigo_pai (se estiver usando)
event_inherited();

var chao = place_meeting(x, y + 1, obj_block);

if (!chao) {
    velv += GRAVIDADE * massa;
}

switch (estado)
{
    #region parado
    case "parado":
    {
        // No estado parado, o escorpião pode levar dano.
        pode_levar_dano = true;
        
        timer_estado++;
        
        if (sprite_index != spr_escorpiao) {
            sprite_index = spr_escorpiao;
            image_index = 0;
        }

        if (random(timer_estado) > 200) {
            estado = choose("movendo", "movendo", "parado");
            timer_estado = 0;
        }
        break;
    }
    #endregion

    #region movendo
    case "movendo":
    {
        // Movendo, também pode levar dano.
        pode_levar_dano = true;
        
        timer_estado++;
        
        if (sprite_index != spr_escorpiao) {
            sprite_index = spr_escorpiao;
            image_index = 0;
        }
        
        if (velh == 0) {
            var direcao = choose(-2, 2);
            velh = direcao;
        }
        
        // Corrigido para '==' na comparação
        if (place_meeting(x, y, obj_player) && obj_player.estado == "defesa") {
            velh = -velh;
        }
        
        if (random(timer_estado) > 200) {
            estado = choose("parado", "parado", "movendo");
            // Faltou zerar o timer aqui
            timer_estado = 0;
        }
        break;
    }
    #endregion

    #region hit
    case "hit":
    {
        // Ao ser atingido, fica invencível.
        pode_levar_dano = false;
        velh = 0;

        if (sprite_index != spr_escorpiao_hit) {
            image_index = 0;
            sprite_index = spr_escorpiao_hit;
            screenshake(1);
            // A linha de dano foi REMOVIDA daqui. Ela pertence à hitbox do player.
        }

        // Checando o que fazer depois que a animação de "hit" acabar
        if (image_index >= image_number - 1) {
            if (vida_atual <= 0) {
                // Se a vida acabou, morre.
                estado = "morto";
            } else {
                // Se ainda tem vida, volta para o estado parado.
                estado = "parado";
            }
        }
        break;
    }
    #endregion

    #region morto
    case "morto":
    {
        // Morto, não pode mais levar dano.
        pode_levar_dano = false;
        
        if (sprite_index != spr_escorpiao_morto_1) {
            pontuar(6);
            sprite_index = spr_escorpiao_morto_1;
            image_index = 0;
        }
        
        // Morrendo de verdade
        if (image_index > image_number - 1) {
            instance_destroy();
        }
        break;
    }
    #endregion
}