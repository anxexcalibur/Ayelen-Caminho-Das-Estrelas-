 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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

with(obj_player){
	if estado = "hit"{
		audio_play_sound(snd_hit, 1, false)
	}
	if place_meeting(x,y, obj_item_pai) {
	 audio_play_sound(snd_coletou, 1, false)
	}
	
}



    