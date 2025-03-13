// Criar o identificador único para cada item, baseado na posição
var id_item = string(x) + "_" + string(y);  // Identificador único para cada item

// Verificar se o item já foi coletado
if (ds_map_exists(global.itens_coletados, id_item)) {
    // O item já foi coletado, então destrói a instância
    instance_destroy();
}
if keyboard_check(ord("P")){
	var quantos = ds_map_size(global.itens_coletados)
	show_message(string(quantos))
}



// Pegando todas as chaves do ds_map