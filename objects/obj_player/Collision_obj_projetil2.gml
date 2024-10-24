/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(obj_player.estado =="defesa"){
	
	with(other){
		instance_destroy();
	}
	
	
}else{
	if alarm[0] <= 0{
		vida_atual -=30;
		alarm[0] = inv_tempo;
	}
	estado = "hit";

	with(other){
		instance_destroy();
	}
}



