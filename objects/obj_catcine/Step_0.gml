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
            carrega_jogo2(global.nome_jogador, rm_prototipo, 4, 1273, 322);
            instance_destroy();
        } else {
            carrega_jogo2(global.nome_jogador, rm_prototipo, 1);
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
            carrega_jogo2(global.nome_jogador, rm_prototipo, 4, 1273, 322);
            instance_destroy();
        } else {
            carrega_jogo2(global.nome_jogador, rm_prototipo, 1);
            instance_destroy();
        }
    }
}
