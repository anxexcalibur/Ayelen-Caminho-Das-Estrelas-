draw_set_alpha(alpha);
draw_set_color(c_white);

// Verifica se o texto está vazio
if (text != "") {
    draw_set_font(fnt_message);
    draw_text(room_width / 2, room_height / 2, text);
} else {
    draw_text(room_width / 2, room_height / 2, "Texto não definido"); // Mensagem de debug
}

draw_set_alpha(1);