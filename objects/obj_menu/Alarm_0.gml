/// @description Alarme 0 - Iniciar jogo com transição

// Salva posição da música
if (instance_exists(obj_sound)) {
    if (audio_is_playing(snd_musica_menu)) {
        obj_sound.musica_menu_tempo = audio_sound_get_track_position(snd_musica_menu);
    }
    obj_sound.musica_atual = "none";
}

// Cria transição
var _trans = instance_create_layer(0, 0, "transicao", obj_transicao_2);
_trans.destino = rm_username;
_trans.direcao = true;  // Começa fechando (indo pra direita)
_trans.img = 0;         // Reseta frame
_trans.destino_x = 0;
_trans.destino_y = 0;

global.name_input_active = true;