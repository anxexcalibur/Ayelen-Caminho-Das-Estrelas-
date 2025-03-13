if (mostrando_dialogo) {
    // Tamanho da imagem
    var imagem_largura = 320;
    var imagem_altura = 320;

    // Centraliza a imagem
    var imagem_x = display_get_width() / 2;
    var imagem_y = display_get_height() / 2 - imagem_altura / 2;

    // Desenha a imagem de fundo
    draw_sprite_ext(
        imagem_dialogo, 0, imagem_x, imagem_y, 
        imagem_largura / sprite_get_width(imagem_dialogo), 
        imagem_altura / sprite_get_height(imagem_dialogo), 
        0, c_white, 1
    );

    // Configurações de texto
    draw_set_color(c_white);
    draw_set_halign(fa_middle);
    draw_set_font(fnt_cinematic); // Define a fonte personalizada

    // Margens para o texto dentro da imagem
    var margem_horizontal = 20;
    var margem_vertical = 20;
    var largura_texto = (imagem_largura - 2 * margem_horizontal) * 2;

    // Posição inicial do texto
    var texto_x = imagem_x;
    var texto_y = imagem_y + margem_vertical;

    // Controlando o texto para evitar duplicação
    var texto_parcial = string_copy(dialogos[dialogo_atual].texto, 1, indice);
    
    // Quebra o texto em múltiplas linhas, se necessário
    var linhas = string_width_ext_wrap(texto_parcial, largura_texto, 0);

    // Desenha o texto centralizado dentro da imagem
    for (var i = 0; i < array_length(linhas); i++) {
        draw_text(texto_x, texto_y + 160, linhas[i]);
		
        texto_y += string_height(linhas[i]) + 8;  // Espaçamento entre as linhas
    }

    // Exibe mensagem de pular
    draw_set_color(c_yellow);
    draw_set_halign(fa_right);
    draw_text(imagem_x + 120, texto_y + 190, "Pressione space para completar");
	draw_set_color(c_red);
	
	if exibe == true{
		draw_text(imagem_x + 80, texto_y + 230, "Esc para confirmar!");
	}else{
		draw_text(imagem_x + 40, texto_y + 230, "Esc to skip");
	}
	
    draw_set_font(-1);
}
