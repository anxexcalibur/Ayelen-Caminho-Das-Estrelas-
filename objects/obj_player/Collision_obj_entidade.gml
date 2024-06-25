 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if alarm[0] <= 0 && estado  == "ataque aereo down"{
	
	alarm[0] = inv_tempo;
}else if(alarm[0] <= 0){
	if(estado = "ataque aereo down"){
		alarm[2] = 90;
		if(alarm[2] == 2){
			obj_player.estado = "hit";
		}
	}else{
		obj_player.estado = "hit";
		vida_atual -= obj_entidade.ataque;
		alarm[0] = inv_tempo;
	}
	
}

        
 