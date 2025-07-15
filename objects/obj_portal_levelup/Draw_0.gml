/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Desenha o portal normalmente
draw_self();

// Se o jogador estiver colidindo, desenha a mensagem acima do portal
if (show_draw) {
    var x_text = x;
    var y_text = y - 120; // Posição acima do portal

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(x_text, y_text, "W");
	 draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_color(-1);
}
