/// @description Sistema de Áudio Central

// ═══ ENUMS ═══
enum MenuSound {
    NONE,
    HOVER,
    SELECT
}

// ═══ ESTADO ═══
menu_sound_state = MenuSound.NONE;
musica_atual = "none";

// ═══ CONTROLE DE POSIÇÃO (CORRIGIDO) ═══
// Agora salvamos o tempo absoluto da música
musica_menu_tempo = 0;           // Tempo salvo em segundos
musica_menu_esta_tocando = false; // Flag se a música estava tocando

// ═══ POSIÇÕES SALVAS PARA RETOMAR APÓS GAME OVER ═══
pos_musica_fase1 = 0;
pos_musica_fase2 = 0;
pos_musica_fase3 = 0;
pos_musica_boss = 0;
pos_musica_cutscene = 0;
pos_musica_main = 0;

/// @description Inicialização do sistema de som

// ═══ FLAGS ═══
som_gameover_tocou = false;
som_hit_tocou = false;
som_jump_tocou = false;
som_attack_tocou = false;
som_attack_shoot_tocou = false;
som_andando_tocou = false;
som_defesa_tocou = false;
som_cura_tocou = false;
som_drink_tocou = false;
som_coletou_tocou = false;
som_ativou_star_tocou = false;
passo_timer = 0;

// Dispara verificação
alarm[0] = 2;
/// @function tocar_musica_fundo(nome_musica)
/// @desc Toca a música de fundo correta e para as outras
function tocar_musica_fundo(nome_musica) {
    // Para todas as músicas atuais
    if (audio_is_playing(snd_background)) {
        audio_stop_sound(snd_background);
    }
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);
    }
    if (audio_is_playing(snd_maintheme)) {
        audio_stop_sound(snd_maintheme);
    }
    
    // Toca a música escolhida
    switch(nome_musica) {
        case "prototipo":
            audio_play_sound(snd_background, 1, true);
            break;
        case "catcine":
            audio_play_sound(snd_background_catcines, 1, true);
            break;
        case "main":
            audio_play_sound(snd_maintheme, 1, true);
            break;
    }
    
    show_debug_message("🎵 Música tocando: " + nome_musica);
}