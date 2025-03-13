
// Cria um array para armazenar os valores
//teste para ver se ta armazenando no fd_map
 //existe = ds_map_exists(global.itens_coletados,id_item)
 //show_message(string(existe))
  // resulktado = ok
//teste para ver se existe mais de uma instancia sendo armazenada
 
 //resultado = ok

// Código para ser rodado quando o item é coletado
// Código para ser rodado quando o item é coletado
// Criando o identificador único para cada item
var id_item = string(x) + "_" + string(y); // Identificador único para cada item

// Verificando se já foi coletado antes
if (!ds_map_exists(global.itens_coletados, id_item)) {
    // Se o item não foi coletado, armazena ele no ds_map
    ds_map_set(global.itens_coletados, id_item, true);  // Usando "true" como valor de marcação

    // Somando pontos ou fazendo qualquer outra coisa necessária ao coletar o item
     // Exemplo de adicionar pontos

    // Destrói a instância do item após ser coletado
    instance_destroy();
}