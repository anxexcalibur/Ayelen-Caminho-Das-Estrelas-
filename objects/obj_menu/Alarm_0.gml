// Evento Alarm[0]
//if (estado == "menu") {
    // Aqui você pode definir o que acontece quando o jogo inicia.
    // Por exemplo, você pode mudar de sala ou inicializar o jogador
    // Mudando para uma sala de jogo (exemplo: room_game)
	instance_create_layer(x,y,"transicao",obju_transicao_2)
	obju_transicao_2.destino = rm_username
	global.name_input_active = true;
//}
     