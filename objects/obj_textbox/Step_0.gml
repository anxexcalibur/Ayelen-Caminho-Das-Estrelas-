if string_length(keyboard_string)>nome_max
{
	keyboard_string = string_copy(keyboard_string,1,nome_max);
}
if keyboard_check(vk_escape){
	room = rm_menu
}