// lista de salas onde o menu NÃO deve ser exibido
var menu_block_lista = [rm_catcine,rm_catcine_2, rm_username];

// verifica se está no menu principal
if (room == rm_menu) {
    global.menu_existe = true;
}
// se estiver numa sala bloqueada, desativa o menu
else if (array_contains(menu_block_lista, room)) {
    global.menu_existe = false;
}

// tecla para abrir/fechar menu
var interruptor_menu = keyboard_check_pressed(vk_escape);

// alterna o menu apenas se não estiver bloqueado
if (interruptor_menu && !array_contains(menu_block_lista, room)) {
    global.menu_existe = !global.menu_existe;
}

// se o menu está ativo, controla ele normalmente
if (global.menu_existe) {
    controla_menu(menus[pag]);
}
