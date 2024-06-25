// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_textos(){
	switch npc_nome{
		case "orientadora":
			ds_grid_add_text("olá qweqweqweqweqweqweqweqweqweqweqweqw",spr_orientadora_rosto,0,"orientadora");
			ds_grid_add_text("alohaqwe qwe qweqw qwqw qwe qw qwqw qwqweqw",spr_ayelen_face,1,"Ayelen");
			ds_grid_add_text("jpão ´e bom",spr_orientadora_rosto,1,"sapatao");
		break;
	}
}

// função parra Adicionar uma nova linha na matriz grid
function ds_grid_add_row(){
	///@arg ds_grid
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);
}
//Função 
function ds_grid_add_text(_texto, _retrato, _lado, _nome) {
    var _grid = texto_grid;
    var _y = ds_grid_add_row(_grid);
    
    _grid[# Infos.Texto, _y] = _texto;
    _grid[# Infos.Retrato, _y] = _retrato;
    _grid[# Infos.Lado, _y] = _lado;
    _grid[# Infos.Nome, _y] = _nome;
}
