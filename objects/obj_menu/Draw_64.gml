/// @description Desenho do Menu e Efeito Estelar

// ==========================================
// 1. CENÁRIO E TÍTULO POR CÓDIGO (Apenas no rm_menu)
// ==========================================
if (room == rm_menu) {
    
    // Camada 1: Desenha o seu fundo personalizado importado por fora
    if (sprite_exists(menu_back)) {
        draw_sprite_ext(menu_back, 0, 0, 0, 1, 1, 0, c_white, 1);
    }

    // Camada 2: Desenha as estrelas fixas piscando (Bloqueadas apenas na região do céu roxo)
    if (variable_instance_exists(id, "estrelas")) {
        var _limite_ceu_draw_y = room_height * 0.42; // Linha do horizonte para não cobrir as árvores
        
        for (var i = 0; i < max_estrelas; i++) {
            var _x = estrelas[i].x;
            var _y = estrelas[i].y;
            var _alpha = estrelas[i].brilho;
            
            // Só renderiza se a estrela estiver na parte de cima do cenário
            if (_y < _limite_ceu_draw_y) {
                draw_set_alpha(_alpha);
                draw_rectangle_color(_x, _y, _x + 2, _y + 2, c_white, c_white, c_white, c_white, false);
            }
        }
        draw_set_alpha(1); // Sempre reseta o alpha global após o loop
    }
    
    // Camada 3: Título Avançado Gigante Centralizado
    draw_set_halign(fa_center);
    draw_set_font(fnt_game_over); 
    
    var _titulo_x = room_width / 2;
    var _titulo_y = 40; // Puxado bem para o topo para dar espaço ao menu
    
    // Definição das Cores do Degradê do Título (Verde Esmeralda/Nativo)
    var _v_topo = make_color_rgb(80, 220, 120);   // Verde claro brilhante para o topo
    var _v_base = make_color_rgb(15, 110, 50);    // Verde escuro para a base
    
    // ESCALA DO TÍTULO: Multiplica o tamanho da fonte por 3x para ficar gigante
    var _escala_titulo = 3.0; 
    
    // A) Sombra Preta atrás do "Ayelen"
    draw_set_color(c_black);
    draw_text_transformed(_titulo_x + 4, _titulo_y + 4, "Ayelen", _escala_titulo, _escala_titulo, 0);
    
    // B) Texto Principal "Ayelen" com o degradê vertical solicitado (8 argumentos)
    draw_text_transformed_color(_titulo_x, _titulo_y, "Ayelen", _escala_titulo, _escala_titulo, 0, _v_topo, _v_topo, _v_base, _v_base, 1);
    
    // C) A Linha Horizontal dividida em duas metades (7 argumentos cada)
    var _linha_y = _titulo_y + 95; 
    var _linha_largura = 320;      
    
    // Metade Esquerda: Vai do preto nas pontas até o verde no centro
    draw_line_width_color(_titulo_x - _linha_largura, _linha_y, _titulo_x, _linha_y, 3, c_black, _v_topo);
    // Metade Direita: Vai do verde no centro até o preto nas pontas
    draw_line_width_color(_titulo_x, _linha_y, _titulo_x + _linha_largura, _linha_y, 3, _v_topo, c_black);
    
    // D) Subtítulo: e o Caminho das Estrelas
    var _sub_y = _linha_y + 20; 
    var _escala_sub = 1.5; // Subtítulo escalado proporcionalmente
    
    // Sombra Preta do subtítulo
    draw_set_color(c_black);
    draw_text_transformed(_titulo_x + 2, _sub_y + 2, "e o Caminho das Estrelas", _escala_sub, _escala_sub, 0);
    // Texto Branco Estelar
    draw_set_color(c_white);
    draw_text_transformed(_titulo_x, _sub_y, "e o Caminho das Estrelas", _escala_sub, _escala_sub, 0);
    
    // Reseta o alinhamento padrão para não afetar o desenho original do menu na esquerda
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}

// ==========================================
// 2. SEU FLUXO ORIGINAL DO MENU (Intocado)
// ==========================================
if !instance_exists(obj_transicao_2) {
    if global.menu_existe {
        desenha_menu(menus[pag]);
        
        if instance_exists(obj_dialogo) {
            with (obj_dialogo) {
                global.dialogo = false; 
                instance_destroy();     
            }
        }
    }
}