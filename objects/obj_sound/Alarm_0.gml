/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// sound action recebe a instrução para indentificar qual som disparar, ele é chamado no obj de origem do som
switch(MenuSound){
	
	case MenuSound.HOVER:
		audio_play_sound(snd_menu_hover,1,false)
	break
	
	case MenuSound.SELECT:
		audio_play_sound(snd_menu_select,1,false)
	break	

}


