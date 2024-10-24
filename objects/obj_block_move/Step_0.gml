velh = dir *velc;
// checa quando encosta e pela o id unico
var colisao = place_meeting(x+velh,y, obj_player) or place_meeting(x,y-1,obj_player);


if (colisao)
{

	with(obj_player)
	{
		if !place_meeting(x+other.velh,y,obj_block){
			x+= other.velh;
		}
	
	}
}


if(instance_place(x+velh,y,obj_block)){
	dir *= -1;
}
x+=velh