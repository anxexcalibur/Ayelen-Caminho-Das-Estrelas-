if (mostrar_seta) {
    // Define o nível de transparência com o fade effect
    draw_set_alpha(alpha_value);
    
    // Desenha a seta na posição correta com o índice correto
    draw_sprite(spr_seta, seta_indice, seta_x , seta_y - 60);
 
    // Reseta o nível de alpha para garantir que outros elementos não sejam afetados
    draw_set_alpha(1);
}
