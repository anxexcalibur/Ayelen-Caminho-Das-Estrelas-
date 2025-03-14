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
    // delta_time garante a contagem consistente ao longo do tempo

    // Fase de aumento de alpha
   
}