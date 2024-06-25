/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(file_exists("save.sav")){
	ini_open("save.sav")
	obj_player.x = ini_read_real("jogador","x_atual",0);
	obj_player.y = ini_read_real("jogador","x_atual",0);
	obj_player.vida = ini_read_real("jogador","vida_atual",0);
	room_goto(ini_read_real("jogador","sala_atual",0))
	ini_close();
}