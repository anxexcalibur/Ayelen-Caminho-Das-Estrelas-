
if (inicializar == true) {
	global.dialogo = true;
    var _gui = display_get_gui_width();
    var _guia = display_get_gui_height();

    var _xx = 0;
    var _yy = 0; // Alterando _yy para 0 desloca o retângulo para a parte superior da tela
    var _c = c_black;
	
    // Certifique-se de definir alpha antes de usá-lo
    
    var altura_retangulo = 100; // Defina a altura desejada do retângulo]

    // Calcula a altura da caixa de diálogo com base no texto
   
    var altura_caixa_dialogo = string_height_ext(texto_grid[# Infos.Texto, pagina], 32, _gui - 264);
	var _texto = string_copy(texto_grid[# Infos.Texto,pagina], 0,caractere);
	 
    // Lado Esquerdo
    var _sprite = texto_grid[# Infos.Retrato, pagina];
	var spr_width = sprite_get_width(_sprite) * 3.45;
    if (texto_grid[# Infos.Lado, pagina] == 0) {
        draw_rectangle_color(_xx + 200, _yy, _gui, _guia - 500, _c, _c, _c, _c, false);
        //Desenhando o nome 
		
		
		// Calcula o fator de escala para dimensionar o sprite
        var scale_factor = altura_caixa_dialogo / sprite_get_height(_sprite);
        // Aumente o fator de escala para tornar a imagem maior
        var novo_scale_factor = scale_factor * 2; // Ajuste este valor conforme necessário
        draw_sprite_ext(_sprite, 0,0, _yy , 3.45,3.45, 0, c_white, 1); // Dimensiona o sprite para o espaço entre a caixa de diálogo
        draw_set_color(c_red);
		draw_text((spr_width/3.5) ,4,texto_grid[# Infos.Nome,pagina]);
		draw_set_color(c_white);
        draw_text_ext(_xx + 232, _yy + 32, _texto, 32, _gui - 264);
    } else {
        var _stgw = string_width(texto_grid[# Infos.Nome, pagina]);
        draw_rectangle_color(_xx, _yy, _gui - 200, _guia - 500, _c, _c, _c, _c, false);
        // Calcula o fator de escala para dimensionar o sprite
        var scale_factor = altura_caixa_dialogo / sprite_get_height(_sprite);
        // Aumente o fator de escala para tornar a imagem maior
        var novo_scale_factor = scale_factor * 1.5; // Ajuste este valor conforme necessário
        draw_sprite_ext(_sprite, 0, _gui - 200, _yy , 3.45, 3.45, 0, c_white, 1); // Dimensiona o sprite para o espaço entre a caixa de diálogo
        draw_set_color(c_red);
		draw_text((_gui - 200)+((spr_width/3.5)), 4, texto_grid[# Infos.Nome, pagina]);
        draw_set_color(c_white);
		draw_text_ext(_xx + 32, _yy + 32, _texto, 32, _gui - 264);
    }
}
