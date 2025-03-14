switch (room) {
    case rm_prototipo:
    case rm_prototipo_level2:
        // Parar a música anterior, se estiver tocando
        if (audio_is_playing(snd_background_catcines)) {
            audio_stop_sound(snd_background_catcines);  // Para a música de catcine
        }
        
        // Tocar a música para o "room" protótipo
        if (!audio_is_playing(snd_background)) {
            audio_play_sound(snd_background, 1, true);  // Toca o som em loop
        }
        break;

    case rm_catcine:
    case rm_catcine_2:
        // Parar a música anterior, se estiver tocando
        if (audio_is_playing(snd_background)) {
            audio_stop_sound(snd_background);  // Para a música de protótipo
        }
        
        // Tocar a música para o "room" catcine
        if (!audio_is_playing(snd_background_catcines)) {
            audio_play_sound(snd_background_catcines, 1, true);  // Copyright/Attribution Notice: Snabisch
        }
        break;

    default:
        // Caso o "room" não seja nenhum dos anteriores, pode parar todas as músicas
        if (audio_is_playing(snd_background)) {
            audio_stop_sound(snd_background);
        }
        if (audio_is_playing(snd_background_catcines)) {
            audio_stop_sound(snd_background_catcines);
        }
        break;
}
