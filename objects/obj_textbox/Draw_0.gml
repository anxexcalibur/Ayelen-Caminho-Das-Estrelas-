draw_input_name()
global.nome_jogador = keyboard_string;
if room == rm_username &&  keyboard_check(vk_enter)
{
	if string_length(global.nome_jogador) >= 3  
	{
		alarm[2] = 5
		
	}else{
		 // Show warning message
		 show_message("O nome deve ter no mínimo 3 caracteres.");
	}

}
show_debug_message(global.name_input_active)