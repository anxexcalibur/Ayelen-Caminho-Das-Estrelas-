if string_length(keyboard_string)>nome_max
{
	keyboard_string = string_copy(keyboard_string,1,nome_max);
}
if keyboard_check(vk_escape){
	instance_create_layer(x,y,layer,obj_transicao_2)
	obj_transicao_2.destino = rm_menu
}