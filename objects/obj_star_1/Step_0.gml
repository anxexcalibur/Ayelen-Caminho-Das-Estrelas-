if (place_meeting(x, y, obj_player)) { 
    if (keyboard_check_pressed(ord("F"))) { 
        ativou = true;
		
        sprite_index = spr_star_bruta;
        image_speed = 1;
        alarm[0] = room_speed;
        screenshake(10); 

        // Atualiza o número de estrelas coletadas
        global.estrelas_coletadas++;
        
        // Identifica a estrela e a constelação
        var star_index = global.estrelas_coletadas;
        var star_name = "";
        var constellation_name = "";
        var complete_message = "";

        if (star_index <= 6) {
            constellation_name = "Homem Velho";
            star_name = "Estrela " + string(global.estrelas[star_index].nome); // Assumindo um nome padrão para estrelas
        } else if (star_index <= 16) {
            constellation_name = "Anta do Norte";
            star_name = "Estrela " + string(global.estrelas[star_index].nome); // Assumindo um nome padrão para estrelas
        } else if (star_index <= 24) {
            constellation_name = "Constelação 3"; // Nome para a terceira constelação
            star_name = "Estrela " + string(global.estrelas[star_index].nome); // Assumindo um nome padrão para estrelas
        }

        complete_message = "Recuperou o artefato: " + star_name
		
        
        // Atualiza o obj_message existente
        var message_instance = instance_find(obj_message, 0);
        if (message_instance != noone) {
            message_instance.text1 = complete_message;
			message_instance.text2 =  " da constelação " + constellation_name;
            message_instance.alpha = 1; // Torna a mensagem visível
            message_instance.mostra_message = true; // Ativa a exibição da mensagem
        }
        
        // Partículas
        part_particles_create(part_system, x, y, part_type, 5);
        alarm[1] = room_speed; // Configura o alarme para destruir o objeto
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
