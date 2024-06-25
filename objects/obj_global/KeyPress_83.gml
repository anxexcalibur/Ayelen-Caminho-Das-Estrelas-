/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

ini_open("save.sav");
ini_write_real("jogador3","x_atual",obj_player.x)
ini_write_real("jogador3","y_atual",obj_player.y)
ini_write_real("jogador3","vida_atual",obj_player.vida_atual)
ini_write_real("jogador3","sala_atual",room)
ini_close();
show_message("jogo Salvo")