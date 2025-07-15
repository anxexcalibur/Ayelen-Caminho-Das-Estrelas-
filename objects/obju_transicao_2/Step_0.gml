/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(obj_catcine){
	obj_catcine.pode_desenhar = false;
}
if direcao{
	img += img_vel;


	if(img - img_num > cols+1)
	{
		if room == rm_catcine {
			
			carrega_jogo2(global.player_name, rm_prototipo, 1,53,323,);
			direcao = false;
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false
			}
		}else if room == rm_catcine_2{
		  
		  carrega_jogo2(global.player_name, rm_prototipo, 4, 1273, 322,);
			direcao = false;
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false
			}
		}else {
			
			if(room_exists(destino)){
				room_goto(destino)
			if instance_exists(obj_player) and room != Casa_guarani_1{
					obj_player.x = destino_x;
					obj_player.y = destino_y;
				}
			}
			direcao = false;
		}
		
	}
}else{
	//estou sainda da animação
	img -= img_vel
	//termi
	if img <-5{
		if room == rm_catcine or room == rm_catcine_2 {
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = true
			}
		}
		instance_destroy();
	} 
}