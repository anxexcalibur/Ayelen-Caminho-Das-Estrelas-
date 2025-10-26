function carrega_jogo2(_jogador, _sala, _etapa, _x, _y, _direcao_transicao) {
    // Verifica se uma instância de obj_player já existe na cena
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);  // Para a música de protótipo
        audio_play_sound(snd_background, 1, true);
    }

    if (!instance_exists(obj_player)) {
        // Cria uma nova instância de obj_player
         if (!instance_exists(obj_controller))
		 {
			var inst_controler = instance_create_layer(0, 0, "Instances", obj_controller);
		 }
		var inst_player = instance_create_layer(0, 0, "Instances", obj_player);
		
        if (file_exists("save.sav")) {
            ini_open("save.sav"); // Abre o arquivo de save

            // Define as posições usando os argumentos se forem fornecidos, senão usa o valor salvo
            inst_player.x = is_undefined(_x) ? ini_read_real(_jogador, "x_atual", 0) : _x;
            inst_player.y = is_undefined(_y) ? ini_read_real(_jogador, "y_atual", 0) : _y;

            // Outros dados do jogador
            inst_player.vida_atual = ini_read_real(_jogador, "vida_atual", 10);
			// Vida padrão = 100
            inst_player.etapa_historia = is_undefined(_etapa) ? ini_read_real(_jogador, "etapa_historia", 1) : _etapa;
            inst_player.pontuacao = ini_read_real(_jogador, "pontuacao", global.pontuacao);
			
            
            // --- CORREÇÃO APLICADA AQUI ---
            // Agora, se _estrelas for fornecido, ele será usado corretamente.
			
           global.estrelas_coletadas = ini_read_real(_jogador, "estrelas_coletadas", 0)
            
            // Determina a sala: usa _sala se fornecida, ou a sala salva
            var sala_atual = is_undefined(_sala) ? ini_read_real(_jogador, "sala_atual", room) : _sala;

            ini_close(); // Fecha o arquivo de save

            // Move para a sala especificada
            room_goto(sala_atual);
			instance_create_layer(x,y,"instances", obj_transicao_2);
			obj_transicao_2.direcao = _direcao_transicao
        } else {
            show_message("Arquivo de save não encontrado!");
        }
    } else {
        show_message("O jogador já está presente na cena!");
    }
}

/**
 * Carrega o jogo dinamicamente.
 * - _jogador (string): OBRIGATÓRIO. A seção do INI para ler (ex: "primeiro save").
 * - Opcionais: _sala, _etapa, _x, _y. Se fornecidos, substituem os valores do save.
 * - _direcao_transicao (string): A direção da transição de fade.
 */
function carrega_jogo_3(_jogador, _sala, _etapa, _x, _y, _direcao_transicao) {
    
    // 1. Para a música da cutscene (se estiver tocando)
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);
        audio_play_sound(snd_background, 1, true);
    }
    
    // 2. Verifica se o jogador já existe
    if (instance_exists(obj_player)) {
        show_message("O jogador já está presente na cena!");
        return; // Aborta a função
    }

    // 3. Verifica se o arquivo de save existe
    if (!file_exists("save.sav")) {
        show_message("Arquivo de save não encontrado!");
        return; // Aborta a função
    }

    // 4. O save existe e o player não. Vamos carregar.
    ini_open("save.sav");

    // 5. DECIDE OS VALORES FINAIS
    //    Esta é a sua lógica de "override", está perfeita.
    
    // Determina a sala: usa _sala se fornecida, ou a sala salva
    var sala_final = is_undefined(_sala) ? ini_read_real(_jogador, "sala_atual", room) : _sala;
    
    // Determina a posição X: usa _x se fornecido, ou o X salvo
    var x_final = is_undefined(_x) ? ini_read_real(_jogador, "x_atual", 0) : _x;
    
    // Determina a posição Y: usa _y se fornecido, ou o Y salvo
    var y_final = is_undefined(_y) ? ini_read_real(_jogador, "y_atual", 0) : _y;
    
    // Determina a etapa da história: usa _etapa se fornecida, ou a etapa salva
    var etapa_final = is_undefined(_etapa) ? ini_read_real(_jogador, "etapa_historia", 1) : _etapa;

    // 6. LÊ O RESTO DOS DADOS (que não são opcionais)
    var vida_salva = ini_read_real(_jogador, "vida_atual", 10);
    var pontuacao_salva = ini_read_real(_jogador, "pontuacao", 0);
    var estrelas_salvas = ini_read_real(_jogador, "estrelas_coletadas", 0);
    var tiros_salvos = ini_read_real(_jogador, "qtd_tiros", 0); // <-- Você não estava carregando isso!
    // (Leia o inventário aqui também)
    
    ini_close(); // Fecha o arquivo de save

    // 7. VAI PARA A SALA (Requisito: ANTES de criar o player)
    if (room != sala_final) {
        room_goto(sala_final);
    }

    // 8. Cria o Controller (se precisar)
    if (!instance_exists(obj_controller)) {
        instance_create_layer(0, 0, "Instances", obj_controller);
    }
    
    // 9. Cria o Player NA POSIÇÃO CORRETA
    var inst_player = instance_create_layer(x_final, y_final, "Instances", obj_player);
    
    // 10. Alimenta o player com os dados carregados/decididos
    inst_player.vida_atual = vida_salva;
    inst_player.etapa_historia = etapa_final; // Usa o valor final (do save ou do override)
    inst_player.pontuacao = pontuacao_salva;
    inst_player.qtd_tiros = tiros_salvos; // Aplicando o valor
    inst_player.nome_player = _jogador
    // 11. Alimenta as variáveis globais
    global.pontuacao = pontuacao_salva;
    global.estrelas_coletadas = estrelas_salvas;

    // 12. CRIA A TRANSIÇÃO DE ENTRADA (só agora que tudo está pronto)
    var inst_trans = instance_create_layer(0, 0, "instances", obj_transicao_2);
    inst_trans.direcao = _direcao_transicao;
}