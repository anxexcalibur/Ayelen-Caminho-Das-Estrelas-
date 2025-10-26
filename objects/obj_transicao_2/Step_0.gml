/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _nome_jogador // variavel para puxar o nome do obj_menu
if instance_exists(obj_catcine){
	obj_catcine.pode_desenhar = false;
}
if direcao{
	img += img_vel;


	if(img - img_num > cols+1)
	{
		if room == rm_catcine {
			
			 
			direcao = false;
			_nome_jogador  = global.player_name;
			global.player_name = ""; // limpa a variavel do menu
			show_message(global.player_name)
			carrega_jogo_3(
    _nome_jogador, 
    undefined, 
    undefined, 
    undefined, 
    undefined, 
    false);
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false
			}else{
				
				//carrega_jogo2(global.player_name, rm_prototipo, 1,53,323,);
			}
		}else if room == rm_catcine_2{
			
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