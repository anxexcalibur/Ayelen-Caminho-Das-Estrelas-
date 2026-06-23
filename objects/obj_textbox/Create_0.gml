/// @description Inicialização de Variáveis
nome_max = 30;
aperto_enter = 0;
alarm[0] = 1;

// Variáveis de controle de fluxo
passo = 0; // 0 = Nome, 1 = Dificuldade
dificuldade_sel = 1; // Começa no Normal (Índice 1)
opcoes_dificuldade = ["Fácil", "Normal", "Difícil", "Impossível"];

// Trava para o Enter
pode_confirmar_dificuldade = false;
volta_menu = function(){
    // Para qualquer som de fundo
    if (audio_is_playing(snd_background)) {
        audio_stop_sound(snd_background);
    }
    
    // Reseta o obj_sound
    if (instance_exists(obj_sound)) {
        obj_sound.musica_atual = "none";
        obj_sound.musica_menu_tempo = 0;
    }
    
    // Destrói o player se existir
    if (instance_exists(obj_player)) {
        instance_destroy(obj_player);
    }
    
    // Cria transição para o menu
    var _trans = instance_create_layer(0, 0, "transicao", obj_transicao_2);
    _trans.destino = rm_menu;
    _trans.direcao = true;
    _trans.img = 0;
}
// ==============================================================================
// FUNÇÃO 1: INPUT DO NOME (Sua função original - Apenas Desenho)
// ==============================================================================
draw_input_name = function() {
    draw_set_color(c_white);
    draw_set_font(fnt_fonte);
    draw_set_halign(fa_center);

    draw_text(room_width / 2, 64, "Por favor, entre com o seu nome");
    draw_set_font(-1);
    
    draw_sprite(spr_textbox, 0, x, y);
    draw_self();

    draw_set_halign(fa_left);
    draw_text_color(x + 10, y + 15, keyboard_string, c_black, c_black, c_black, c_black, 1);

    if (alarm[0]) {
        draw_line_width(x + 10 + string_width(keyboard_string), y + 15, x + 10 + string_width(keyboard_string), y + 35, 3);
    }

    draw_set_halign(fa_center); 
    draw_set_color(c_red);
    draw_text(room_width / 2, y + sprite_height, "No mínimo 3 Caracter");
    draw_set_color(-1)
    draw_text(room_width / 2, y + sprite_height + 40, "Pressione Enter Para continuar");
    
    global.player_name = keyboard_string;
    show_debug_message(global.name_input_active)
}
// ═══════════════════════════════════════
// INICIALIZAÇÃO DAS ESTRELAS E CONSTELAÇÕES
// ═══════════════════════════════════════
total_estrelas = 60;
for (var i = 0; i < total_estrelas; i++) {
    estrela_x[i] = random(room_width);
    estrela_y[i] = random(room_height * 0.65); // Evita a parte das árvores
    estrela_alpha[i] = random(1);
    estrela_vel[i] = random_range(0.01, 0.03);
    estrela_tamanho[i] = choose(1, 2); 
}

total_nos = 12; // Pontos das constelações
for (var j = 0; j < total_nos; j++) {
    no_x[j] = random_range(50, room_width - 50);
    no_y[j] = random_range(30, room_height * 0.5);
    no_alpha[j] = random_range(0.3, 0.8);
    no_vel[j] = random_range(0.005, 0.015);
}
// ==============================================================================
// FUNÇÃO 2: SELEÇÃO DE DIFICULDADE (Apenas Desenho - Sem Teclado aqui)
// ==============================================================================
draw_select_difficulty = function() {
    draw_set_color(c_white);
    draw_set_font(fnt_fonte);
    draw_set_halign(fa_center);

    draw_text(room_width / 2, 64, "Escolha a Dificuldade");
    
    // Espaçamento bruto bem grande (250 pixels de distância entre cada uma)
    var _total_opcoes = array_length(opcoes_dificuldade);
    var _espaco_entre_opcoes = 250; 
    var _largura_total_bloco = (_total_opcoes - 1) * _espaco_entre_opcoes;
    var _x_inicial = (room_width / 2) - (_largura_total_bloco / 2);

    for (var i = 0; i < _total_opcoes; i++) {
        var _cor = c_gray;
        var _texto = opcoes_dificuldade[i];
        
        if (dificuldade_sel == i) {
            _cor = c_green;
            _texto = "[ " + _texto + " ]"; // Mudando o indicador para colchetes para diferenciar bem
        }
        
        draw_text_color(_x_inicial + (i * _espaco_entre_opcoes), y + 15, _texto, _cor, _cor, _cor, _cor, 1);
    }
    
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_text(room_width / 2, y + sprite_height + 40, "Use as Setas (Esquerda/Direita) e Pressione Enter");
}