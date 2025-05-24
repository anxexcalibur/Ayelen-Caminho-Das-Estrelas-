// Criar o identificador único para cada item, baseado na posição
var id_item = string(floor(x)) + "_" + string(floor(y));
  // Identificador único para cada item

// Verificar se o item já foi coletado
if (!variable_global_exists("itens_coletados")) {
    global.itens_coletados = ds_map_create();
}

if keyboard_check(ord("P")){
	var quantos = ds_map_size(global.itens_coletados)
	show_message(string(quantos))
}



// Pegando todas as chaves do ds_map