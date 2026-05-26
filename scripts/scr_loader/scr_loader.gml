function carrega_jogo_3(_jogador, _sala, _etapa, _x, _y, _direcao_transicao) {
    
    // Para música da cutscene
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);
        audio_play_sound(snd_background, 1, true);
    }
    
    // Verifica save
    if (!file_exists("save.sav")) {
        show_message("Arquivo de save não encontrado!");
        return;
    }
    
    // DESTROI PLAYER ANTIGO (resolve o problema do persistente)
    with (obj_player) {
        instance_destroy();
    }
    
    // Lê dados do save
    ini_open("save.sav");
    
    var sala_final = is_undefined(_sala) ? ini_read_real(_jogador, "sala_atual", room) : _sala;
    var x_final = is_undefined(_x) ? ini_read_real(_jogador, "x_atual", 0) : _x;
    var y_final = is_undefined(_y) ? ini_read_real(_jogador, "y_atual", 0) : _y;
    var etapa_final = is_undefined(_etapa) ? ini_read_real(_jogador, "etapa_historia", 1) : _etapa;
    var vida_salva = ini_read_real(_jogador, "vida_atual", 10);
    var pontuacao_salva = ini_read_real(_jogador, "pontuacao", 0);
    var estrelas_salvas = ini_read_real(_jogador, "estrelas_coletadas", 0);
    var tiros_salvos = ini_read_real(_jogador, "qtd_tiros", 0);
    
    ini_close();
    
    // Atualiza globais
    global.pontuacao = pontuacao_salva;
    global.estrelas_coletadas = estrelas_salvas;
    
    // Vai pra sala
    room_goto(sala_final);
    
    // Cria controller se não existir
    if (!instance_exists(obj_controller)) {
        instance_create_layer(0, 0, "Instances", obj_controller);
    }
    
    // CRIA PLAYER NA POSIÇÃO CERTA
    var inst_player = instance_create_layer(x_final, y_final, "Instances", obj_player);
    inst_player.nome_player = _jogador;
    inst_player.vida_atual = vida_salva;
    inst_player.etapa_historia = etapa_final;
    inst_player.qtd_tiros = tiros_salvos;
    
    // Cria transição de entrada
    var inst_trans = instance_create_layer(0, 0, "instances", obj_transicao_2);
    inst_trans.direcao = _direcao_transicao;
}