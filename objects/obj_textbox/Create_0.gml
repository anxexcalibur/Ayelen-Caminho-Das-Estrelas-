/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento Alarm[0]
nome_max = 30;
alarm[0]=1;
draw_input_name = function()
{
	draw_set_color(c_white);
	draw_set_font(fnt_fonte);
	draw_set_halign(fa_center);

	// Desenha o texto "Por favor, entre com o seu nome"
	draw_text(room_width / 2, 64, "Por favor, entre com o seu nome");
	draw_set_font(-1);
	// Desenha o sprite da caixa de texto
	draw_sprite(spr_textbox, 0, x, y);
	draw_self();

	// Alinha o texto dentro da caixa de texto à esquerda
	draw_set_halign(fa_left);
	draw_text_color(x + 10, y + 15, keyboard_string, c_black, c_black, c_black, c_black, 1);

	// Desenha o cursor piscante
	if (alarm[0])
	{
	    draw_line_width(x + 10 + string_width(keyboard_string), y + 15, x + 10 + string_width(keyboard_string), y + 35, 3);
	}

	// Desenha o texto "Pressione Enter Para continuar" abaixo da caixa de texto
	draw_set_halign(fa_center); // Centraliza o texto horizontalmente
	draw_text(room_width / 2, y + sprite_height + 20, "Pressione Enter Para continuar");

}
