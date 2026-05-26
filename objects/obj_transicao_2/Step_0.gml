/// @description Controla animação de fade e transição de salas
var _nome_jogador;

if instance_exists(obj_catcine){
	obj_catcine.pode_desenhar = false;
}

if direcao{
	img += img_vel;

	if(img - img_num > cols+1)
	{
		if room == rm_catcine {
			direcao = false;
			_nome_jogador = global.player_name;
			global.player_name = "";
			
			// Destroi player persistente antes de carregar
			if (instance_exists(obj_player)) {
				instance_destroy(obj_player);
			}
			
			carrega_jogo_3(
				_nome_jogador, 
				undefined, 
				undefined, 
				undefined, 
				undefined, 
				false
			);
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false;
			}
			
		} else if room == rm_catcine_2 {
			direcao = false;
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false;
			}
			
		} else {
			if(room_exists(destino)){
				room_goto(destino);
				
				if (instance_exists(obj_player) && room != Casa_guarani_1) {
					obj_player.x = destino_x;
					obj_player.y = destino_y;
				}
			}
			direcao = false;
		}
	}
	
} else {
	// Saindo da animação (fade abrindo)
	img -= img_vel;
	
	if img < -5 {
		if (room == rm_catcine || room == rm_catcine_2) {
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = true;
			}
		}
		instance_destroy();
	} 
}