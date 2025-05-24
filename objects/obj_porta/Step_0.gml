// Detectar proximidade com o jogador
encostou = place_meeting(x, y, obj_player);

// Interação com F
if (encostou && keyboard_check_pressed(ord("F")) && !ativou) {
    if (global.key) {
        image_speed = 1;
        ativou = true;
       // audio_play_sound(snd_abrir, 1, false); // Som de abrir
	   if global.key == true{
			global.key = false
	   }
    } else {
        //audio_play_sound(snd_bloqueado, 1, false); // Som de bloqueado
    }
}

// Travar a animação no final e desativar colisão
if (ativou && image_index >= image_number - 1 && colisao_ativa) {
    image_speed = 0;
    image_index = 2; // Frame final
    colisao_ativa = false;
    mask_index = -1; // Remove colisão
}
