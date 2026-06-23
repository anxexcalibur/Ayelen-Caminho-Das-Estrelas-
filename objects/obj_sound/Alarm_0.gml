/// @description Troca de Música por Sala

var _sala = room;

// ═══ DESCOBRE QUAL MÚSICA ESTA SALA PRECISA ═══
var _musica_necessaria = "none";

if (_sala == rm_menu || _sala == rm_username) {
    _musica_necessaria = "menu";
}
else if (_sala == rm_catcine || _sala == rm_catcine_2) {
    _musica_necessaria = "cutscene";
}
else if (_sala == rm_prototipo) {
    _musica_necessaria = "fase1";
}
else if (_sala == rm_prototipo_level2) {
    _musica_necessaria = "fase2";
}
else if (_sala == rm_prototipo_level3) {
    _musica_necessaria = "fase3";
}
else if (_sala == rm_prototipo_bossroom) {
    _musica_necessaria = "boss";
}

// ═══ SE É MÚSICA DE MENU: GERENCIAMENTO ESPECIAL ═══
if (_musica_necessaria == "menu") {
    if (audio_is_playing(snd_musica_menu)) {
        if (musica_menu_tempo > 0) {
            var _tempo_atual = audio_sound_get_track_position(snd_musica_menu);
            if (abs(_tempo_atual - musica_menu_tempo) > 0.5) {
                audio_sound_set_track_position(snd_musica_menu, musica_menu_tempo);
            }
        }
    }
    else {
        audio_play_sound(snd_musica_menu, 0.5, true);
        if (musica_menu_tempo > 0) {
            audio_sound_set_track_position(snd_musica_menu, musica_menu_tempo);
        }
    }
    musica_atual = "menu";
}
// ═══ SE MUDOU PARA OUTRA MÚSICA ═══
else if (_musica_necessaria != musica_atual) {
    if (musica_atual == "menu" && audio_is_playing(snd_musica_menu)) {
        musica_menu_tempo = audio_sound_get_track_position(snd_musica_menu);
    }
    
    audio_stop_all();
    
    switch(_musica_necessaria) {
        case "cutscene":
            audio_play_sound(snd_musica_cutscene, 0.6, true);
            if (pos_musica_cutscene > 0) {
                audio_sound_set_track_position(snd_musica_cutscene, pos_musica_cutscene);
                pos_musica_cutscene = 0;
            }
            break;
        case "fase1":
            audio_play_sound(snd_musica_fase1, 0.5, true);
            if (pos_musica_fase1 > 0) {
                audio_sound_set_track_position(snd_musica_fase1, pos_musica_fase1);
                pos_musica_fase1 = 0;
            }
            break;
        case "fase2":
            audio_play_sound(snd_musica_fase2, 0.5, true);
            if (pos_musica_fase2 > 0) {
                audio_sound_set_track_position(snd_musica_fase2, pos_musica_fase2);
                pos_musica_fase2 = 0;
            }
            break;
        case "fase3":
            audio_play_sound(snd_musica_fase3, 0.5, true);
            if (pos_musica_fase3 > 0) {
                audio_sound_set_track_position(snd_musica_fase3, pos_musica_fase3);
                pos_musica_fase3 = 0;
            }
            break;
        case "boss":
            audio_play_sound(snd_musica_boss, 0.6, true);
            if (pos_musica_boss > 0) {
                audio_sound_set_track_position(snd_musica_boss, pos_musica_boss);
                pos_musica_boss = 0;
            }
            break;
    }
    musica_atual = _musica_necessaria;
}
