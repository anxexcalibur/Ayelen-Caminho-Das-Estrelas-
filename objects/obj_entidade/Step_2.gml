 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Sistema de Colisão e Movimentação

var _velh = sign(velh);
var _velv = sign(velv);

repeat(abs(velh))
{
	if (place_meeting(x + _velh,y,obj_block) or place_meeting(x + _velh,y,obj_wall_invisivel))
	{
		velh = 0;
		break;
		
	}
	x += _velh;	
}
//vertical 
repeat(abs(velv))
{
	if(place_meeting(x,y +_velv,obj_block) or place_meeting(x + _velh,y,obj_wall_invisivel))
	{
		velv = 0;
		break;
	}
	y += _velv;
} 

image_speed = image_spd;