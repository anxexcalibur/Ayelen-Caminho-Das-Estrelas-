 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor






if global.game_stop{
	with(obj_entidade){
		velh = 0
		velv = 0
		
	}
	
}else{
	
}
if global.game_paused{
	with(obj_entidade){
		velh = 0
		velv = 0
		image_index = 0
	}with(obj_projetil2){
		speed = 0
		image_index = 0
	}
	
	with(obj_block_move){
		velh = 0
	}
	with(obj_block_move_vertical){
		velv = 0
	}
}else{
	with(obj_projetil2){
			speed = 1
			
		}
}
if room == rm_menu {
	global.menu_existe = true
}else if room == rm_username or room == rm_catcine or rm_catcine_2 and instance_exists(obj_menu){
	 with (obj_menu) {
            instance_destroy();
        }
	global.menu_existe = false
	global.dialogo = false;
}
if (keyboard_check_pressed(vk_escape)) {
    // Se o menu já existe, feche o menu
    if (global.menu_existe) {
        // Destroi o menu
        with (obj_menu) {
            instance_destroy();
        }
       global.menu_existe = false; // O menu não existe mais
       global.game_paused = false; // O jogo é retomado
    }else  {
        global.menu_existe = true; // Marca que o menu existe
		if !instance_exists(obj_menu) and room != rm_catcine and room != rm_catcine_2 and room != rm_username {
			instance_create_layer(x, y, "Dialogo", obj_menu); // Cria o men
		}
     
        global.game_paused = true; // Pausa o jogo
		if(instance_exists(obj_dialogo)){
			with(obj_dialogo){
				instance_destroy();
			}
		}
		
    }
}