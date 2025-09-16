/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Salva a sala atual antes de trocar
global.previous_room = room;

obj_player.etapa_historia = 4;
salvar_jogador(obj_player)
// Vai para a sala da cutscene
instance_create_layer(x,y,"transicao",obj_transicao_2);
obj_transicao_2.destino = rm_catcine_2


