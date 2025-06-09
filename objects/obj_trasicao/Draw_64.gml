// Desenhar um retângulo na tela inteira no Draw GUI
draw_set_color(c_black);
draw_set_alpha(alpha); // alpha entre 0 e 1

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_color(c_white);
draw_set_alpha(1);
