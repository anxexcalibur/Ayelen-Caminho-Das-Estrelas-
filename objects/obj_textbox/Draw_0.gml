/// @description Desenha o Céu e a Tela de UI

// ═══════════════════════════════════════
// CAMADA RETRO: DESENHAR CONSTELAÇÕES (FUNDO)
// ═══════════════════════════════════════
for (var j = 0; j < total_nos; j++) {
    for (var k = j + 1; k < total_nos; k++) {
        var _dist = point_distance(no_x[j], no_y[j], no_x[k], no_y[k]);
        if (_dist < 120) {
            var _line_alpha = (1 - (_dist / 120)) * ((no_alpha[j] + no_alpha[k]) / 2) * 0.4;
            draw_set_alpha(_line_alpha);
            // Alterado para c_aqua 👇
            draw_line_color(no_x[j], no_y[j], no_x[k], no_y[k], c_aqua, c_aqua);
        }
    }
}

for (var j = 0; j < total_nos; j++) {
    draw_set_alpha(no_alpha[j]);
    draw_rectangle_color(no_x[j] - 1, no_y[j] - 1, no_x[j] + 1, no_y[j] + 1, c_white, c_white, c_white, c_white, false);
    // Alterado para c_aqua 👇
    draw_point_color(no_x[j], no_y[j] - 2, c_aqua);
    draw_point_color(no_x[j], no_y[j] + 2, c_aqua);
    draw_point_color(no_x[j] - 2, no_y[j], c_aqua);
    draw_point_color(no_x[j] + 2, no_y[j], c_aqua);
}

// ═══════════════════════════════════════
// CAMADA RETRO: DESENHAR ESTRELAS COMUNS (FUNDO)
// ═══════════════════════════════════════
for (var i = 0; i < total_estrelas; i++) {
    draw_set_alpha(estrela_alpha[i]);
    if (estrela_tamanho[i] == 1) {
        draw_point_color(estrela_x[i], estrela_y[i], c_white);
    } else {
        draw_rectangle_color(estrela_x[i], estrela_y[i], estrela_x[i] + 1, estrela_y[i] + 1, c_white, c_white, c_white, c_white, false);
    }
}

// Restaura o Alpha para 1 antes de desenhar os elementos de texto e caixas
draw_set_alpha(1);

// ═══════════════════════════════════════
// DESENHO DA INTERFACE (POR CIMA DAS ESTRELAS)
// ═══════════════════════════════════════
if (passo == 0) {
    draw_input_name();
} else if (passo == 1) {
    draw_select_difficulty();
}