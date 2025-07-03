/// @description Máquina de Estados do Calango
// Você pode escrever seu código neste editor

// Herda o código do obj_inimigo_pai (se você estiver usando)
event_inherited();
	
var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa;
    }
}

switch(estado)
{
    case "andando": {
        // NESTE ESTADO, O INIMIGO DEVE ESTAR VULNERÁVEL
        pode_levar_dano = true;

        if (place_meeting(x, y, obj_parede_inimigo)) {
            direc = !direc; // Uma forma mais simples de inverter 0 para 1 e 1 para 0
        }

        if (direc == 0) { // Andando para a direita
            x += 0.5;
            sprite_index = spr_calango;
        } else { // Andando para a esquerda (direc == 1)
            x -= 0.5;
            sprite_index = spr_calango_esquerda;
        }
		
        break;
    }

    case "hit": {
        // AO ENTRAR NO ESTADO DE HIT, O INIMIGO FICA INVENCÍVEL
        pode_levar_dano = false;
        velh = 0; // Para de se mover

        // Este bloco só executa uma vez, no primeiro frame do estado "hit"
        if (sprite_index != spr_calango_hit) {
            image_index = 0;
            sprite_index = spr_calango_hit;
            screenshake(1);
            
            // IMPORTANTE: A linha de dano foi REMOVIDA daqui.
            // O dano deve ser aplicado pela HITBOX antes de mudar o estado.
        }
		
        // Condição de troca de estado
        if (vida_atual <= 0) {
            // Se a vida acabou, espera a animação de hit terminar para morrer
            if (image_index >= image_number - 1) {
                estado = "morto";
            }
        } else {
            // Se ainda tem vida, espera a animação de hit terminar para voltar a andar
            if (image_index >= image_number - 1) {
                estado = "andando";
            }
        }
        break;
    }

    case "morto": {
        // NO ESTADO MORTO, ELE NÃO PODE MAIS LEVAR DANO
        pode_levar_dano = false;

        if (sprite_index != spr_caracol_morto) { // OBS: Verifique se o sprite não deveria ser spr_calango_morto
            pontuar(3);
            sprite_index = spr_caracol_morto; // Corrija se necessário
            image_index = 0;
        }
		
        // Morrendo de verdade
        if (image_index > image_number - 1) {
            if (irandom(99) < 10) { // 10% de chance de dropar
                var heart = instance_create_layer(x, y - 18, layer, obj_vida);
                heart.image_xscale = 0.3;
                heart.image_yscale = 0.3;
            }
            instance_destroy();
        }
        break;
    }
}