// =====================================================================
// SUBSTITUA O FINAL DO SEU STEP POR ESSE BLOCO AQUI:
// =====================================================================

// Lista de salas onde o menu NÃO deve ser exibido
var menu_block_lista = [rm_catcine, rm_catcine_2, rm_username];

// Verifica se está no menu principal
if (room == rm_menu) {
    global.menu_existe = true;
}
// Se estiver numa sala bloqueada, desativa o menu
else if (array_contains(menu_block_lista, room)) {
    global.menu_existe = false;
}
else {
    // SE NÃO ESTIVER no rm_menu (ou seja, o jogo acabou de carregar a fase), 
    // força o menu a começar FECHADO para não nascer por cima do gameplay!
    if (variable_instance_exists(id, "fase_carregada") == false) {
        global.menu_existe = false;
        fase_carregada = true; // Trava para você conseguir abrir no ESC depois
    }
}

// Tecla para abrir/fechar o menu de pausa durante o jogo
var interruptor_menu = keyboard_check_pressed(vk_escape);

// Alterna o menu apenas se não estiver em uma sala bloqueada
if (interruptor_menu && !array_contains(menu_block_lista, room)) {
    global.menu_existe = !global.menu_existe;
}

// Se o menu está ativo, atualiza os textos e controla a navegação
if (global.menu_existe) {
    
    // ATUALIZAÇÃO EM TEMPO REAL: Se estiver na fase, o botão vira "Voltar pro Menu" automaticamente!
    menu_principal = atualizar_menu_principal();
    menus[0] = menu_principal; 
    
    // Executa o controle de navegação do menu
    controla_menu(menus[pag]);
}
// SÓ ADICIONE ISSO NO FINAL DO SEU STEP (Na última linha do script)
// =====================================================================

// Escudo de segurança para evitar erro de leitura caso o Step rode muito rápido
if (variable_instance_exists(id, "max_estrelas") && variable_instance_exists(id, "estrelas")) {
    if (room == rm_menu) {
        // 1. Faz as estrelas do cenário piscarem paradas no céu
        for (var i = 0; i < max_estrelas; i++) {
            estrelas[i].brilho += estrelas[i].vel;
            if (estrelas[i].brilho >= 1 || estrelas[i].brilho <= 0.1) {
                estrelas[i].vel = -estrelas[i].vel;
            }
        }
        
        // 2. Solta as partículas verdes na posição do mouse
        if (variable_instance_exists(id, "part_sys")) {
            part_emitter_region(part_sys, part_emit, mouse_x - 2, mouse_x + 2, mouse_y - 2, mouse_y + 2, ps_shape_ellipse, ps_distr_gaussian);
            part_emitter_stream(part_sys, part_emit, part_type, 1); 
        }
    } else {
        // Desliga o rastro se sair do menu principal
        if (variable_instance_exists(id, "part_sys")) {
            part_emitter_stream(part_sys, part_emit, part_type, 0);
        }
    }
}