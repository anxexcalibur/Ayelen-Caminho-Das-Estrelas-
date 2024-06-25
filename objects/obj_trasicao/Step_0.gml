/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(mudei){//mudei de room
	alpha -= .03;
}else{//Ainda não mudei de room
	alpha += .03;
}


//quando o alfa passar de , mudo de room
if(alpha >=1){
	room_goto(destino)
	
	//Controlando a posição do player
	obj_player.x = destino_x;
	obj_player.y = destino_y;
}


//Me Destruindo depois de mudar de room e ficar transparente
if(mudei && alpha <=0){
	instance_destroy();
}