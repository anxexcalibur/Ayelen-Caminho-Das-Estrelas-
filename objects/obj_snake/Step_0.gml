    /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// codigo que gera a gravidade
event_inherited()
var chao = place_meeting(x, y + 1, obj_block);

     if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa 
    }

_tres = 0



switch(estado)
{
	case "parado":{
		if(sprite_index != spr_snake){
			sprite_index = spr_snake;
		}
		show_debug_message(image_alpha)
		if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);
			show_debug_message(estado)var _dir = point_direction(x, y, obj_player.x, obj_player.y); // Calcula o ângulo
			
       
        if (obj_player.x < id.x) {
			// O player está à esquerda do objeto
				lado_certo = -1
				image_xscale = lado_certo ;
				show_debug_message("Player está à esquerda");
				velocidade_projetil = -2
			} else {
				// O player está à direita do objeto
				lado_certo = 1
				image_xscale = lado_certo ;
				show_debug_message("Player está à direita");
				velocidade_projetil = 2
			}
			
            //Se o player estiver muito perto, vou atrás dele
           if (_dist < 300 and _tres < 2) {
                estado = "atirando";
				_tres++
				
            }else{
				alarm[2] = 380
			}
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
	case "atirando":
	{
		image_xscale = lado_certo;
		if sprite_index != spr_snake_shoot
		{
			sprite_index = spr_snake_shoot
		}
		
		if image_index >= 8 and image_index <= 10{
			
			instance_create_layer(x,y-27,"instances", obj_projetil2)
			estado = "parado"
		}
		if image_index >= image_number-1{
			
			estado = "parado"
		}
		break;
	}
	case "morto":{
		if(sprite_index != spr_snake_dead){
			//iniciando o for preciso para see estado
			pontuar(3);
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

