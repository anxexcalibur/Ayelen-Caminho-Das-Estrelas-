/// @description Comportamento completo do caracol

// Herda código do objeto pai (se estiver usando)
event_inherited();

// Gravidade
var _chao = place_meeting(x, y + 1, obj_block);
if (!_chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa;
    }
}

// === MÁQUINA DE ESTADOS ===
switch (estado) {
    
    #region andando
    case "andando": {
        // No estado "andando", o caracol está vulnerável a ataques.
        pode_levar_dano = true;

        // Verifica se o player está à frente e defendendo
        var offset = 4;
        var checa_x = x + (direc == 0 ? offset : -offset);
        var alvo = instance_place(checa_x, y, obj_player);
        
        if (alvo != noone && alvo.estado == "defesa") {
            direc = 1 - direc; // Inverte a direção
        }

        // Verifica colisão com parede para inverter a direção
        if (place_meeting(x + (direc == 0 ? 1 : -1), y, obj_parede_inimigo)) {
            direc = 1 - direc; // Inverte a direção
        }

        // Movimento do caracol
        if (direc == 0) { // 0 = direita
            x += 0.2;
            sprite_index = spr_caracol_andando_direita;
        } else { // 1 = esquerda
            x -= 0.2;
            sprite_index = spr_caracol_andando_esquerda;
        }

        // Cria rastro de gosma na posição Y do caracol
        if (random(100) < 4) {
            instance_create_layer(x-25, y-33, "Instances", obj_gosma_rastro);
        }
        break;
    }
    #endregion

    #region hit
    case "hit": {
        // Ao ser atingido, fica invencível.
        pode_levar_dano = false;
        velh = 0; // Para de se mover

        // Toca a animação de dano (apenas uma vez)
        if (sprite_index != spr_caracol_dano) {
            image_index = 0;
            sprite_index = spr_caracol_dano;
            screenshake(1);
        }

        // Lógica para sair do estado "hit" após a animação
        if (image_index >= image_number - 1) {
             if (vida_atual <= 0) {
                estado = "morto";
            } else {
                estado = "andando";
            }
        }
        break;
    }
    #endregion

    #region morto
    case "morto": {
        // Morto, não pode mais levar dano.
        pode_levar_dano = false;

        // Toca a animação de morte (apenas uma vez)
        if (sprite_index != spr_caracol_morto) {
            pontuar(3);
            sprite_index = spr_caracol_morto;
            image_index = 0;
        }

        // Destrói a instância ao final da animação
        if (image_index > image_number - 1) {
            instance_destroy();
        }
        break;
    }
    #endregion
}