if !instance_exists(obj_transicao_2)  {
	if global.menu_existe || room == rm_menu{
		desenha_menu(menus[pag]);
		if instance_exists(obj_dialogo) {
	    with (obj_dialogo) {
	        global.dialogo = false; // garante que a flag de diálogo também desliga
	        instance_destroy();     // destrói o objeto do diálogo
	    }
	}
 
	}
}


