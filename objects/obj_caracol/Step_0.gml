   /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// codigo que gera a gravidade
event_inherited()
	
var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa 
    }
}


switch(estado)
{
	case "andando" :{
		if place_meeting(x,y,obj_hit_box){
				show_debug_message("estou colidindo");

			}
		if place_meeting(x,y,obj_parede_inimigo){
			show_debug_message("estou colidindo");
		if direc == 0 {
			direc = 1;
		}else if direc == 1{
			direc = 0;
		}
}
		if direc == 0{
			x += 0.2;
		}else if direc = 1 {
			x -= 0.2;
		}
		if (direc == 0)
		 {
			sprite_index = spr_caracol_andando_direita;
		 }
		 else if (direc == 1)
		 {
		   sprite_index = spr_caracol_andando_esquerda;
		 }
		 
		 break;
	}
	case "hit":{
		;
		if(sprite_index != spr_caracol_dano){
			image_index = 0;
			sprite_index = spr_caracol_dano;
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
					estado = "andando"
				}
					
				
			}
		break;
	}
	case "morto":{
		if(sprite_index != spr_caracol_morto){
			//iniciando o for preciso para see estado
			sprite_index = spr_caracol_morto
			image_index = 0;
		}
		;              
		//morrendo de verdade
		if (image_index > image_number - 1) {
            instance_destroy();
            
        }
	}
		
}

