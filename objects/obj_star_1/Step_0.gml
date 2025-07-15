
if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(ord("F"))) {
        ativou = true;
        global.estrelas_coletadas++;
		show_message("Estrelas coletadas: " + string(global.estrelas_coletadas))
		var _name_player = global.nome_jogador
		var _estrela_coletada = global.estrelas_coletadas
		ini_open("save.sav");

		// Escreve o novo valor de estrelas na seção [teste 1] e na chave "estrelas_coletadas"
		// Todas as outras chaves (x_atual, y_atual, etc.) nesta seção não são afetadas.
		ini_write_real(string(_name_player), "estrelas_coletadas",_estrela_coletada);

		// Fecha o arquivo, aplicando a mudança.
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
        
        // Atualiza o número de estrelas coletadas
        
        
        // Índice da estrela (considerando que array começa em 0)
        var star_index = global.estrelas_coletadas - 1;
        var star_name = "";
		
        var constellation_name ="";
        var complete_message ="";
        
        // Verifica se star_index está dentro do intervalo válido
        if (star_index >= 0 && star_index < array_length(global.estrelas)) {
            star_name = global.estrelas[star_index].nome;
            
            if (star_index < 5) {
                constellation_name = "Homem Velho";
            } else if (star_index < 15) {
                constellation_name = "Anta do Norte";
            } else if (star_index < 23) {
                constellation_name = "Veado";
            } else {
                constellation_name = "Constelação desconhecida";
            }
        } else {
            star_name = "Estrela desconhecida";
            constellation_name = "Constelação desconhecida";
        }
        
        complete_message = "Recuperou o artefato: " + star_name;
        
        // Atualiza o obj_message existente
        if (instance_exists(obj_message)) {
            obj_message.text1 = complete_message;
            obj_message.text2 = " da constelação " + constellation_name;
            obj_message.alpha = 1; // Torna a mensagem visível
            obj_message.mostra_message = true; // Ativa a exibição da mensagem
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
