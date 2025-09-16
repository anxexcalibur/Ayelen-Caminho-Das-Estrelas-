 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No Evento Step do obj_controller
if (player == noone) {
    player = instance_find(obj_player, 0);
}

if instance_exists(obj_porta){
	desenha_porta = obj_porta.mostrar_mensagem
}

var _room_atual = room
var _key_esc_capture = keyboard_check_pressed(vk_escape)
if _key_esc_capture {
	global.menu_existe = !global.menu_existe;
} 








