 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Checar se estou colidindo com o playe
var player = place_meeting(x,y,obj_player);
// o player esta colidindo comigo
var up = keyboard_check_released(ord("W"))
if(player && up){
//CODIGO DA TRANSISÃO
	var tran = instance_create_layer(0,0, layer,obj_trasicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
	
}