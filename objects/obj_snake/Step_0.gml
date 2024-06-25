    /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// codigo que gera a gravidade
event_inherited()
var chao = place_meeting(x, y + 1, obj_block);

if (!chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa 
    }
}




switch(estado)
{
	case "parado":{
		if(sprite_index != spr_snake){
			sprite_index = spr_snake;
		}
		break
	}
	case "hit":{
		
		if(sprite_index != spr_snake_hit){
			image_index = 0;
			sprite_index = spr_snake_hit;
			vida_atual -= obj_player.id.ataque;
			screenshake(1)
		}
		
		
		//condição de troca de estado
		if(vida_atual <= 0)
		{
			//checando se ele ainda tem vida
			if(image_index > image_number-1)
			{
				estado ="morto"
			}
			
		}
		else
			{
				if(image_index > image_number-1){
					estado = "parado"
				}
					
				
			}
		break;
	}
	case "morto":{
		if(sprite_index != spr_snake_dead){
			//iniciando o for preciso para see estado
			sprite_index = spr_snake_dead
			image_index = 0;
		}
		;              
		//morrendo de verdade
		if (image_index > image_number - 1) {
            instance_destroy();
            
        }
	}
		
}

