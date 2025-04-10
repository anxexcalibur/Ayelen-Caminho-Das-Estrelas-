/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// Seção: Controle de Som no Game Over
///sounddesing
with(obj_controller){
    if (game_over)
    {
        if (!som_tocou) 
        {
            audio_play_sound(snd_coletou_death_game_over, 1, false); // Toca o som apenas uma vez
            som_tocou = true; // Marca que o som já foi tocado
        }

        // ... (restante do código de desenho do Game Over)
    }
    else
    {
        som_tocou = false; // Reseta a variável quando o jogo não está mais em Game Over
    }
}

/// Seção: Som ao Ativar a Estrela
with(obj_star_1){
    if (ativou) {
        // Verifica se o som de "hit" não está tocando
        if (!audio_is_playing(snd_ativou_star)) {
            audio_play_sound(snd_ativou_star, 1, false);  // Toca o som de "hit"
        }
    }
}

/// Seção: Sons do Jogador
with(obj_player){
    // Copyright/Attribution Notice: Jesús Lastra
    switch(estado){
        case "hit":
            // Verifica se o som de "hit" não está tocando
            if (!audio_is_playing(snd_hit)) {
                audio_play_sound(snd_hit, 1, false);  // Toca o som de "hit"
            }
            break;

        case "pulando":
            // Verifica se o som de "pulando" não está tocando
			if velv < 0 {
	            
	            if (!audio_is_playing(snd_jump)) {
	                audio_play_sound(snd_jump, 1, false);  // Toca o som de "pulando"
	            }
	            
			}
			break;
        case "ataque":
            // Verifica se o som de "ataque" não está tocando
            // Reseta a variável quando a animação termina
			
			if sprite_index > 4{
				if (!audio_is_playing(snd_attack)) {
                audio_play_sound(snd_attack, 1, false);  // Toca o som de "ataque projetil"
				}
				
			}
            break;

        case "ataque projetil":
            // Verifica se o som de "ataque projetil" não está tocando
            if (!audio_is_playing(snd_attack_shoot)) {
                audio_play_sound(snd_attack_shoot, 1, false);  // Toca o som de "ataque projetil"
            }
            break;

        case "movendo":
            // Verifica se o som de "movendo" não está tocando
            var _som_escolhido = choose(snd_andando, snd_andando_1, snd_andando_2);
            if (!audio_is_playing(_som_escolhido)) {
                audio_play_sound(_som_escolhido, 1, false);  // Toca o som de "movendo"
            }
            break;

        case "cha":
            if (!audio_is_playing(snd_drink)) {
                audio_play_sound(snd_drink, 1, false);  // Toca o som de "chá"
            }
            break;
		case "defesa":
		
		 if (!audio_is_playing(snd_defesa)) {
                audio_play_sound(snd_defesa, 2, false);  // Toca o som de "chá"
            }
            break;
		case "dash":
		
		 if (!audio_is_playing(snd_defesa)) {
                audio_play_sound(snd_defesa, 2, false);  // Toca o som de "chá"
            }
            break;
    }
	 
	 if place_meeting(x, y, obj_vida){
		 if sprite_index != spr_player_fall_cura{
			sprite_index = spr_player_fall_cura
		 }
		if (!audio_is_playing(snd_cura)) {
                audio_play_sound(snd_cura, 2, false);  // Toca o som de "chá"
            }
	 }

    if (place_meeting(x, y, obj_item_pai)) {
        audio_play_sound(snd_coletou, 1, false);  // Toca o som de "coletou"
    }
}

/// Seção: Controle de Música do Jogo
switch(room)
{
    case rm_prototipo:
        global.current_music = "lv1";
        break;

    case rm_catcine:
        global.current_music = "catcine";
        break;
}
