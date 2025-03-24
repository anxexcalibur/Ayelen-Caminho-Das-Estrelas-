/*
 Creditos:
 menusound = {
	Author: Tim Mortimer
	URL: http://www.archive.org/details/TimMortimer
	License: Creative Commons Attribution 3.0
	Distributior: OpenGameArt.org	
 }



*/
enum MenuSound{
	NONE,
	HOVER,
	SELECT
} 
enum playerSound {
    NONE,
    JUMP,
    DAMAGE,
    PICKUP_ITEM
}
trocou = false;

ataque_som_tocou = false;

// Variáveis globais para controlar qual música está tocando
// Variáveis globais para controlar a música que está tocando
// Nenhuma música tocando inicialmente

// Create event of obj_sound
// No Create do obj_som_bg
global.current_music = "";


// Inicializar a música para o estado correto

	switch (room) {
	    case rm_prototipo:
		 audio_pause_all();  // Pausa qualquer música tocando
	        if (global.current_music != "prototipo") {
	            if (audio_is_playing(snd_background_catcines)) {
	                audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	            }
	            if (audio_is_playing(snd_background)) {
	                audio_stop_sound(snd_background);  // Para a música de protótipo
	            }
	            audio_play_sound(snd_background,0.5, 1, true);  // Toca a música para "prototipo" em loop
	            global.current_music = "prototipo";  // Atualiza a música atual
	        }
	        break;
	    case rm_prototipo_level2:
	        audio_pause_all();  // Pausa qualquer música tocando
	        if (global.current_music != "prototipo") {
	            if (audio_is_playing(snd_background_catcines)) {
	                audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	            }
	            if (audio_is_playing(snd_background)) {
	                audio_stop_sound(snd_background);  // Para a música de protótipo
	            }
	            audio_play_sound(snd_background,0.5, 1, true);  // Toca a música para "prototipo" em loop
	            global.current_music = "prototipo";  // Atualiza a música atual
	        }
	        break;

	    case rm_catcine:
			audio_pause_all();  // Pausa qualquer música tocando
	        if (global.current_music != "catcine") {
	            if (audio_is_playing(snd_background)) {
	                audio_stop_sound(snd_background);  // Para a música de protótipo
	            }
	            if (audio_is_playing(snd_background_catcines)) {
	                audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	            }
	            audio_play_sound(snd_background_catcines, 1, true);  // Toca a música para "catcine" em loop
	            global.current_music = "catcine";  // Atualiza a música atual
	        }
	        break;
	    case rm_catcine_2:
	        audio_pause_all();  // Pausa qualquer música tocando
	        if (global.current_music != "catcine") {
	            if (audio_is_playing(snd_background)) {
	                audio_stop_sound(snd_background);  // Para a música de protótipo
	            }
	            if (audio_is_playing(snd_background_catcines)) {
	                audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	            }
	            audio_play_sound(snd_background_catcines, 1, true);  // Toca a música para "catcine" em loop
	            global.current_music = "catcine";  // Atualiza a música atual
	        }
	        break;

	    case rm_menu:
	        audio_pause_all();  // Pausa qualquer música tocando
	        if (audio_is_playing(snd_background)) {
	            audio_stop_sound(snd_background);  // Para a música de protótipo
	        }
	        if (audio_is_playing(snd_background_catcines)) {
	            audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	        }
	        global.current_music = "none";  // Nenhuma música tocando no menu
	        break;

	    default:
	        audio_pause_all();  // Pausa qualquer música tocando
	        if (audio_is_playing(snd_background)) {
	            audio_stop_sound(snd_background);  // Para a música de protótipo
	        }
	        if (audio_is_playing(snd_background_catcines)) {
	            audio_stop_sound(snd_background_catcines);  // Para a música de catcine
	        }
	        global.current_music = "none";  // Ne
	}