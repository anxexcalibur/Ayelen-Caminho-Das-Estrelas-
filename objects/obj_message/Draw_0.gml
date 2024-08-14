if (mostra_message) {
    // Evento Draw do obj_message
    draw_set_font(fnt_message);

    // Calcula a largura e altura do texto
    var text_width = string_width(text);
    var text_height = string_height(text);

    // Posições da câmera
    var camera_x = camera_get_view_x(view_camera[0]);
    var camera_y = camera_get_view_y(view_camera[0]);

    // Sombra do Texto
    var shadow_offset = 2; // Deslocamento da sombra
    var shadow_color = make_color_rgb(0, 0, 0); // Cor da sombra (preto)

    // Desenhar sombra
    draw_set_color(shadow_color);
    draw_text(camera_x + (view_wview[0] / 2) + shadow_offset - text_width / 2, 
              camera_y + (view_hview[0] / 2) + shadow_offset - text_height / 2, text);

    // Texto Principal
    var main_color = make_color_rgb(46, 139, 87); // Verde Menta
    draw_set_color(main_color);
    draw_text(camera_x + (view_wview[0] / 2) - text_width / 2, 
              camera_y + (view_hview[0] / 2) - text_height / 2, text);

    // Restaurar cor e opacidade
    draw_set_color(c_white); // Restaura a cor padrão
    draw_set_alpha(1); // Restaura a opacidade
}
