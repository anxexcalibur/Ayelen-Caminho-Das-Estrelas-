/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


/*if(keyboard_check(vk_up)){
    game_over = true;
}
else{
    game_over = false;
}

*/
if instance_exists(obj_dialogo){
	global.dialogo = true;
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
}