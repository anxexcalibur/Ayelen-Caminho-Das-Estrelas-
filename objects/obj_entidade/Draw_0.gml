/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
if(mostra_estado){
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)

	draw_text(x,y - sprite_height * 1.2,estado)
	draw_set_halign(-1)
	draw_set_halign(-1)
}
if alarm[1] > 0 {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
}else{
	draw_self();
}

