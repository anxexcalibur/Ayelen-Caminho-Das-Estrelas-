
if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(ord("F"))) {
        ativou = true;
        global.estrelas_coletadas++;

        var _name_player = variable_global_exists("player_name") ? global.player_name : "Jogador";
        var _estrela_coletada = global.estrelas_coletadas;

        ini_open("save.sav");
        ini_write_real(string(_name_player), "estrelas_coletadas", _estrela_coletada);
        ini_close();

        with (obj_player) {
            switch (etapa_historia) {
                case 7:
                    etapa_historia = 8;
                    break;
            }
        }

        sprite_index = spr_star_bruta;
        image_speed = 1;
        alarm[0] = room_speed;
        screenshake(10);

        var star_index = global.estrelas_coletadas - 1;
        var star_name = "";
        var star_frase = "";

        if (star_index >= 0 && star_index < array_length(global.estrelas)) {
            star_name = global.estrelas[star_index].nome;
        } else {
            star_name = "uma estrela";
        }

        star_frase = "Ótimo! Recuperamos a estrela " + star_name + ". Agora parte da vila pode ficar mais tranquila.";

        if (instance_exists(obj_message)) {
            obj_message.text1 = star_frase;
            obj_message.alpha = 0;
            obj_message.mostra_message = true;
            obj_message.tempo_decorrido = 0;
            obj_message.tempo_espera = 10;
            obj_message.tempo_final = 80;
        }

        part_particles_create(part_system, x, y, part_type, 5);
        alarm[1] = room_speed;
    }
}

if (ativou) {
    if (tempo_de_ativacao > 0) {
        part_particles_create(part_system, x, y, part_type, 15);
        y -= velocidade_subida;
        tempo_de_ativacao--;
    } else {
        alarm[1] = room_speed;
    }

    if (image_index >= 5 && sprite_index == spr_star_bruta) {
        sprite_index = spr_star_ativado;
        image_index = 0;
        image_speed = 1;
    }
}
