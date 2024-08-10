if (place_meeting(x, y, obj_player)) { // Verifica se o player está colidindo
    if (keyboard_check_pressed(ord("F"))) { // Verifica se a tecla "F" foi pressionada
        ativou = true;
        sprite_index = spr_star_bruta; // Define o sprite de animação inicial (bruta)
        image_speed = 1; // Ativa a animação
        alarm[0] = room_speed; // Define o alarme para tocar após 1 segundo
        screenshake(30); // Aplica o efeito de tremor na tela
    }
} else if (!ativou) { // Se não estiver ativado
    sprite_index = spr_star_parado; // Define o sprite inicial (parado)
    image_index = 0; // Mantém no primeiro frame
    image_speed = 0; // Congela a animação
}

if (ativou) {
    // Efeito de partículas
    if (tempo_de_ativacao > 0) {
        var part_system = part_system_create();
        var part_type = part_type_create();
        
        part_type_shape(part_type, pt_shape_circle); // Forma de círculo
        part_type_size(part_type, 0.1, 0.4, 0, 0); // Tamanho menor das partículas
        part_type_life(part_type, 20, 40); // Duração das partículas
        part_type_speed(part_type, 1, 2, 0, 0); // Velocidade das partículas
        part_type_gravity(part_type, 0, 0); // Sem gravidade

        // Alterna entre branco e verde claro com degradê
        var blend_time = 20; // Tempo para mudar a cor
        var blend = (tempo_de_ativacao mod (2 * blend_time)) / blend_time;
        var start_color = c_lime; // Cor verde claro
        var end_color = c_white; // Cor branca
        
        var current_color = make_color_rgb(
            lerp(color_get_red(start_color), color_get_red(end_color), blend),
            lerp(color_get_green(start_color), color_get_green(end_color), blend),
            lerp(color_get_blue(start_color), color_get_blue(end_color), blend)
        );

        part_type_color1(part_type, current_color); // Cor atual
        part_type_color2(part_type, current_color); // Cor atual
        
        part_particles_create(part_system, x, y, part_type, 15); // Mais partículas
        
        // Movimenta o objeto para cima
        y -= velocidade_subida;
        
        // Reduz o tempo de ativação
        tempo_de_ativacao--;
    } else {
        // Dispara o alarme para destruir o objeto após 1 segundo
        alarm[1] = room_speed; // Define o alarme para destruir o objeto
    }
    
    // Troca de sprite após a animação atingir o frame 5
    if (image_index >= 5 && sprite_index == spr_star_bruta) { 
        sprite_index = spr_star_ativado; // Troca para o sprite `ativado`
        image_index = 0; // Reinicia a animação do novo sprite
        image_speed = 1; // Continua a animação
    }
}
