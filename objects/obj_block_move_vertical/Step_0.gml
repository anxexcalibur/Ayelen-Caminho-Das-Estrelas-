velh = dir *velc;
// checa quando encosta e pela o id unico
var colisao = place_meeting(x+velh,y, obj_player) or place_meeting(x,y-1,obj_player);


if (colisao)
{

	with(obj_player)
	{
		if !place_meeting(x,y+other.velh,obj_block){
			y+= other.velh;
		}
	
	}
}


if(instance_place(x,y+velh,obj_block)){
	dir *= -1;
}
y+=velh