/// @description Código da cobra inimiga com ataque direcional correto

// Cooldown do tiro
if (tiro_cooldown > 0) {
    tiro_cooldown--;
}

event_inherited();

// Checagem de chão
var chao = place_meeting(x, y + 1, obj_block);

// Gravidade
if (velv < max_velv * 2) {
    velv += GRAVIDADE * massa;
}

// Inicializa variáveis de controle
if (atirou == undefined) atirou = false;
if (alvo_x == undefined) alvo_x = 0; // posição do player no momento do disparo

switch (estado) {
    case "parado": {
        if (sprite_index != spr_snake) sprite_index = spr_snake;

        if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);

            // Define direção da sprite
            if (obj_player.x < x) {
                image_xscale = -1;
                lado_certo = -1;
            } else {
                image_xscale = 1;
                lado_certo = 1;
            }

            // Se estiver no range, prepara o tiro
            if (_dist < 300 && tiro_cooldown <= 0) {
                estado = "atirando";
                tiro_cooldown = 100;
                alvo_x = obj_player.x; // salva a direção na hora do disparo
            } else {
                alarm[2] = 380;
            }
        }
        break;
    }

    case "hit": {
        if (sprite_index != spr_snake_hit) {
            sprite_index = spr_snake_hit;
            image_index = 0;
            vida_atual -= obj_player.ataque;
            screenshake(1);
        }

        if (vida_atual <= 0) {
            if (image_index > image_number - 1) estado = "morto";
        } else {
            if (image_index > image_number - 1) estado = "parado";
        }

        break;
    }

    case "atirando": {
        if (sprite_index != spr_snake_shoot) {
            sprite_index = spr_snake_shoot;
            image_index = 0;
            atirou = false;

            // Decide lado com base na posição salva
            if (alvo_x < x) {
                image_xscale = -1;
                lado_certo = -1;
            } else {
                image_xscale = 1;
                lado_certo = 1;
            }
        }

        // Disparo no frame certo
        if (floor(image_index) == 9 && !atirou) {
            var proj = instance_create_layer(x, y , "instances", obj_projetil2);
            proj.direcao = lado_certo;
            atirou = true;
        }

        if (image_index >= image_number - 1) {
            estado = "parado";
        }

        break;
    }

    case "morto": {
        if (sprite_index != spr_snake_dead) {
            pontuar(3);
            sprite_index = spr_snake_dead;
            image_index = 0;
        }

        if (image_index > image_number - 1) {
            instance_destroy();
        }

        break;
    }
}
