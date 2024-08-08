// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

}

global.dificuldade = 1;
//Enumerator para definir as minhas açoes possiveis no menu
enum menu_acoe
{
	roda_metodo,//0
	carrega_menu,//1
	ajustes_menu,//2
	ajustes_saves//3
}
enum menus_lista
{
	principal,
	opcoes,
	carregar,
	tela,
	dificuldade
	
}
//Tremendo a tela
///@function screenshake(valor_da_tremida)
///@arg força_da_tremida
///@arg [dir_mode]
///@arg [direcao]
function screenshake(_treme,_dir_mode,_direcao){
	var tremer = instance_create_layer(0,0,"instances",obj_screenshake)
	tremer.shake = _treme;
	tremer.dir_mode = _dir_mode
	tremer.dir = _direcao
}
//enumerator para definir as minhas açoes possiveis
///@function denfine_align(_vertical,_horizontal)
function define_align(_ver,_hor){
	draw_set_halign(_hor);
	draw_set_valign(_ver);
}
//enum menu_acoes{
//	roda_metodo,
//	carrega_menu
	
//}
//enum menus_lista
//{
//	opcoes,
//	opcoes_opcoes
//}

//Pegar o valor da animation curve
///@function valor_ac(animation_curve,canal, animar,[canal])
function valor_ac(_anim,_animar = false,_chan = 0)
{
	//posição da animação
	static _pos = 0, _val = 0;
	
	//Aumentando o valor do pos
	//Em 1 segundo o pos vai do 0 até 1 (final da animação
	
	_pos += delta_time / 1000000;
	
	if(_animar)_pos = 0;
	//Pegando o valor do canal
	var _canal = animcurve_get_channel(_anim,_chan);
	
	_val = animcurve_channel_evaluate(_canal,_pos);
	
	return _val;
}

function pontuar(valor = 3)
{
	global.pontuacao += valor 
}