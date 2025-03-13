// Transparência animada entre 0.7 e 1
var opacidade = 0.7 + 0.3 * sin(current_time / 500);

// Configurando a transparência antes de desenhar
draw_set_alpha(clamp(opacidade, 0, 1));

// Reduz o tamanho do sprite e desenha acima do objeto
var escala = 0.5; // Tamanho ajustado do sprite
draw_sprite_ext(sprite_index, 0, x, y_pos_interrogacao + y_offset, escala, escala, 0, c_white, opacidade);

// Resetando a transparência
draw_set_alpha(1);
