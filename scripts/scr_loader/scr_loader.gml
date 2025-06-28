function carrega_jogo2(_jogador, _sala, _etapa, _x, _y, _estrelas) {
    // Verifica se uma instância de obj_player já existe na cena
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);  // Para a música de protótipo
        audio_play_sound(snd_background, 1, true);
    }

    if (!instance_exists(obj_player)) {
        // Cria uma nova instância de obj_player
        var inst_player = instance_create_layer(0, 0, "Instances", obj_player);

        if (file_exists("save.sav")) {
            ini_open("save.sav"); // Abre o arquivo de save

            // Define as posições usando os argumentos se forem fornecidos, senão usa o valor salvo
            inst_player.x = is_undefined(_x) ? ini_read_real(_jogador, "x_atual", 0) : _x;
            inst_player.y = is_undefined(_y) ? ini_read_real(_jogador, "y_atual", 0) : _y;

            // Outros dados do jogador
            inst_player.vida_atual = ini_read_real(_jogador, "vida_atual", 100); // Vida padrão = 100
            inst_player.etapa_historia = is_undefined(_etapa) ? ini_read_real(_jogador, "etapa_historia", 1) : _etapa;
            global.pontuacao = ini_read_real(_jogador, "pontuacao", global.pontuacao);
            
            // --- CORREÇÃO APLICADA AQUI ---
            // Agora, se _estrelas for fornecido, ele será usado corretamente.
			
            global.estrelas_coletadas = is_undefined(_estrelas) ? ini_read_real(_jogador, "estrelas_coletadas", 0) : _estrelas;
            
            // Determina a sala: usa _sala se fornecida, ou a sala salva
            var sala_atual = is_undefined(_sala) ? ini_read_real(_jogador, "sala_atual", room) : _sala;

            ini_close(); // Fecha o arquivo de save

            // Move para a sala especificada
            room_goto(sala_atual);
        } else {
            show_message("Arquivo de save não encontrado!");
        }
    } else {
        show_message("O jogador já está presente na cena!");
    }
}

