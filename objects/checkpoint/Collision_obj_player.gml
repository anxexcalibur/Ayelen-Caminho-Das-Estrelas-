/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Se a animação inicial não foi jogada e ainda não começou
if image_index	==1
{
	exit;
}
image_index = 1
 

ini_open("saves.ini");

ini_write_real(global.nome_jogador,"x_atual",other.x)
ini_write_real(global.nome_jogador,"y_atual",other.y -50)
ini_write_real(global.nome_jogador,"vida_atual",other.vida_atual)
//ini_write_real(global.nome_jogador,"sala_atual",other.room)

ini_close();