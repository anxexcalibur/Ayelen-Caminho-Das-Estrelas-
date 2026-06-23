/// @description Salva posição da música ao sair de QUALQUER sala

// Sempre salva a posição se for música de menu
if (musica_atual == "menu") {
    if (audio_is_playing(snd_musica_menu)) {
        musica_menu_posicao = audio_sound_get_track_position(snd_musica_menu);
    }
}