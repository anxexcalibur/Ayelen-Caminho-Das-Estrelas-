/// @description Desenha a interface de diálogo profissional (Versão Top-Down)

// Se a variável para inicializar não for verdadeira, não desenha nada.
if (!inicializar) {
    exit;
}

// Ativa a flag global de diálogo
global.dialogo = true;

// --- 1. Definições de Layout e Estilo ---
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Caixa de Diálogo Principal (AGORA NO TOPO)
var _caixa_h = 200; // Altura da caixa
var _caixa_y = 0;   // Posição Y no topo da tela

// Retrato do Personagem (Posição ajustada para "pendurar" abaixo da caixa)
var _retrato_sprite = texto_grid[# Infos.Retrato, pagina];
var _retrato_escala = 3.5;
var _retrato_w = sprite_get_width(_retrato_sprite) * _retrato_escala;
var _retrato_h = sprite_get_height(_retrato_sprite) * _retrato_escala;
// AJUSTE 1: Movendo o retrato mais para cima.
var _retrato_y = _caixa_y + _caixa_h - (_retrato_h / 1.2); // "Pendurado" mais alto

// Caixa de Nome do Personagem (Também ajustada)
var _nome = texto_grid[# Infos.Nome, pagina];
var _nome_box_h = 45;
var _nome_box_y = _caixa_y + _caixa_h; // Fica abaixo da caixa de diálogo

// Texto Principal
var _margem = 30; // Margem geral para o texto
var _texto_a_desenhar = string_copy(texto_grid[# Infos.Texto, pagina], 1, caractere);


// --- 2. Lógica de Posição (Esquerda ou Direita) ---
var _lado = texto_grid[# Infos.Lado, pagina];
var _retrato_x, _nome_box_x, _texto_x, _largura_max_texto;
var _nome_box_w = string_width(_nome) + 40; // Largura da caixa de nome

if (_lado == 0) { // Personagem na Esquerda
    _retrato_x = 20;
    // AJUSTE 2: Posição do nome padronizada
    _nome_box_x = _retrato_x + _retrato_w - _nome_box_w + 10;
    _texto_x = _retrato_x + _retrato_w + _margem;
    _largura_max_texto = _gui_w - _texto_x - _margem;
} else { // Personagem na Direita
    _retrato_x = _gui_w - _retrato_w - 20;
    // AJUSTE 2: Posição do nome espelhada
    _nome_box_x = _retrato_x - 10;
    _texto_x = _margem;
    _largura_max_texto = _gui_w - _retrato_w - (_margem * 3);
}


// --- 3. Desenho dos Elementos ---

// Desenha a Caixa de Diálogo Principal (fundo e borda)
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, _caixa_y, _gui_w, _caixa_y + _caixa_h, false);
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_rectangle(0, _caixa_y, _gui_w, _caixa_y + _caixa_h, true);

// Desenha a Borda do Retrato do Personagem
var _retrato_borda_espessura = 4;
draw_set_color(c_white); // Cor da borda: branca
draw_rectangle(
    _retrato_x - _retrato_borda_espessura, 
    _retrato_y - _retrato_borda_espessura, 
    _retrato_x + _retrato_w + _retrato_borda_espessura, 
    _retrato_y + _retrato_h + _retrato_borda_espessura, 
    false
);

// Desenha o Retrato do Personagem
if (sprite_exists(_retrato_sprite)) {
    draw_sprite_ext(_retrato_sprite, 0, _retrato_x + (_retrato_w / 2), _retrato_y + (_retrato_h / 2), _retrato_escala, _retrato_escala, 0, c_white, 1);
}

// Desenha a "Tag" de Nome do Personagem
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_roundrect_ext(_nome_box_x, _nome_box_y, _nome_box_x + _nome_box_w, _nome_box_y + _nome_box_h, 10, 10, false);
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_roundrect_ext(_nome_box_x, _nome_box_y, _nome_box_x + _nome_box_w, _nome_box_y + _nome_box_h, 10, 10, true);

// Desenha o Nome
draw_set_font(fnt_dialogo);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(_nome_box_x + (_nome_box_w / 2), _nome_box_y + (_nome_box_h / 2), _nome);

// Desenha o Texto Principal (com quebra de linha)
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(
    _texto_x,
    _caixa_y + _margem,
    _texto_a_desenhar,
    35, // Espaçamento entre as linhas
    _largura_max_texto
);

// Desenha o Indicador de "Continuar" (seta piscante)
var _texto_terminou = (caractere >= string_length(texto_grid[# Infos.Texto, pagina]));
if (_texto_terminou) {
    var _piscar = (get_timer() / 500000) % 2 < 1;
    if (_piscar) {
        draw_set_font(fnt_dialogo);
        // Posição agora é no canto inferior direito DA CAIXA DE TEXTO
        draw_text(_gui_w - _margem, _caixa_y + _caixa_h - _margem - 15, "▼");
    }
}

// NOVO AVISO DE SKIP NO CANTO INFERIOR DIREITO DA TELA
draw_set_font(-1); // Usa a fonte padrão, menor
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_text(_gui_w - _margem, _gui_h - _margem, "Skip [ESPAÇO]");


// --- 4. Reset Final ---
// Reseta todas as configurações de desenho para não afetar outros objetos
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
