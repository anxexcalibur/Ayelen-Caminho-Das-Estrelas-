/// @description Controla a lógica do diálogo (inputs e avanço)

// Se não há diálogo para mostrar, não faz nada.
if (!mostrando_dialogo) {
    exit;
}

// --- Lógica para Destruir Entidades Indesejadas (Sua lógica original) ---
if (room == rm_catcine_2) {
    with(obj_player) { instance_destroy(); }
    with(obj_camera) { instance_destroy(); }
}

// --- Lógica de Avanço e Efeito "Typewriter" ---
var _texto_completo_da_linha = dialogos[dialogo_atual].texto;

// Efeito "Typewriter"
tempo_delay++;
if (tempo_delay >= velocidade_texto) {
    tempo_delay = 0;
    if (indice < string_length(_texto_completo_da_linha)) {
        indice++;
        texto_atual = string_copy(_texto_completo_da_linha, 1, indice);
		// Pega o caractere que acabou de ser adicionado
		
		var _som_sorteado = choose(snd_teclado1, snd_teclado2, snd_teclado3);
        var _char_adicionado = string_char_at(_texto_completo_da_linha, indice);
        
        // Toca o som apenas se não for um espaço
        if (_char_adicionado != " " ) {
			if !instance_exists(obj_transicao_2){
				audio_play_sound(_som_sorteado, 1, false);
			}// Use o nome do seu recurso de som
        }
        // alarm[0] = 1; // Sua lógica de alarme
    }
}

// Input do jogador para avançar
if (keyboard_check_pressed(vk_space)) {
    count_space++;
    var _terminou_de_escrever = (indice >= string_length(_texto_completo_da_linha));
    
    if (!_terminou_de_escrever) {
        // Se não terminou, completa a linha atual
        indice = string_length(_texto_completo_da_linha);
        texto_atual = _texto_completo_da_linha;
    } else {
        // Se já terminou, marca para ir para o próximo diálogo
        proximo_dialogo = true;
    }
}

// Input para pular a cutscene (Sua lógica original)
if (keyboard_check_pressed(vk_escape)) {
    count_space++;
    exibe = true;
    if (count_space > 1) {
        exibe = false;
        count_space = 0;
        if (room == rm_catcine_2) {
			// registrando o primeiro save
			show_message("Criando save inicial manual para: " + global.player_name);

				
           // carrega_jogo2(global.nome_jogador, rm_prototipo, 4, 1273, 322);
			
		    instance_create_layer(x,y,layer,obj_transicao_2)
            instance_destroy(); 
        } else if room == rm_catcine {
			show_message(global.player_name)
			ini_open("save.sav");
				//glovalplayer_name existe no menu tem que ser zerado depois
				// Escreve os valores iniciais exatos que você definiu
				ini_write_real(global.player_name, "x_atual", 128.923584);
				ini_write_real(global.player_name, "y_atual", 328.504913);
				ini_write_real(global.player_name, "vida_atual", 10.000000);
				ini_write_real(global.player_name, "sala_atual", 3.000000); // Certifique-se que '3' é o ID da sala correta
				ini_write_real(global.player_name, "etapa_historia", 1.000000);
				ini_write_real(global.player_name, "pontuacao", 0.000000);
				ini_write_real(global.player_name, "estrelas_coletadas", 0.000000);
				ini_write_real(global.player_name, "qtd_tiros", 4.000000);

				// ADIÇÃO IMPORTANTE:
				// Adicione a chave do inventário como vazia para
				// garantir que sua função de carregar não dê erro.
				ini_write_string(global.player_name, "inventario", ""); //ainda nao sei se vou usar

				ini_close();

				show_debug_message("Save inicial criado. Chamando transição...");
            //carrega_jogo2(global.nome_jogador, rm_prototipo, 1);
			instance_create_layer(x,y,layer,obj_transicao_2)
            instance_destroy();
        }
    }
}

// Lógica para avançar para o próximo diálogo
if (proximo_dialogo) {
    proximo_dialogo = false;
    dialogo_atual++;

    if (dialogo_atual < array_length(dialogos)) {
        // Reseta as variáveis para a nova linha de diálogo
        texto_atual = "";
        indice = 0;
        imagem_dialogo = dialogos[dialogo_atual].imagem;
    } else {
        // Fim de todos os diálogos
        mostrando_dialogo = false;
        if (room == rm_catcine_2) {
            //carrega_jogo2(global.nome_jogador, rm_prototipo, 4, 1273, 322);
           instance_create_layer(x,y,layer,obj_transicao_2)
		   instance_destroy();
        } else {
           // carrega_jogo2(global.nome_jogador, rm_prototipo, 1);
           instance_create_layer(x,y,layer,obj_transicao_2)
		   instance_destroy();
        }
    }
}
