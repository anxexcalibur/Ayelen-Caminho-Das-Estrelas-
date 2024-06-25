 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if inicializar == false{
	scr_textos();
	inicializar = true;
	alarm[0] = 4;
}
alpha += .03;
if mouse_check_button_pressed(mb_left){
	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
		caractere = string_length(texto_grid[# Infos.Texto, pagina])
	}else{
		alarm[0] = 4;
		caractere = 0;
		if pagina < ds_grid_height(texto_grid)-1{
			pagina++;
		}else{
			global.dialogo = false;
			instance_destroy()
		
		}
	}
}