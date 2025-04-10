/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Desenhar o texto na tela
if(desenha){
	draw_set_color(c_white);  // Cor do texto
	draw_set_alpha(alpha);  // Definir transparência do texto
	draw_text(obj_player.x, obj_player.y - 
	100, text);  // Desenhar o texto no centro da tela
	show_message("to desenhando")
	// Diminuir a opacidade enquanto a mensagem desaparece
	if (alpha > 0) {
	    alpha -= 0.05;  // Diminui a opacidade ao longo do tempo
		alarm[0] = 160
	}
}
