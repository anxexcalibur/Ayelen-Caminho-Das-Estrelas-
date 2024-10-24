/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var chao = place_meeting(x,y+1,obj_block);

if(!chao){
	velv += GRAVIDADE *massa;
}

switch(estado)
{
	#region parado
	case "parado":
	{
		timer_estado++;
		// colocando o sprite certo
		if(sprite_index != spr_escorpiao)
		{
			sprite_index = spr_escorpiao;
			image_index = 0;
		}
		
		//Saindo do estado
		if (random(timer_estado)> 200){
			estado = choose("movendo","movendo","parado")
			timer_estado = 0;
		}
		break;
	}
	#endregion
	case "movendo":
	{
		timer_estado++;
		if(sprite_index != spr_escorpiao){
			sprite_index = spr_escorpiao;
			image_index = 0;
		}
		if(velh == 0){
			var direcao =  choose(-2,2);
			velh = direcao;
			
		}
		if(place_meeting(x,y,obj_player))
			if(obj_player.estado = "defesa")
				{
				 velh =	 -velh	
				}
		if(random(timer_estado) > 200)
		{
			estado = choose ("parado","parado","movendo")
		}
		break;
	}
	case "hit":{
		
		if(sprite_index != spr_tatucanastra_hit){
			image_index = 0;
			sprite_index = spr_tatucanastra_hit;
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
		break
	}
	case "morto":
	{
		
		if(sprite_index != spr_tatucanastra_morto){
			pontuar(6);
			//iniciando o for preciso para see estado
			sprite_index = spr_tatucanastra_morto
			image_index = 0;
		}
		;              
		//morrendo de verdade
		if (image_index > image_number - 1) {
            instance_destroy();
            
        }
		
		break
	}
}
