/// @description Desenha a interface da cutscene (imagem, caixa e texto)
if (!pode_desenhar || !mostrando_dialogo) {
    exit;
}

// --- 1. Configurações e Constantes ---
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Configurações da imagem
var _img_w = 480;
var _img_h = 270;
var _img_x = (_gui_w / 2) - (_img_w / 2);
var _img_y = 40;

// Configurações da caixa de diálogo
var _caixa_h = 180; // Reduzida para melhor proporção
var _caixa_y = _gui_h - _caixa_h;
var _caixa_cor_fundo = make_color_rgb(10, 10, 30); // Azul escuro em vez de preto puro
var _caixa_alpha = 0.85;

// Configurações do texto
var _margem_texto = 50;
var _texto_x = _margem_texto;
var _texto_y = _caixa_y + 25;
var _largura_max_texto = _gui_w - (_margem_texto * 2);
var _espacamento_linha = 38;
var _cor_texto = c_white;

// --- 2. Desenho da Imagem com Borda Estilizada ---
if (sprite_exists(imagem_dialogo)) {
    // Sombra da imagem
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(_img_x + 4, _img_y + 4, _img_x + _img_w + 4, _img_y + _img_h + 4, false);
    
    // Borda decorativa
    draw_set_color(c_yellow);
    draw_set_alpha(1.0);
    var _borda_espessura = 3;
    draw_rectangle(_img_x - _borda_espessura, _img_y - _borda_espessura, 
                   _img_x + _img_w + _borda_espessura, _img_y + _img_h + _borda_espessura, true);
    
    // Cantos decorativos
    var _canto_tam = 8;
    draw_set_color(c_white);
    draw_line(_img_x - _borda_espessura, _img_y - _borda_espessura, 
              _img_x - _borda_espessura + _canto_tam, _img_y - _borda_espessura);
    draw_line(_img_x - _borda_espessura, _img_y - _borda_espessura, 
              _img_x - _borda_espessura, _img_y - _borda_espessura + _canto_tam);
    
    // Imagem principal
    draw_sprite_stretched(imagem_dialogo, 0, _img_x, _img_y, _img_w, _img_h);
}

// --- 3. Desenho da Caixa de Diálogo Aprimorada ---
// Fundo com gradiente vertical simulado
var _num_steps = 10;
for (var i = 0; i < _num_steps; i++) {
    var _step_alpha = _caixa_alpha - (i * 0.02);
    var _step_y = _caixa_y + (i * _caixa_h / _num_steps);
    var _step_h = _caixa_h / _num_steps;
    
    draw_set_color(merge_color(_caixa_cor_fundo, c_black, i / _num_steps));
    draw_set_alpha(_step_alpha);
    draw_rectangle(0, _step_y, _gui_w, _step_y + _step_h, false);
}

// Linha superior decorativa
draw_set_alpha(1.0);
draw_set_color(c_aqua);
draw_rectangle(0, _caixa_y - 2, _gui_w, _caixa_y, false);
draw_set_color(c_yellow);
draw_rectangle(0, _caixa_y, _gui_w, _caixa_y + 1, false);

// Borda da caixa
draw_set_color(c_aqua);
draw_rectangle(0, _caixa_y, _gui_w, _caixa_y + _caixa_h, true);

// --- 4. Desenho do Texto com Efeitos ---
draw_set_font(fnt_cinematic);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Sombra do texto para melhor legibilidade
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_text_ext(
    _texto_x + 1,
    _texto_y + 1,
    texto_atual,
    _espacamento_linha,
    _largura_max_texto
);

// Texto principal
draw_set_color(_cor_texto);
draw_set_alpha(1.0);
draw_text_ext(
    _texto_x,
    _texto_y,
    texto_atual,
    _espacamento_linha,
    _largura_max_texto
);

// --- 5. Indicador de Progresso do Texto (NOVO) ---
if (string_length(texto_atual) > 0) {
    var _indicador_x = _texto_x;
    var _indicador_y = _texto_y + 10;
    var _texto_total = 1; // Substitua pelo total de textos da cutscene
    var _texto_atual_num = 1; // Substitua pelo índice atual
    
    draw_set_color(c_yellow);
    draw_set_alpha(0.6);
    draw_set_font(-1);
    draw_set_halign(fa_right);
    draw_text(_gui_w - _margem_texto, _caixa_y + 10, 
              string(_texto_atual_num) + " / " + string(_texto_total));
}

// --- 6. Indicador de "Continuar" Animado (NOVO) ---
var _piscar = (sin(current_time * 0.005) + 1) * 0.5; // Efeito de piscar
draw_set_color(c_yellow);
draw_set_alpha(0.5 + _piscar * 0.5);
draw_set_font(-1);
draw_set_halign(fa_center);

// Triângulo apontando para baixo
var _tri_x = _gui_w / 2;
var _tri_y = _caixa_y + _caixa_h - 25;
var _tri_size = 8;
draw_triangle(_tri_x - _tri_size, _tri_y - _tri_size, 
              _tri_x + _tri_size, _tri_y - _tri_size, 
              _tri_x, _tri_y + _tri_size, false);

// --- 7. Controles de Ajuda com Melhor Layout ---
draw_set_alpha(1.0);
var _margem_ajuda = 25;

// Caixa de fundo para os controles (esquerda)
draw_set_color(c_black);
draw_set_alpha(0.5);
var _ctrl_box_w = 220;
var _ctrl_box_h = 35;
draw_roundrect(_margem_ajuda - 5, _gui_h - _margem_ajuda - _ctrl_box_h, 
               _margem_ajuda + _ctrl_box_w, _gui_h - _margem_ajuda + 5, false);

// Texto de controle esquerdo
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(-1);
if (exibe == true) {
    draw_set_color(c_red);
    draw_text(_margem_ajuda, _gui_h - _margem_ajuda, "[ESC] Confirmar");
} else {
    draw_set_color(c_red);
    draw_text(_margem_ajuda, _gui_h - _margem_ajuda, "[ESC] Pular");
}

// Caixa de fundo para os controles (direita)
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect(_gui_w - _margem_ajuda - _ctrl_box_w, _gui_h - _margem_ajuda - _ctrl_box_h, 
               _gui_w - _margem_ajuda + 5, _gui_h - _margem_ajuda + 5, false);

// Texto de controle direito
draw_set_halign(fa_right);
draw_set_color(c_yellow);
draw_text(_gui_w - _margem_ajuda, _gui_h - _margem_ajuda, "[ESPAÇO] Continuar");

// --- 8. Reset Final ---
draw_set_alpha(1.0);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);