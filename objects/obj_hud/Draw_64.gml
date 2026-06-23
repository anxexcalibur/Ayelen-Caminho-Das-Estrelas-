var _draw_hud = !instance_exists(obj_trasicao) && instance_exists(obj_player) && !global.dialogo  and !instance_exists(obj_transicao_2) and !global.menu_existe and !obj_controller.game_over
if (_draw_hud) { 
    var margem = 20;
	var _player = obj_player
    
    // --- Barra de vida (MANTIDA EXATAMENTE IGUAL) ---
    var healthbar_width = 200;
    var healthbar_height = 30;
    var healthbar_x = margem + 50;
    var healthbar_y = margem + 50;

    draw_sprite(molduraHealthbar, 0, healthbar_x, healthbar_y);

    var barra_largura_atual = (_player.vida_atual / _player.max_vida) * healthbar_width;

    draw_sprite_stretched(sHealthbar, 0, healthbar_x, healthbar_y, barra_largura_atual, healthbar_height);

    draw_sprite(molduraHealthbar, 0, healthbar_x, healthbar_y);

    var texto_vida = string(_player.vida_atual) + " / " + string(_player.max_vida);
    var texto_x = healthbar_x + 40;
    var texto_y = healthbar_y + healthbar_height / 2 + 8;

    draw_set_font(fnt_gui);
    draw_set_color(c_black);
    draw_text(texto_x + 2, texto_y + 2, texto_vida);
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x, texto_y, texto_vida);

    var nome_x = healthbar_x + healthbar_width / 2;
    var nome_y = healthbar_y - 25;

    draw_set_color(c_black);
    draw_text(nome_x + 2, nome_y + 2, "Ayelen");
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(nome_x, nome_y, "Ayelen");

    // --- HUD INFERIOR (COM TOQUE INDÍGENA SUTIL) ---
    var gui_height = display_get_gui_height();
    var texto_x_hud = margem;
    var texto_y_hud = gui_height - margem;

    // Símbolo de pena antes do texto (sutil)
    draw_set_color(make_color_rgb(218, 165, 32)); // dourado
    draw_text(texto_x_hud - 15, texto_y_hud - 20, "⚡");
    
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Insígnias: " + string(global.estrelas_coletadas));
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Insígnias: " + string(global.estrelas_coletadas));

    texto_y_hud -= 30;
    
    // Símbolo de contas/pontos
    draw_set_color(make_color_rgb(205, 133, 63)); // cor de argila
    draw_text(texto_x_hud - 15, texto_y_hud - 20, "●");
    
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Pontuação: " + string(global.pontuacao));
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Pontuação: " + string(global.pontuacao));

    texto_y_hud -= 30;
    
    // Símbolo de flecha
    draw_set_color(make_color_rgb(139, 69, 19)); // marrom terra
    draw_text(texto_x_hud - 15, texto_y_hud - 20, "➤");
    
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Dash: " + string(global.dash_cooldown));
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Dash: " + string(global.dash_cooldown));

    texto_y_hud -= 30;
    
    // Símbolo de dardo
    draw_set_color(make_color_rgb(160, 82, 45)); // madeira
    draw_text(texto_x_hud - 15, texto_y_hud - 20, "🏹");
    
    draw_set_color(make_color_rgb(0, 0, 139));
    draw_text(texto_x_hud + 2, texto_y_hud - 20 + 2, "Tiros: " + string(_player.qtd_tiros));
    draw_set_color(make_color_rgb(144, 238, 144));
    draw_text(texto_x_hud, texto_y_hud - 20, "Tiros: " + string(_player.qtd_tiros));
    
    draw_set_color(c_white);
    draw_set_font(-1);
}