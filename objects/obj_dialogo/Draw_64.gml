if (inicializar == true) {
    global.dialogo = true;
	
    var _gui = display_get_gui_width();
    var _guia = display_get_gui_height();

    var _xx = 0;
    var _yy = 0; // Alterando _yy para 0 desloca o retângulo para a parte superior da tela
    var _c = make_color_rgb(139, 69, 19); // Definindo o tom de bege (parecendo papel velho)

    // Altura do retângulo configurada para ser igual à altura do rosto (64px)
    var altura_retangulo = 220; // Ajustando para a altura do rosto

    // Calcula a altura da caixa de diálogo com base no texto
    var altura_caixa_dialogo = string_height_ext(texto_grid[# Infos.Texto, pagina], 32, _gui - 264);
    var _texto = string_copy(texto_grid[# Infos.Texto, pagina], 0, caractere);

    // Lado Esquerdo
    var _sprite = texto_grid[# Infos.Retrato, pagina];
    var spr_width = sprite_get_width(_sprite) * 3.45;

    // Define a fonte para o texto
    draw_set_font(fnt_dialogo);

    if (texto_grid[# Infos.Lado, pagina] == 0) {
        // Desenha o retângulo com a altura ajustada
        draw_rectangle_color(_xx + 200, _yy, _gui, altura_retangulo , _c, _c, _c, _c, false);

        // Calcula o fator de escala para dimensionar o sprite
        var scale_factor = altura_caixa_dialogo / sprite_get_height(_sprite);
        var novo_scale_factor = scale_factor * 2; // Ajuste este valor conforme necessário

        // Desenha o sprite dimensionado
        draw_sprite_ext(_sprite, 0, 100, _yy + 110, 3.45, 3.45, 0, c_white, 1);

        draw_set_color(c_black); // Cor do texto em preto para bom contraste
        draw_text((spr_width / 3.5), 4, texto_grid[# Infos.Nome, pagina]);
        draw_set_color(c_white);
        draw_text_ext(_xx + 232, _yy + 32, _texto, 32, _gui - 264);
    } else {
		
        var _stgw = string_width(texto_grid[# Infos.Nome, pagina]);

        // Desenha o retângulo com a altura ajustada
        draw_rectangle_color(_xx, _yy, _gui - 200, _yy + altura_retangulo, _c, _c, _c, _c, false);

        // Calcula o fator de escala para dimensionar o sprite
        var scale_factor = altura_caixa_dialogo / sprite_get_height(_sprite);
        var novo_scale_factor = scale_factor * 1.5; // Ajuste este valor conforme necessário

        // Desenha o sprite dimensionado
        draw_sprite_ext(_sprite, 0, _gui - 100 , _yy + 110, 3.45, 3.45, 0, c_white, 1);

        draw_set_color(c_black); // Cor do texto em preto para bom contraste
        draw_text((_gui - 200) + ((spr_width / 3.5)), 4, texto_grid[# Infos.Nome, pagina]);
        draw_set_color(c_white);
        draw_text_ext(_xx + 32, _yy + 32, _texto, 32, _gui - 264);
    }

    // Redefine a fonte para evitar interferências no restante do jogo
    draw_set_font(-1);
}else{
	
}
