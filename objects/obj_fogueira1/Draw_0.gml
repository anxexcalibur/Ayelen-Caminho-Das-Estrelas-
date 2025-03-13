
if (place_meeting(x, y, obj_player) and obj_player.etapa_historia == 3) { 
	// Verifica se o player está tocando o objeto
    var text_width = string_width("Pressione F para começar o ritual"); // Largura do texto
    var center_x = obj_fogueira1.x - text_width / 2; // Centraliza o texto com base no obj_fogueira
    
    draw_set_color(c_lime); // Define a cor verde
    draw_set_font(fnt_dialogo); // Fonte para o texto
    draw_text(center_x +40, y - 30, "Pressione F para começar o ritual"); // Desenha o texto
}
draw_set_font(-1);
draw_set_color(-1);// Fonte para o texto
draw_self();