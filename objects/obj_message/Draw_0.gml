if (mostra_message && alpha > 0.01) {
    var camera_x = camera_get_view_x(view_camera[0]);
    var camera_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);
    var centro_x = camera_x + cam_w / 2;
    var centro_y = camera_y + cam_h / 2;

    draw_set_font(fnt_message);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var _largura_max = cam_w * 0.7;
    var _texto_completo = text1;
    if (variable_instance_exists(id, "text2") && text2 != "" && text2 != undefined) {
        _texto_completo += "\n" + text2;
    }

    var _texto_largura = string_width(_texto_completo);
    var _texto_altura = string_height_ext(_texto_completo, 22, _largura_max);

    var _pad = 16;
    var _balao_x1 = centro_x - _texto_largura / 2 - _pad;
    var _balao_y1 = centro_y - _texto_altura / 2 - _pad;
    var _balao_x2 = centro_x + _texto_largura / 2 + _pad;
    var _balao_y2 = centro_y + _texto_altura / 2 + _pad;

    draw_set_alpha(alpha * 0.85);
    draw_set_color(make_color_rgb(20, 10, 40));
    draw_rectangle(_balao_x1, _balao_y1, _balao_x2, _balao_y2, false);

    draw_set_alpha(alpha * 0.9);
    draw_set_color(make_color_rgb(60, 30, 80));
    draw_rectangle(_balao_x1, _balao_y1, _balao_x2, _balao_y2, true);

    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_text_ext(centro_x + 1, centro_y + 1, _texto_completo, 22, _largura_max);
    draw_set_color(make_color_rgb(255, 220, 150));
    draw_text_ext(centro_x, centro_y, _texto_completo, 22, _largura_max);

    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
