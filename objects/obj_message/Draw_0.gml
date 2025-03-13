if (mostra_message) {
    draw_set_font(fnt_message);
    var text_width = string_width(text1);
    var text_height = string_height(text1);
    var camera_x = camera_get_view_x(view_camera[0]);
    var camera_y = camera_get_view_y(view_camera[0]);
	 
    // Sombra do texto
    var shadow_offset = 2;
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_set_alpha(alpha);
    draw_text(camera_x + (view_wview[0] / 2) + shadow_offset - text_width / 2, 
              camera_y + (view_hview[0] / 2) + shadow_offset - text_height / 2, text1);
    
    // Texto principal
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_set_alpha(alpha);
    draw_text(camera_x + (view_wview[0] / 2) - text_width / 2, 
              camera_y + (view_hview[0] / 2) - text_height / 2, text1);
    
    // Restaurar cor e opacidade
    draw_set_color(c_white);
    draw_set_alpha(1);

    // Reduzir o alpha para desaparecer gradualmente
    tempo_decorrido += delta_time; // delta_time garante a contagem consistente ao longo do tempo

    // Fase de aumento de alpha
    if (tempo_decorrido < tempo_espera) {
        alpha = lerp(alpha, 1, 0.02); // Aumenta alpha gradualmente até 1
    }
    // Fase de redução de alpha
    else {
        // Reduzir o alpha gradualmente usando lerp
        alpha = lerp(alpha, 0, 0.02); // Interpola entre alpha atual e 0, com uma taxa de 0.02
    }

    if (alpha <= 0.01) { // Quando o alpha for bem próximo de 0, esconde a mensagem
        mostra_message = false;
    }
}