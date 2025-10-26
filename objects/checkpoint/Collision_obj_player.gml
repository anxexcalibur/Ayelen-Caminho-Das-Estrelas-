 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Se a animação inicial não foi jogada e ainda não começou


/*ini_open("saves.ini");

ini_write_real(global.nome_jogador,"x_atual",other.x)
ini_write_real(global.nome_jogador,"y_atual",other.y -50)
ini_write_real(global.nome_jogador,"vida_atual",other.vida_atual)
//ini_write_real(global.nome_jogador,"sala_atual",other.room)

ini_close();*/
// Salva as informações do jogador
var _nome_secao = obj_player.nome_player
show_message(_nome_secao)
salvar_checkpoint(_nome_secao);
// Iniciar a animação se ainda não começou
if (!animation_started) {
    animation_started = true;
    sprite_index = spr_checkpoint;
    image_index = 0;
    image_speed = 1;  // Ajuste conforme a velocidade desejada para o sprite de animação
}
