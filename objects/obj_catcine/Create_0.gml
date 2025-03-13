  // Texto atual sendo mostrado
 // Texto completo
// Inicialização
// Inicializando

exibe = false
count_space = 0 
indice = 0;  
tempo_delay = 0;  
texto_atual = "";  
imagem_dialogo = spr_dialogoimage;  
mostrando_dialogo = true;  
pular_dialogo = false;  
proximo_dialogo = false;  
dialogo_atual = 0;  

// Lista de diálogos (já definida no seu exemplo)

   




dialogo_atual = 0;  // Parágrafo atual do diálogo


function string_width_ext_wrap(texto, largura_max, separacao) {
    var linhas = [];
    var palavras = string_split(texto, " ");
    var linha_atual = "";

    for (var i = 0; i < array_length(palavras); i++) {
        var nova_linha = linha_atual + palavras[i] + " ";
        if (string_width(nova_linha) > largura_max) {
            if (linha_atual != "") {
                array_push(linhas, linha_atual);
            }
            linha_atual = palavras[i] + " ";
        } else {
            linha_atual = nova_linha;
        }
    }

    if (linha_atual != "") {
        array_push(linhas, linha_atual);
    }

    return linhas;
}

