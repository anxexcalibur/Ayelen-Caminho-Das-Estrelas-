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
		if(sprite_index != spr_tatucanastra_parado)
		{
			sprite_index = spr_tatucanastra_parado;
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
		if(sprite_index != spr_tatucanastra){
			sprite_index = spr_tatucanastra;
			image_index = 0;
		}
		if(velh == 0){
			var direcao =  choose(-2,2);
			velh = direcao;
			
			
			
		}
		if(random(timer_estado) > 200)
		{
			estado = choose ("parado","parado","movendo")
		}
	}
}