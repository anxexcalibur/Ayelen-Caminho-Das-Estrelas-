/// @description Desenha a interface da cutscene (imagem, caixa e texto)
if pode_desenhar{
	if (!mostrando_dialogo) {
	    exit;
	}

	// --- 1. Definição das Medidas e Posições ---
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	var _img_w = 480;
	var _img_h = 270;
	var _img_x = (_gui_w / 2) - (_img_w / 2);
	var _img_y = 40;
	var _caixa_h = 220;
	var _caixa_x = 0;
	var _caixa_y = _gui_h - _caixa_h;

	// --- 2. Desenho da Borda e da Imagem ---
	var _borda_espessura = 4;
	var _borda_cor = c_yellow;
	draw_set_color(_borda_cor);
	draw_rectangle(_img_x - _borda_espessura, _img_y - _borda_espessura, _img_x + _img_w + _borda_espessura, _img_y + _img_h + _borda_espessura, false);
	if (sprite_exists(imagem_dialogo)) {
	    draw_sprite_stretched(imagem_dialogo, 0, _img_x, _img_y, _img_w, _img_h);
	}

	// --- 3. Desenho da Caixa de Diálogo ---
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	draw_rectangle(_caixa_x, _caixa_y, _caixa_x + _gui_w, _caixa_y + _caixa_h, false);
	draw_set_alpha(1.0);
	draw_set_color(c_aqua);
	draw_rectangle(_caixa_x, _caixa_y, _caixa_x + _gui_w, _caixa_y + _caixa_h, true);

	// --- 4. Desenho do Texto ---
	draw_set_color(c_white);
	draw_set_font(fnt_cinematic);
	draw_set_halign(fa_left);   // Alinha à esquerda
	draw_set_valign(fa_top);    // Alinha no topo

	// Define a área onde o texto pode ser desenhado
	var _margem_texto = 40;
	var _texto_x = _caixa_x + _margem_texto;
	var _texto_y = _caixa_y + 30; // Margem superior interna
	var _largura_max_texto = _gui_w - (_margem_texto * 2); // Largura do texto com margens

	// Usa draw_text_ext para desenhar com quebra de linha automática
	draw_text_ext(
	    _texto_x,
	    _texto_y,
	    texto_atual,
	    35, // Espaçamento entre as linhas
	    _largura_max_texto // Largura máxima antes de quebrar a linha
	);


	// --- 5. Desenho das Mensagens de Ajuda (NOVO POSICIONAMENTO) ---
	var _margem_ajuda = 20;
	draw_set_valign(fa_bottom); // Alinha pela base do texto
	draw_set_font(-1); // Usa a fonte padrão (menor)

	// Mensagem para pular (canto inferior esquerdo)
	draw_set_halign(fa_left);
	draw_set_color(c_red);
	if (exibe == true) {
	    draw_text(_margem_ajuda, _gui_h - _margem_ajuda, "[ESC] para confirmar!");
	} else {
	    draw_text(_margem_ajuda, _gui_h - _margem_ajuda, "[ESC] para pular");
	}

	// Mensagem para continuar (canto inferior direito)
	draw_set_halign(fa_right);
	draw_set_color(c_yellow);
	draw_text(_gui_w - _margem_ajuda, _gui_h - _margem_ajuda, "Pressione [ESPAÇO] para continuar");

	// --- 6. Desenho da Transição (por cima de tudo) ---


	// --- 7. Reset Final ---
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}