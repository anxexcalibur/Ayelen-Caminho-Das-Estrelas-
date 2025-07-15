/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
tamanho =sprite_get_width(spr_qudr)
cols = ceil(display_get_gui_width() / tamanho)
lins = ceil(display_get_gui_height()/ tamanho)
destino = noone;
destino_x = undefined;
destino_y = undefined;
direcao = true

img = 0;

img_vel = sprite_get_speed(spr_qudr) /game_get_speed(gamespeed_fps);

img_num = sprite_get_number(spr_qudr)-1;