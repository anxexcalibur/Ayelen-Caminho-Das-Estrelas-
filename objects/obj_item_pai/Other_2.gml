/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Verificar se o arquivo de itens coletados existe


/*if (file_exists("itens_coletados.json")) {
    // Abre o arquivo para leitura (arquivo de texto)
    var file = file_text_open_read("itens_coletados.json");
    
    // Lê o conteúdo do arquivo
    var json_string = file_text_read_string(file);
    
    // Converte a string JSON de volta para o ds_map
    global.itens_coletados = json_decode(json_string);
    
    // Fecha o arquivo
    file_text_close(file);
}
*/
if (ds_map_exists(global.itens_coletados, id_item)) {
    // O item já foi coletado, então destrói a instância
    instance_destroy();
}