/// @description Lógica do TextBox (Controles e Estrelas)

// ═══════════════════════════════════════
// ATUALIZAÇÃO DA CINTILAÇÃO DAS ESTRELAS
// ═══════════════════════════════════════
for (var i = 0; i < total_estrelas; i++) {
    estrela_alpha[i] += estrela_vel[i];
    if (estrela_alpha[i] > 1 || estrela_alpha[i] < 0.1) {
        estrela_vel[i] = -estrela_vel[i];
    }
}

for (var j = 0; j < total_nos; j++) {
    no_alpha[j] += no_vel[j];
    if (no_alpha[j] > 0.9 || no_alpha[j] < 0.2) {
        no_vel[j] = -no_vel[j];
    }
}

// ═══════════════════════════════════════
// ESC PARA VOLTAR AO MENU (SEU CÓDIGO ATUAL)
// ═══════════════════════════════════════
if (keyboard_check_pressed(vk_escape)) {
    if (audio_is_playing(snd_background)) {
        audio_stop_sound(snd_background);
    }
    if (instance_exists(obj_sound)) {
        obj_sound.musica_atual = "none";
        obj_sound.musica_menu_tempo = 0;
    }
    if (instance_exists(obj_player)) {
        instance_destroy(obj_player);
    }
    var _trans = instance_create_layer(0, 0, "transicao", obj_transicao_2);
    _trans.destino = rm_menu;
    _trans.direcao = true;
    _trans.img = 0;
    exit;
}

// ═══════════════════════════════════════
// PASSO 0: DIGITANDO O NOME
// ═══════════════════════════════════════
if (passo == 0) {
    if (string_length(keyboard_string) > nome_max) {
        keyboard_string = string_copy(keyboard_string, 1, nome_max);
    }
    global.player_name = keyboard_string;

    if (keyboard_check_pressed(vk_enter)) {
        if (string_length(global.player_name) >= 3) {
            passo = 1;
            keyboard_string = "";
        }
    }
}
// ═══════════════════════════════════════
// PASSO 1: ESCOLHENDO A DIFICULDADE
// ═══════════════════════════════════════
else if (passo == 1) {
    keyboard_string = ""; // 👈 ADICIONE ESSA LINHA AQUI
    
    var _dir = keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down);
    var _esq = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up);
    
    if (_dir) {
        dificuldade_sel++;
        if (dificuldade_sel > 3) dificuldade_sel = 0;
    }
    if (_esq) {
        dificuldade_sel--;
        if (dificuldade_sel < 0) dificuldade_sel = 3;
    }
    
    if (keyboard_check_pressed(vk_enter)) {
        switch (dificuldade_sel) {
            case 0: global.dificuldade = 0.5; break;
            case 1: global.dificuldade = 1.0; break;
            case 2: global.dificuldade = 1.5; break;
            case 3: global.dificuldade = 3.0; break;
        }
        alarm[2] = 5;
    }
}