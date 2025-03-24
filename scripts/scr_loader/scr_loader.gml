function carrega_jogo2(_jogador, _sala,_etapa) {
    // Verifica se uma instância de obj_player já existe na cena
	if (audio_is_playing(snd_background_catcines)) {
	                audio_stop_sound(snd_background_catcines);  // Para a música de protótipo
					audio_play_sound(snd_background,1,true)
				}
    if (!instance_exists(obj_player)) {
        // Cria uma nova instância de obj_player
        var inst_player = instance_create_layer(0, 0, "Instances", obj_player);
        
        if (file_exists("save.sav")) {
            // Verifica se o arquivo de save existe
            ini_open("save.sav"); // Abre o arquivo de save

            // Carrega os dados salvos e atribui à nova instância
            inst_player.x = ini_read_real(_jogador, "x_atual", 0);
            inst_player.y = ini_read_real(_jogador, "y_atual", 0);
            inst_player.vida_atual = ini_read_real(_jogador, "vida_atual", 100); // Vida padrão = 100
            inst_player.etapa_historia =  is_undefined(_etapa) ? ini_read_real(_jogador, "etapa_historia",1) : _etapa;// Vida padrão = 100
            global.pontuacao = ini_read_real(_jogador, "pontuacao", global.pontuacao);
			// Determina a sala: usa _sala se fornecida, ou a sala salva
            var sala_atual = is_undefined(_sala) ? ini_read_real(_jogador, "sala_atual", room) : _sala;
            ini_close(); // Fecha o arquivo de save

            // Move para a sala especificada
            room_goto(sala_atual);
        } else {
            // Mensagem de erro se o arquivo de save não for encontrado
            show_message("Arquivo de save não encontrado!");
        }
    } else {
        // Mensagem se o jogador já estiver na cena
        show_message("O jogador já está presente na cena!");
    }
}
