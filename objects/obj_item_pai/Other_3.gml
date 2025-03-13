// Verifica se existe o ds_map global.itens_coletados antes de salvar
/*if (global.itens_coletados) {
    // Abre o arquivo para escrita (arquivo de texto)
    var file = file_text_open_write("itens_coletados.json");
    
    // Converte o ds_map para uma string JSON e escreve no arquivo
    var json_data = json_encode(global.itens_coletados, true);  // true para formatar com indentação
    
    // Escreve o JSON no arquivo
    file_text_write_string(file, json_data);  // Agora o arquivo e o conteúdo
    
    // Fecha o arquivo
    file_text_close(file);  // Fecha o arquivo após escrever
}
*/