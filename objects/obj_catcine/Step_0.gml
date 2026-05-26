/// @description Controla a lógica do diálogo (inputs e avanço)

if (!mostrando_dialogo) exit;

//==============================================================================
// 1. CONFIGURAÇÃO INICIAL DA CENA
//==============================================================================
if (room == rm_catcine_2) {
    if (instance_exists(obj_player)) instance_destroy(obj_player);
    if (instance_exists(obj_camera)) instance_destroy(obj_camera);
}

//==============================================================================
// 2. EFEITO TYPEWRITER
//==============================================================================
var _texto_completo = dialogos[dialogo_atual].texto;

if (indice < string_length(_texto_completo)) {
    tempo_delay++;
    
    if (tempo_delay >= velocidade_texto) {
        tempo_delay = 0;
        indice++;
        texto_atual = string_copy(_texto_completo, 1, indice);
        
        var _char = string_char_at(_texto_completo, indice);
        if (_char != " " && !instance_exists(obj_transicao_2)) {
            var _som = choose(snd_teclado1, snd_teclado2, snd_teclado3);
            audio_play_sound(_som, 1, false);
        }
    }
}

//==============================================================================
// 3. INPUTS DO JOGADOR
//==============================================================================
if (keyboard_check_pressed(vk_space)) {
    var _terminou = (indice >= string_length(_texto_completo));
    
    if (!_terminou) {
        indice = string_length(_texto_completo);
        texto_atual = _texto_completo;
    } else {
        proximo_dialogo = true;
    }
}

if (keyboard_check_pressed(vk_escape)) {
    count_space++;
    exibe = true;
    
    if (count_space > 1) {
        exibe = false;
        count_space = 0;
        
        // Cria save inicial só na primeira cutscene
        if (room == rm_catcine) {
            ini_open("save.sav");
            ini_write_real(global.player_name, "x_atual", 128.923584);
            ini_write_real(global.player_name, "y_atual", 328.504913);
            ini_write_real(global.player_name, "vida_atual", 10.000000);
            ini_write_real(global.player_name, "sala_atual", rm_prototipo); // CORRIGIDO!
            ini_write_real(global.player_name, "etapa_historia", 1.000000);
            ini_write_real(global.player_name, "pontuacao", 0.000000);
            ini_write_real(global.player_name, "estrelas_coletadas", 0.000000);
            ini_write_real(global.player_name, "qtd_tiros", 4.000000);
            ini_write_string(global.player_name, "inventario", "");
            ini_close();
        }
        
        // Garante que o fade vai fechar
        var _trans = instance_create_layer(x, y, layer, obj_transicao_2);
        _trans.direcao = true;
        instance_destroy();
    }
}

//==============================================================================
// 4. AVANÇO DE DIÁLOGO
//==============================================================================
if (proximo_dialogo) {
    proximo_dialogo = false;
    dialogo_atual++;
    
    if (dialogo_atual < array_length(dialogos)) {
        texto_atual = "";
        indice = 0;
        imagem_dialogo = dialogos[dialogo_atual].imagem;
    } else {
        mostrando_dialogo = false;
        var _trans = instance_create_layer(x, y, layer, obj_transicao_2);
        _trans.direcao = true;
        instance_destroy();
    }
}