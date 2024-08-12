
if (place_meeting(x, y, obj_player)) { 
    if (keyboard_check_pressed(ord("F"))) { 
        ativou = true;
        sprite_index = spr_star_bruta;
        image_speed = 1;
        alarm[0] = room_speed;
        screenshake(30); 
        //funcionando
        global.estrelas_coletadas++;
		

        // Identifica a estrela e constelação
        var star_index = global.estrelas_coletadas;
        var star_name = "";
        var constellation_name = "";
        var complete_message = "";

        if (star_index <= 6) {
            constellation_name ="Homem Velho";
            star_name =  string(global.estrelas[star_index].nome);
        } else if (star_index <= 16 and star_index >= 7 ) {
            constellation_name = "Anta do Norte";
            star_name = string(global.estrelas[star_index].nome);
        } else if (star_index <= 40 and star_index >= 17) {
            constellation_name = string(global.estrelas[star_index].nome);
            star_name = "Estrela " + string(star_index - global.constelacoes[0].total - global.constelacoes[1].total);
        }

        complete_message = "Recuperou o artefato: " + star_name + " da constelação " + constellation_name;
		var instancia_message = instance_create_layer(room_width / 2, room_height / 2, "Messages", obj_message);
		obj_message.text = complete_message;
		
        // Verifica constelação completa
      

        // Partículas
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

