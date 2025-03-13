// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Criando meu Menu
// Variável para armazenar o nome digitado pelo jogador
global.nome_jogador = "";
var current_room;
current_room = room;
// Seleção do menu
sel = 0;
marg_val = 32;
marg_total = 32;

// Controlando a pag do menu
pag = 0;

#region Metodos
// Desenha menu
// Função para desenhar o campo de entrada
desenha_input_nome = function() {
    draw_set_font(fnt_menu); // Define a fonte
    draw_set_halign(fa_center); // Alinha o texto no centro horizontalmente
    draw_set_valign(fa_middle); // Alinha o texto no centro verticalmente
    
    var input_x = display_get_gui_width() / 2; // Posição X central
    var input_y = display_get_gui_height() / 2 - 40; // Posição Y acima do centro
    
    // Desenha o texto "Digite seu nome:"
    draw_text(input_x, input_y - 20, "Digite seu nome:");
    
    // Desenha a caixa de entrada (retângulo)
    draw_rectangle(input_x - 100, input_y, input_x + 100, input_y + 30, false);
    
    // Desenha o nome que o jogador está digitando
    draw_text(input_x, input_y + 15, global.nome_jogador);
}

// Função para capturar a entrada do jogador
captura_input_nome = function() {
    // Captura as teclas pressionadas
    var key = keyboard_key; // Tecla pressionada
    
    // Verifica se é uma tecla de letra ou de espaço
    if ((key >= vk_a && key <= vk_z) || (key >= vk_0 && key <= vk_9) || key == vk_space) {
        // Adiciona a letra ou espaço ao nome do jogador
        global.nome_jogador += chr(key);
    } else if (key == vk_backspace) {
        // Remove o último caractere se pressionar backspace
        if (string_length(global.nome_jogador) > 0) {
            global.nome_jogador = string_delete(global.nome_jogador, string_length(global.nome_jogador), 1);
        }
    } else if (key == vk_enter) {
        // Se pressionar enter, inicia o jogo
        alarm[0] = 5; // Dispara o alarme para iniciar o jogo
    }
}
fist_save = function(){
	alarm[1] = 5;
}
function salvar_jogo(nome_jogador, x, y, etapa_historia) {
    // Verifica se x e y foram fornecidos, caso contrário define valores padrão
    if (argument_count < 3) {
        x = 60;
        y = 240;
    }

    // Cria ou abre o arquivo de save "save.sav" para escrita
    var file_id = file_text_open_write("save.sav");
    
    if (file_id != -1) {
        // Escreve os dados do jogador no arquivo de save
        file_text_write_string(file_id, "[" + string(nome_jogador) + "]\n");
        file_text_write_string(file_id, "x_atual=" + string(x) + "\n");
        file_text_write_string(file_id, "y_atual=" + string(y) + "\n");
        file_text_write_string(file_id, "vida_atual=" + string(obj_player.vida_atual) + "\n");
        file_text_write_string(file_id, "sala_atual=" + string(current_room) + "\n");
        file_text_write_string(file_id, "etapa_historia=" + string(obj_player.etapa_historia) + "\n");
        
        file_text_close(file_id); // Fecha o arquivo de save
    } else {
        show_debug_message("Erro ao abrir o arquivo save.sav para escrita.");
    }
	
}


desenha_menu = function(_menu){
    // Desenhando meu menu
    // Pegando o tamanho do meu menu
    var _qtd = array_length(_menu);
    // Definindo a fonte
    draw_set_font(fnt_menu)
    // Alinhando o texto
    define_align(0,0);

    // Definindo espaço entre linhas
    var _espaco_y = string_height("I") + 16;

    // Pegando a altura da minha tela
    var _alt = display_get_gui_height();
    var _alt_menu = _espaco_y * _qtd;
    // Pegando largura
    var _larg = display_get_gui_width();

    // Desenhando
    for(var i = 0; i < _qtd; i++)
    {
        // Cor do texto;
        var _cor = c_white, _marg_x = 0;
        // Desenhando o item do menu
        
        // Permitindo a seleção
        // Checando se a seleção está no texto atual
        if(menus_sel[pag] == i){
            _cor = c_green;
            _marg_x = marg_val;
        }
        var _texto = _menu[i][0];
        draw_text_color(20 + _marg_x,(_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _texto, _cor, _cor, _cor, _cor, 1);
    }
    
    // Desenhando o outro lado do menu (as opções quando elas existirem)
    for (var i = 0; i < _qtd; i++)
    {
        // Checar se eu preciso desenhar as opções de fato
        switch(_menu[i][1])
        {
            case menu_acoe.ajustes_menu:
            case menu_acoe.ajustes_saves:
            {
                // Desenhando as opções do lado direito
                // Salvando o índice onde eu estou
                var _indice = _menu[i][3];
                var _txt = _menu[i][4][_indice];
                // Eu só posso ir para a esquerda somente se eu não estou no índice 0
                var _esq = _indice > 0 ? "<< " : "";
                // Eu só posso ir para a direita se somente se eu ainda não estou no final do vetor
                var _dir = _indice < array_length(_menu[i][4]) - 1 ? " >>" : "";
                
                var _cor = c_white;
                // Se eu estou nessa opção, então eu mudo de cor
                if(alterando && menus_sel[pag] == i) _cor = c_red;
                draw_text_color(_larg / 2, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _esq + _txt + _dir, _cor, _cor, _cor, _cor, 1);
                
                break;
            }
        }
    }
    // Resetando os meus draw set 
    draw_set_font(-1);
    define_align(-1,-1);
}

controla_menu = function(_menu){
    // Pegando as teclas
    var _up, _down, _avanca, _recua, _left, _right;
    static _animar = false;
    _up = keyboard_check_pressed(vk_up);
    _down = keyboard_check_pressed(vk_down);
    
    _avanca = keyboard_check_pressed(vk_enter);
    _recua = keyboard_check_pressed(vk_escape);
    var _sel = menus_sel[pag];
    _right = keyboard_check_pressed(vk_right);
    _left = keyboard_check_pressed(vk_left);

    // Checando se eu não estou alterando as opções do jogo
    if(!alterando){
        if(_up || _down){
            // Mudando o valor do sel
            menus_sel[pag] += _down - _up;
        
            // Limitando o valor do sel
            var _tam = array_length(_menu) - 1;
            menus_sel[pag] = clamp(menus_sel[pag], 0, _tam);
        
            // Avisando que pode animar
            _animar = true;
        
        }
    } else {
        // Ou seja, eu estou alterando as opções
        _animar = false;
        // Se eu apertar para esquerda ou para direita
        if(_right || _left){
            // Achando meu limite
            var _limite = array_length(_menu[_sel][4]) - 1;
            // Mudando meu índice
            menus[pag][_sel][3] += _right - _left;
            // Garantindo que eu não vou sair do limite
            menus[pag][_sel][3] = clamp(menus[pag][_sel][3], 0, _limite);
        }
    }
    
    // O que fazer quando apertar o enter
    if (_avanca)
    {
        switch(_menu[_sel][1])
        {
            // Caso seja 0, ele roda um método
            case menu_acoe.roda_metodo:
            _menu[_sel][2]();
            break;
            // Mudar o valor da página
            case menu_acoe.carrega_menu:
            pag = _menu[_sel][2];
            break;
            case menu_acoe.ajustes_menu:
            case menu_acoe.ajustes_saves:
                alterando = !alterando;
                // Rodando o método
                if(!alterando)
                {
                    // Salvando o argumento do menu
                    var _arg = _menu[_sel][3];
                    _menu[_sel][2](_arg);
                }
                break;
        }
    }
    
    // Aumentando sempre o marg_val (^^) só retorna true se apertei um dos dois ou se apertei os dois
    if(_animar){
        marg_val = marg_total * valor_ac(ac_margem, _up ^^ _down, 0);
    }
}
#endregion

inicia_jogo = function() {
    alarm[0] = 5;
}
volta_menu = function(){
	instance_destroy(obj_player)
	room_goto(rm_menu)
}

fecha_jogo = function() {
    game_end();
}

function listar_saves() {
    var save_list = [];
    
    if (file_exists("save.sav")) {
        var file_id = file_text_open_read("save.sav");

        if (file_id != -1) {
            // Ler todas as linhas do arquivo
            while (!file_text_eof(file_id)) {
                var linha = file_text_readln(file_id);
                
                // Verifica se a linha começa e termina com colchetes
                var inicio_colchete = string_pos("[", linha);
                var fim_colchete = string_pos("]", linha);
                
                if (inicio_colchete > 0 && fim_colchete > inicio_colchete) {
                    // Extrai o nome do jogador entre os colchetes
                    var jogador = string_copy(linha, inicio_colchete + 1, fim_colchete - inicio_colchete - 1);
                    array_push(save_list, jogador);
                }
            }
            
            file_text_close(file_id);
        } else {
            show_debug_message("Erro ao abrir o arquivo save.sav");
        }
    }

    return save_list;
}

// Inicializar a lista de saves
saves = listar_saves();

function carregar_itens() {
    // Define o nome do arquivo que contém os itens salvos de todos os jogadores
    var filename = "_itens.ini";  // Arquivo único para todos os jogadores
    
    // Verifica se o arquivo existe
    if (file_exists(filename)) {
        var file = file_text_open_read(filename);  // Abre o arquivo para leitura
        var in_section = false;

        // Limpa o ds_map atual para carregar os dados salvos
        

        // Lê o arquivo linha por linha
        while (!file_text_eof(file)) {
            var linha = file_text_readln(file);

            // Verifica se estamos na seção correta do jogador
            if (string_starts_with(linha, "[")) {
                in_section = (linha == "[" + global.nome_jogador + "]");
                continue;
            }

            // Se estivermos na seção do jogador, processa a linha
            if (in_section) {
                var igual_pos = string_pos("=", linha);
                if (igual_pos > 0) {
                    var key = string_copy(linha, 1, igual_pos - 1);  // Extrai a chave
                    var value = string_delete(linha, 1, igual_pos);  // Extrai o valor

                    // Remove as aspas do valor
                    value = string_replace_all(value, "\"", "");

                    // Adiciona o par chave-valor ao ds_map
                    global.itens_coletados[? key] = value;
                }
            }
        }

        // Fecha o arquivo após a leitura
        file_text_close(file);

        // Exibe uma mensagem indicando que os itens foram carregados com sucesso
        show_message("Itens carregados com sucesso!");
    } else {
        show_message("Arquivo de itens não encontrado!");
    }
}




carregar_jogo = function(_value) {
    var jogador = saves[_value]; // Obtém o nome do jogador selecionado na lista
    global.nome_jogador = jogador; // Armazena o nome do save atual na variável global
    
    // Verifica se o objeto obj_player ainda não existe na cena
    if (!instance_exists(obj_player)) {
        // Cria uma nova instância de obj_player
        instance_create_layer(0, 0, "Instances", obj_player);
    }

    if (file_exists("save.sav")) { // Verifica se o arquivo de save existe
        ini_open("save.sav"); // Abre o arquivo de save
        obj_player.x = ini_read_real(jogador, "x_atual", 0);
        obj_player.y = ini_read_real(jogador, "y_atual", 0);
        obj_player.vida_atual = ini_read_real(jogador, "vida_atual", 0);
        obj_player.etapa_historia = ini_read_real(jogador, "etapa_historia", 0); // Adiciona a etapa da história
        global.pontuacao = ini_read_real(jogador, "pontuacao", 0)
        room_goto(ini_read_real(jogador, "sala_atual", 0));
        ini_close(); // Fecha o arquivo de save
    } else {
        show_message("Arquivo de save não encontrado!");
    }
    
    // Carregando os itens
   carregar_itens();
};



ajusta_tela = function(_valor) {
    switch(_valor){
        case 0:
            window_set_fullscreen(true);
            break;
        case 1:
            window_set_fullscreen(false);
            break;
    }
}

ajusta_dificuldade = function(_valor) {
    switch (_valor) {
        case 0:
            global.dificuldade = .5;
            break;
        case 1:
            global.dificuldade = 1;
            break;
        case 2:
            global.dificuldade = 1.5;
            break;
        case 3:
            global.dificuldade = 3;
            break;
    }
}

// Definindo os índices dos menus
menus_lista = {
    principal: 0,
    opcoes: 1,
    tela: 2,
    dificuldade: 3,
    carregar: 4, // Novo índice para o menu de saves
    pause: 5
};

atualizar_menu_principal = function() {
	if room ==  rm_menu{ 
		var _menu = [
		  ["Iniciar", menu_acoe.roda_metodo, inicia_jogo]
		 ];
	}else{
		var _menu = [
		  ["Voltar Pro Menu", menu_acoe.roda_metodo, volta_menu]
		 ];
	}
    
    var save_files = listar_saves();
    if (array_length(save_files) > 0) {
        array_push(_menu, ["Carregar", menu_acoe.carrega_menu, menus_lista.carregar]);
    }
    
    array_push(_menu, ["Opções", menu_acoe.carrega_menu, menus_lista.opcoes]);
    array_push(_menu, ["Sair do Jogo", menu_acoe.roda_metodo, fecha_jogo]);
    
    return _menu;
}

// Definir os menus
menu_principal = atualizar_menu_principal();
menu_opcoes = [
    ["Tipo de Janela", menu_acoe.carrega_menu, menus_lista.tela],
    ["Dificuldade", menu_acoe.carrega_menu, menus_lista.dificuldade],
    ["Voltar", menu_acoe.carrega_menu, menus_lista.principal]
];
menu_dificuldade = [
    ["Dificuldade", menu_acoe.ajustes_menu, ajusta_dificuldade, 1, ["Fácil", "Normal", "Difícil", "Impossível"]],
    ["Voltar", menu_acoe.carrega_menu, menus_lista.opcoes]
];
menu_tela = [
    ["Tipo de Tela", menu_acoe.ajustes_menu, ajusta_tela, 1, ["Tela cheia", "Janela"]],
    ["Voltar", menu_acoe.carrega_menu, menus_lista.opcoes]
];
menu_pause = [
    ["Voltar", menu_acoe.carrega_menu, menus_lista.principal],
    ["Sair", menu_acoe.roda_metodo, fecha_jogo]
];
menu_carregar = [
    ["Saves", menu_acoe.ajustes_saves, carregar_jogo, 0, saves],
    ["Voltar", menu_acoe.carrega_menu, menus_lista.principal]
];

// Salvando todos os meus menus

menus = [menu_principal, menu_opcoes, menu_carregar, menu_tela, menu_dificuldade, menu_pause];

// Salvando a seleção de cada menu
menus_sel = array_create(array_length(menus), 0);
alterando = false;


