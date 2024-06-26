if (!morreu) {
    // Desenha a barra de vida com a moldura
    draw_sprite(molduraHealthbar, 0, healthbar_x, healthbar_y);
    draw_sprite_stretched(sHealthbar, 0, healthbar_x, healthbar_y, (vida_atual / max_vida) * healthbar_width, healthbar_height);
    draw_sprite(molduraHealthbar, 0, healthbar_x, healthbar_y);

    // Definindo a posição do texto (nome) acima da barra de vida
    var nome_x = healthbar_x + (healthbar_width / 2);  // Centraliza o texto horizontalmente
    var nome_y = healthbar_y - 20;  // Ajusta a posição Y conforme necessário, acima da barra de vida

    // Define a fonte e o tamanho da letra
    draw_set_font(fnt_gui);  // Certifique-se de definir a fonte desejada na sua inicialização do jogo

    // Desenhando a sombra preta do nome "Ayelen"
    draw_set_color(c_black);  // Define a cor do texto para preto
    draw_text(nome_x + 2, nome_y + 2, "Ayelen");  // Desenha a sombra ligeiramente deslocada

    // Desenhando o nome "Ayelen" em verde claro acima da barra de vida
    draw_set_color(make_color_rgb(144, 238, 144));  // Define a cor do texto para verde claro
    draw_text(nome_x, nome_y, "Ayelen");

    // Desenhando o texto com o cooldown do dash
    var texto_x = 10;
    var texto_y = display_get_gui_height() - 30;  // Ajusta a posição Y conforme necessário

    // Desenhando a sombra azul escuro do texto do cooldown do dash
    draw_set_color(make_color_rgb(0, 0, 139));  // Define a cor da sombra para azul escuro
    draw_text(texto_x + 2, texto_y + 2, "Tempo do Dash: " + string(global.dash_cooldown));

    // Desenhando o texto do cooldown do dash em verde claro
    draw_set_color(make_color_rgb(144, 238, 144));  // Define a cor do texto para verde claro
    draw_text(texto_x, texto_y, "Tempo do Dash: " + string(global.dash_cooldown));

    // Desenhando a sombra azul escuro do texto da pontuação do jogador
    texto_y -= 40;  // Ajusta a posição Y para desenhar acima do cooldown
    draw_set_color(make_color_rgb(0, 0, 139));  // Define a cor da sombra para azul escuro
    draw_text(texto_x + 2, texto_y + 2, "Pontuação: " + string(global.pontuacao));

    // Desenhando o texto da pontuação do jogador em verde claro
    draw_set_color(make_color_rgb(144, 238, 144));  // Define a cor do texto para verde claro
    draw_text(texto_x, texto_y, "Pontuação: " + string(global.pontuacao));

    // Resetando as configurações de desenho se necessário
    draw_set_color(c_white);  // Redefine a cor do texto para a cor padrão
    draw_set_font(-1);
}
