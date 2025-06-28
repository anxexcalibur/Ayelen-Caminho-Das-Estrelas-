// Evento Step de obj_porta
if (ativou && !som_abertura_tocado) {
    // 1. Toca o som
    audio_play_sound(snd_unlock_door, 2, false);
    
    // 2. AVISA que o som já tocou, para não executar este bloco de novo.
    som_abertura_tocado = true; 
}
// Lógica para a animação da porta parar no final
if (ativou && image_speed > 0) {
	
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
    }
}

// Lógica de interação com o jogador
if (instance_exists(obj_player)) {
    // Verificamos a PROXIMIDADE, não a colisão física. 32 pixels é uma boa distância para começar.
    var _distancia_ok = (distance_to_object(obj_player) < 32);

    // Se o jogador está perto E a porta ainda não foi aberta...
    if (_distancia_ok && !ativou) {
        mostrar_mensagem = true; // LIGA a permissão para desenhar a mensagem

        // Define QUAL mensagem mostrar
        if (global.key) {
            mensagem = "Pressione F para abrir a porta.";
        } else {
            mensagem = "Você precisa de uma chave.";
        }

        // Se o jogador apertou F com a chave, abre a porta
        if (keyboard_check_pressed(ord("F")) && global.key) {
            ativou = true;
            image_speed = 1;
            global.key = false;
        }

    } else {
        // PONTO CRÍTICO: Se o jogador está longe OU a porta já abriu, DESLIGA a mensagem.
        mostrar_mensagem = false;
    }
} else {
    // Garante que a mensagem não apareça se não houver jogador na sala
    mostrar_mensagem = false;
}