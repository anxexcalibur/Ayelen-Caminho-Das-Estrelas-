/// @description Controle de Sons com Verificação de Existência

// ═══════════════════════════════════════
// MENU SOUNDS
// ═══════════════════════════════════════
switch(menu_sound_state) {
    case MenuSound.HOVER:
        audio_play_sound(snd_menu_hover, 1, false);
        break;
    case MenuSound.SELECT:
        audio_play_sound(snd_menu_select, 1, false);
        break;
}
menu_sound_state = MenuSound.NONE;

// ═══════════════════════════════════════
// GAME OVER (PADRONIZADO SEM GLOBAL)
// ═══════════════════════════════════════
var _game_over = false;

// Tenta pegar do obj_controller (padrão principal)
if (instance_exists(obj_controller)) {
    if (variable_instance_exists(obj_controller, "game_over")) {
        _game_over = obj_controller.game_over;
    }
}

// Fallback: se algum objeto ainda usa global (segurança)
if (!_game_over && variable_global_exists("game_over")) {
    _game_over = global.game_over;
}

if (_game_over) {
    if (!som_gameover_tocou) {
        // Salva posições antes de parar tudo
        if (audio_is_playing(snd_musica_fase1)) pos_musica_fase1 = audio_sound_get_track_position(snd_musica_fase1);
        if (audio_is_playing(snd_musica_fase2)) pos_musica_fase2 = audio_sound_get_track_position(snd_musica_fase2);
        if (audio_is_playing(snd_musica_fase3)) pos_musica_fase3 = audio_sound_get_track_position(snd_musica_fase3);
        if (audio_is_playing(snd_musica_boss)) pos_musica_boss = audio_sound_get_track_position(snd_musica_boss);
        if (audio_is_playing(snd_musica_cutscene)) pos_musica_cutscene = audio_sound_get_track_position(snd_musica_cutscene);
        if (audio_is_playing(snd_maintheme)) pos_musica_main = audio_sound_get_track_position(snd_maintheme);
        
        audio_stop_all();
        audio_play_sound(snd_coletou_death_game_over, 1, false);
        som_gameover_tocou = true;
    }
} else {
    som_gameover_tocou = false;
}

// ═══════════════════════════════════════
// SONS DO JOGADOR (SÓ SE EXISTIR)
// ═══════════════════════════════════════
if (!instance_exists(obj_player)) {
    // Se não tem player, reseta tudo e sai
    som_hit_tocou = false;
    som_jump_tocou = false;
    som_attack_tocou = false;
    som_attack_shoot_tocou = false;
    som_andando_tocou = false;
    som_defesa_tocou = false;
    som_dash_tocou = false;
    som_cura_tocou = false;
    som_drink_tocou = false;
    som_coletou_tocou = false;
    exit;
}

var _player = obj_player;

// ─── DANO (HIT) ───
if (_player.estado == "hit") {
    if (!som_hit_tocou && !audio_is_playing(snd_hit)) {
        audio_play_sound(snd_hit, 1, false);
        som_hit_tocou = true;
    }
} else {
    som_hit_tocou = false;
}

// ─── PULO ───
if (_player.estado == "pulando") {
    if (_player.velv < 0) {
        if (!som_jump_tocou && !audio_is_playing(snd_jump)) {
            audio_play_sound(snd_jump, 1, false);
            som_jump_tocou = true;
        }
    }
} else {
    som_jump_tocou = false;
}

// ─── ATAQUE CORPO ───
if (_player.estado == "ataque") {
    if (_player.sprite_index > 4) {
        if (!som_attack_tocou && !audio_is_playing(snd_attack)) {
            audio_play_sound(snd_attack, 1, false);
            som_attack_tocou = true;
        }
    }
} else {
    som_attack_tocou = false;
}

// ─── ATAQUE PROJÉTIL ───
if (_player.estado == "ataque projetil") {
    if (!som_attack_shoot_tocou && !audio_is_playing(snd_attack_shoot)) {
        audio_play_sound(snd_attack_shoot, 1, false);
        som_attack_shoot_tocou = true;
    }
} else {
    som_attack_shoot_tocou = false;
}

// ─── DEFESA ───
if (_player.estado == "defesa" || _player.estado == "dash") {
    if (!som_defesa_tocou && !audio_is_playing(snd_defesa)) {
        audio_play_sound(snd_defesa, 2, false);
        som_defesa_tocou = true;
    }
} else {
    som_defesa_tocou = false;
}

// ─── CHÁ ───
if (_player.estado == "cha") {
    if (!som_drink_tocou && !audio_is_playing(snd_drink)) {
        audio_play_sound(snd_drink, 1, false);
        som_drink_tocou = true;
    }
} else {
    som_drink_tocou = false;
}

// ─── PASSOS (MOVENDO) ───
if (_player.estado == "movendo") {
    passo_timer--;
    if (passo_timer <= 0) {
        // Verifica se NENHUM som de passo está tocando (normal + blocos)
        if (!audio_is_playing(snd_andando) && !audio_is_playing(snd_andando_1) && !audio_is_playing(snd_andando_2) &&
            !audio_is_playing(snd_passos_block) && !audio_is_playing(snd_passos_pedregulho)) {
            
            var _som_passo = noone;
            var _chao_tipo = "normal";
            
            // Verifica se está em cima de obj_block_pedregulho
            if (place_meeting(_player.x, _player.y + 5, obj_block_pedregulho)) {
                _chao_tipo = "pedregulho";
                _som_passo = snd_passos_pedregulho; // Som de passo em pedregulho
            }
            // Verifica se está em cima de obj_block
            else if (place_meeting(_player.x, _player.y + 5, obj_block)) {
                _chao_tipo = "block";
                _som_passo = snd_passos_block; // Som de passo em block
            }
            // Chão normal
            else {
                _som_passo = choose(snd_andando, snd_andando_1, snd_andando_2);
            }
            
            // Toca o som escolhido
            if (_som_passo != noone) {
                audio_play_sound(_som_passo, 1, false);
                show_debug_message("🎵 Passo em: " + _chao_tipo);
            }
            
            passo_timer = 15; // Delay entre passos
        }
    }
} else {
    passo_timer = 0;
}

// ─── CURA (COLETA DE VIDA) ───
if (place_meeting(_player.x, _player.y, obj_vida)) {
    if (_player.sprite_index != spr_player_fall_cura) {
        _player.sprite_index = spr_player_fall_cura;
    }
    if (!som_cura_tocou && !audio_is_playing(snd_cura)) {
        audio_play_sound(snd_cura, 2, false);
        som_cura_tocou = true;
    }
} else {
    som_cura_tocou = false;
}

// ─── COLETA DE ITEM ───
if (place_meeting(_player.x, _player.y, obj_item_pai)) {
    if (!som_coletou_tocou && !audio_is_playing(snd_coletou)) {
        audio_play_sound(snd_coletou, 1, false);
        som_coletou_tocou = true;
    }
} else {
    som_coletou_tocou = false;
}

// ═══════════════════════════════════════
// SOM DE ATIVAÇÃO DE ESTRELA
// ═══════════════════════════════════════
if (instance_exists(obj_star_1)) {
    with(obj_star_1) {
        if (ativou) {
            if (!obj_sound.som_ativou_star_tocou && !audio_is_playing(snd_ativou_star)) {
                audio_play_sound(snd_ativou_star, 1, false);
                obj_sound.som_ativou_star_tocou = true;
            }
        } else {
            obj_sound.som_ativou_star_tocou = false;
        }
    }
}

// ═══════════════════════════════════════
// CONTROLE DE MÚSICA POR SALA
// ═══════════════════════════════════════
// Só controla a música se NÃO estiver em game over
if (!_game_over) {
    var _musica_tocando = "";
    
    // Detecta qual música está tocando agora
    if (audio_is_playing(snd_musica_fase1)) {
        _musica_tocando = "prototipo";
    }
    if (audio_is_playing(snd_background_catcines)) {
        _musica_tocando = "catcine";
    }
    if (audio_is_playing(snd_maintheme)) {
        _musica_tocando = "main";
    }
    
    // Verifica a sala atual e toca a música certa
    switch(room) {
        case rm_prototipo:
            // 🔥 FIX: Para a música da cutscene SEMPRE ao voltar
            if (audio_is_playing(snd_background_catcines)) audio_stop_sound(snd_background_catcines);
            
            if (_musica_tocando != "prototipo") {
                if (audio_is_playing(snd_maintheme)) audio_stop_sound(snd_maintheme);
                audio_play_sound(snd_musica_fase1, 1, true);
                show_debug_message("🎵 Música: Protótipo");
                if (audio_is_playing(snd_musica_cutscene)) audio_stop_sound(snd_musica_cutscene);
                audio_play_sound(snd_musica_fase1, 1, true);
                show_debug_message("🎵 Música: Protótipo");
            }
            break;
            
        case rm_catcine:
        case rm_catcine_2:
            if (_musica_tocando != "catcine") {
                if (audio_is_playing(snd_musica_fase1)) audio_stop_sound(snd_musica_fase1);
                if (audio_is_playing(snd_maintheme)) audio_stop_sound(snd_maintheme);
                audio_play_sound(snd_background_catcines, 1, true);
                show_debug_message("🎵 Música: Cutscene");
            }
            break;
            
        case rm_menu:
            if (_musica_tocando != "main") {
                if (audio_is_playing(snd_musica_fase1)) audio_stop_sound(snd_musica_fase1);
                if (audio_is_playing(snd_background_catcines)) audio_stop_sound(snd_background_catcines);
                audio_play_sound(snd_maintheme, 1, true);
                show_debug_message("🎵 Música: Menu");
            }
            break;
    }
} else {
    // Se está em game over, salva posições e para a música de fundo
    if (audio_is_playing(snd_musica_fase1)) {
        pos_musica_fase1 = audio_sound_get_track_position(snd_musica_fase1);
        audio_stop_sound(snd_musica_fase1);
    }
    if (audio_is_playing(snd_musica_fase2)) {
        pos_musica_fase2 = audio_sound_get_track_position(snd_musica_fase2);
        audio_stop_sound(snd_musica_fase2);
    }
    if (audio_is_playing(snd_musica_fase3)) {
        pos_musica_fase3 = audio_sound_get_track_position(snd_musica_fase3);
        audio_stop_sound(snd_musica_fase3);
    }
    if (audio_is_playing(snd_musica_boss)) {
        pos_musica_boss = audio_sound_get_track_position(snd_musica_boss);
        audio_stop_sound(snd_musica_boss);
    }
    if (audio_is_playing(snd_background_catcines)) {
        pos_musica_cutscene = audio_sound_get_track_position(snd_background_catcines);
        audio_stop_sound(snd_background_catcines);
    }
    if (audio_is_playing(snd_maintheme)) {
        pos_musica_main = audio_sound_get_track_position(snd_maintheme);
        audio_stop_sound(snd_maintheme);
    }
}

// ═══════════════════════════════════════
// RESETA FLAGS QUANDO MORRE
// ═══════════════════════════════════════
if (instance_exists(obj_player)) {
    if (obj_player.vida_atual <= 0) {
        som_hit_tocou = false;
        som_jump_tocou = false;
        som_attack_tocou = false;
        som_attack_shoot_tocou = false;
        som_andando_tocou = false;
        som_defesa_tocou = false;
        som_dash_tocou = false;
        som_cura_tocou = false;
        som_drink_tocou = false;
        som_coletou_tocou = false;
    }
}