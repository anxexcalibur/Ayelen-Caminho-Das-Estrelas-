if (mostrar_seta and !global.dialogo and !global.menu_existe) {
    // Define o nível de transparência com o fade effect
    draw_set_alpha(alpha_value);
    
    // Desenha a seta na posição correta com o índice correto
    draw_sprite(spr_seta, seta_indice, seta_x , seta_y - 30);
 
    // Reseta o nível de alpha para garantir que outros elementos não sejam afetados
    draw_set_alpha(1);
}
