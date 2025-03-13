/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Salva a sala atual antes de trocar
global.previous_room = room;

obj_player.etapa_historia = 4;
salvar_jogador(obj_player)
// Vai para a sala da cutscene

room_goto(rm_catcine_2);

