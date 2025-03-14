// Verifica se o jogo acabou
if (game_over)
{
	
    // Pegando algumas informações sobre a câmera
    var x1 = camera_get_view_x(view_camera[0]); // Coordenada x da câmera
    var w = camera_get_view_width(view_camera[0]); // Largura da câmera
    var x2 = x1 + w; // Coordenada x final da câmera
    var meio_w = x1 + (w / 2); // Centro da câmera em relação ao eixo x
    var y1 = camera_get_view_y(view_camera[0]); // Coordenada y da câmera
    var h = camera_get_view_height(view_camera[0]); // Altura da câmera
    var y2 = y1 + h; // Coordenada y final da câmera
    var meio_h = y2 + h / 2; // Centro da câmera em relação ao eixo y
    
    var qtd = h * 0.15; // Quantidade para desenhar como 15% da tela
    
    valor = lerp(valor, 1, 0.05); // Interpola linearmente o valor atual para 1 com uma taxa de mudança de 0.05
    
    // Desenha um retângulo escuro sobre a tela para indicar o estado de "game over"
    draw_set_color(c_black); // Cor do desenho: preto
    draw_set_alpha(valor - 0.3); // Transparência do desenho um pouco menor que 'valor'
    draw_rectangle(x1, y1, x2, y2, false); // Retângulo cobrindo toda a tela
    
    // Desenha um retângulo mais escuro na parte superior da tela para dar destaque ao texto
    draw_set_alpha(1); // Restaura a transparência padrão
    draw_rectangle(x1, y1, x2, y1 + qtd * valor, false); // Retângulo na parte superior da tela
    
    // Desenha um retângulo mais escuro na parte inferior da tela para dar destaque ao texto
    draw_rectangle(x1, y2, x2, y2 - qtd * valor, false); // Retângulo na parte inferior da tela
    
    // Dando um delay para exibir "Game Over"
    if (valor >= .65)
    {
        contador = lerp(contador, 1, .01);
        draw_set_alpha(contador);
        
        // Calcula as coordenadas do centro da tela com base na posição da câmera
        var screen_center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
        var screen_center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
        
        // Define a fonte e o alinhamento para desenhar o texto "Game Over"
        draw_set_color(c_white); // Cor do texto: branco
        draw_set_font(fnt_game_over); // Fonte: "Game Over"
        draw_set_valign(fa_middle); // Alinhamento vertical: centralizado
        draw_set_halign(fa_center); // Alinhamento horizontal: centralizado
        
        // Desenha o texto "Game Over" com sombra
        draw_set_color(c_red); // Cor da sombra: vermelho
        draw_text(screen_center_x + 3, screen_center_y + 1, "Game Over"); // Sombra do texto "Game Over"
        draw_set_color(c_white); // Restaura a cor do texto para branco
        draw_text(screen_center_x, screen_center_y, "Game Over"); // Texto "Game Over"
        
        // Desenha o texto "Pressione ENTER para resetar o jogo" abaixo do texto "Game Over"
        draw_set_font(-1); // Restaura a fonte padrão
        draw_text(screen_center_x, screen_center_y + 50, "Pressione ENTER para resetar o jogo");
        
        // Restaura os ajustes de alinhamento
        draw_set_valign(-1); // Restaura o alinhamento vertical padrão
        draw_set_halign(-1); // Restaura o alinhamento horizontal padrão
    }
    
    // Restaura a transparência padrão após o desenho do "Game Over"
    draw_set_alpha(1);
}
else
{
    // Certifique-se de redefinir a transparência caso o jogo não esteja em estado de "game over"
    draw_set_alpha(1);
}
