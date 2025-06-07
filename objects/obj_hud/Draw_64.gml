if (player != noone && !player.morreu && !global.dialogo && !global.menu_existe) {
    // Margem para afastar da borda da tela
	

    var margem = 20;
    
    // --- Barra de vida no canto superior esquerdo ---
    var healthbar_width = 200;
    var healthbar_height = 30;
    var healthbar_x = margem +50;
    var healthbar_y = margem +50;

    draw_sprite(molduraHealthbar, 0, healthbar_x , healthbar_y);

    var barra_largura_atual = (player.vida_atual / player.max_vida) * healthbar_width;

    draw_sprite_stretched(sHealthbar, 0, healthbar_x, healthbar_y, barra_largura_atual, healthbar_height);

    draw_sprite(molduraHealthbar, 0, healthbar_x, healthbar_y);

    // Texto da vida, alinhado dentro da barra
    var texto_vida = string(player.vida_atual) + " / " + string(player.max_vida);
    var texto_x = healthbar_x + 40;
    var texto_y = healthbar_y + healthbar_height / 2 + 8;

    draw_set_font(fnt_gui);

    draw_set_color(c_black);
    draw_text(texto_x + 2, texto_y + 2, texto_vida);

    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x, texto_y, texto_vida);

    // Nome do player acima da barra, centralizado horizontalmente
    var nome_x = healthbar_x + healthbar_width / 2;
    var nome_y = healthbar_y - 25;

    draw_set_color(c_black);
    draw_text(nome_x + 2, nome_y + 2, "Ayelen");

    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(nome_x, nome_y, "Ayelen");

    // --- Texto HUD no canto inferior esquerdo ---

    // Pegamos altura total da GUI (tela/janela)
    var gui_height = display_get_gui_height();

    // Posição base do primeiro texto na parte inferior (com margem)
    var texto_x_hud = margem;
    var texto_y_hud = gui_height - margem;

    // Vamos desenhar de baixo para cima, com espaçamento vertical de 30px entre linhas

    // Projetil (embaixo)
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Projetil: " + string(global.balas));

    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Projetil: " + string(global.balas));

    // Pontuação (acima)
    texto_y_hud -= 30;
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Pontuação: " + string(global.pontuacao));

    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Pontuação: " + string(global.pontuacao));

    // Tempo do Dash (em cima)
    texto_y_hud -= 30;
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Tempo do Dash: " + string(global.dash_cooldown));

    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Tempo do Dash: " + string(global.dash_cooldown));

    // Reset padrão
    draw_set_color(c_white);
    draw_set_font(-1);
}
