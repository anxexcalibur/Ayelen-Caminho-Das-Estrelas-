/// @description Inserir descrição aqui
// Você pode escrever seu código neste edito
salvar_jogo = function(nome)
{
	ini_open("save.sav");
	ini_write_real(nome,"x_atual",obj_player.x)
	ini_write_real(nome,"y_atual",obj_player.y)
	ini_write_real(nome,"vida_atual",obj_player.vida_atual)
	ini_write_real(nome,"sala_atual",room)
	ini_close();
	show_message("jogo Salvo")
}