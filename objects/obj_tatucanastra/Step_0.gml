// inherit do evento pai
event_inherited();

var chao = place_meeting(x, y + 1, obj_block);

if (!chao) {
    velv += GRAVIDADE * massa;
}

switch (estado)
{
    case "parado":
    { 
		pode_levar_dano = true;
        timer_estado++;

        if (sprite_index != spr_tatucanastra_parado) {
            sprite_index = spr_tatucanastra_parado;
            image_index = 0;
        }

        if (timer_estado > 200) {
            estado = choose("movendo", "movendo", "parado");
            timer_estado = 0;
        }
        break;
    }

    case "movendo":
    {
        timer_estado++;

        if (sprite_index != spr_tatucanastra) {
            sprite_index = spr_tatucanastra;
            image_index = 0;
        }

        if (velh == 0) {
            var direcao = choose(-2, 2);
            velh = direcao;
        }

        if (place_meeting(x, y, obj_player)) {
            if (obj_player.estado == "defesa") {  // Correção: uso de '=='
                velh = -velh;
            }
        }

        if (timer_estado > 200) {
            estado = choose("parado", "parado", "movendo");
            timer_estado = 0;
        }
        break;
    }

    case "hit": {
	pode_levar_dano= false
    velh = 0;

    if (sprite_index != spr_tatucanastra_hit) {
        sprite_index = spr_tatucanastra_hit;
        image_index = 0;
        screenshake(1);
    }

    if (vida_atual <= 0) {
        if (image_index >= image_number - 1) {
            estado = "morto";
        }
    } else {
        if (image_index >= image_number - 1) {
            estado = "parado"; // ou "movendo"
             // ← Reset aqui
        }
    }

    break;
}


    case "morto":
    {
		pode_levar_dano = false
        if (sprite_index != spr_tatucanastra_morto) {
            pontuar(6);
            sprite_index = spr_tatucanastra_morto;
            image_index = 0;
        }

        if (image_index > image_number - 1) {
            instance_destroy();
        }
        break;
    }
}
