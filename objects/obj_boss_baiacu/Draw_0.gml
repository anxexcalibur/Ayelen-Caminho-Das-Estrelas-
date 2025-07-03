// Evento Draw do chefe

// Desenha o sprite do chefe
draw_self();

// Calcula a posição da barra de vida
var barra_x = x;
var barra_y = y - sprite_height / 2 - 45; // Suba ainda mais a barra
var barra_largura = 100; // Largura constante da barra de vida
var barra_altura = 6;    // Diminua a altura da barra de vida

// Calcula a largura da parte preenchida com base na vida atual
var vida_percentual = vida_atual / max_vida;
vida_percentual = clamp(vida_percentual, 0, 1); // Garante que o percentual fique entre 0 e 1
var largura_vida = barra_largura * vida_percentual;

// Garante que a largura da barra não seja negativa
largura_vida = max(largura_vida, 0);

// Desenha a barra de fundo
draw_set_color(c_black);
draw_rectangle(barra_x - barra_largura / 2, barra_y - barra_altura / 2,
               barra_x + barra_largura / 2, barra_y + barra_altura / 2, false);

// Desenha a parte preenchida da barra
draw_set_color(c_red);
draw_rectangle(barra_x - barra_largura / 2, barra_y - barra_altura / 2,
               barra_x - barra_largura / 2 + largura_vida, barra_y + barra_altura / 2, false);

// Adiciona o texto "Rei Baiacu" acima da barra
var texto = "Rei Baiacu";
var cor_texto = c_lime; // Verde para o texto
var cor_sombra = c_blue; // Azul para a sombra
var fonte = fnt_gui; // Certifique-se de definir a fonte desejada

// Configura a fonte
draw_set_font(fonte);

// Calcula a largura e altura do texto
var texto_largura = string_width(texto);
var texto_altura = string_height(texto);

// Calcula a posição do texto
var texto_x = barra_x - barra_largura / 2; // Alinhado ao início da barra
var texto_y = barra_y - barra_altura - 10; // Posição acima da barra

// Desenha a sombra do texto
draw_set_color(cor_sombra);
draw_text(texto_x + 2, texto_y + 2, texto); // Desenha a sombra com deslocamento

// Desenha o texto principal
draw_set_color(cor_texto);
draw_text(texto_x, texto_y, texto); // Desenha o texto na posição desejada
// Se o timer da fala estiver ativo, desenha o texto
if (fala_timer > 0) {
    // Configurações da fonte e cor
    draw_set_font(fnt_dialogo); // Troque para o nome da sua fonte
    draw_set_color(c_white);
    draw_set_halign(fa_center); // Alinha o texto no centro
    draw_set_valign(fa_bottom);  // Alinha pela base

    // Posição do texto (acima da cabeça do chefe)
    var _draw_x = x;
    var _draw_y = bbox_top - 20; // 10 pixels acima da caixa de colisão

    // Desenha o texto com uma borda preta para melhor leitura
    draw_set_color(c_black);
    draw_text(_draw_x + 1, _draw_y, fala_atual);
    draw_text(_draw_x - 1, _draw_y, fala_atual);
    draw_text(_draw_x, _draw_y + 1, fala_atual);
    draw_text(_draw_x, _draw_y - 1, fala_atual);
    
    draw_set_color(c_white);
    draw_text(_draw_x, _draw_y, fala_atual);
    
    // Reseta o alinhamento para não afetar outros textos no jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}