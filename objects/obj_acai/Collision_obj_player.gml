/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.pontuacao += 3
global.balas++

instance_destroy()
// Identifica o item com base na posição
var id_item = string(x) + "_" + string(y);

// Marca o item como coletado
global.itens_coletados[? id_item] = true;

// Opcional: Salvar o progresso no arquivo INI
ini_open("save_data.ini");
ini_write_string("itens_coletados", id_item, "true");
ini_close();

// Destroi o item
instance_destroy();
