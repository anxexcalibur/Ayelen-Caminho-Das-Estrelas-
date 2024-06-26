/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Criando meu Menu

var current_room;
current_room = room;
//Seleção do menu
sel = 0;
marg_val = 32;
marg_total =32;
// Controlando a pag do menu
pag = 0;

#region Metodos
// Desenha menu
desenha_menu = function(_menu){
    // Desenhando meu menu
    // Pegando o tamanho do meu menu
    var _qtd = array_length(_menu);
    // definindo a fonte
    draw_set_font(fnt_menu)
    // alinhando o texto

    define_align(0,0);

    // definindo espaço entre linhas
    var _espaco_y = string_height("I") + 16;

    // pegando a altura da minha tela
    var _alt = display_get_gui_height();
    var _alt_menu = _espaco_y * _qtd;
    //pegando largura
    var  _larg = display_get_gui_width();

    //desenhando
    for(var i = 0; i < _qtd; i++)
    {
        // cor do texto;
        var _cor = c_white, _marg_x = 0;
        // desenhando o item do menu
        
        //Permitindo a seleção
        //  checando se a seleção esta no texto atual
        if(menus_sel[pag] == i){
            _cor = c_green;
            _marg_x = marg_val;
        }
        var _texto = _menu[i][0];
        draw_text_color(20 + _marg_x,(_alt / 2) - _alt_menu/2 + (i * _espaco_y), _texto, _cor,_cor, _cor,_cor,1);
    }
    
    //DESENHANDO O OUTRO LADO DO MENU (AS OPÇOES QUANDO ELA EXISTIREM)
    for (var i = 0; i < _qtd; i++)
    {
        //CXhecar se eu preciso desenhar as opçoes de fato
        switch(_menu[i][1])
        {
            case menu_acoe.ajustes_menu:
            {
                //Desenhando as opçoes do lado direito
                //Salvando o Indice onde eu estou
                var _indice = _menu[i][3];
                var _txt = _menu[i][4][_indice];
                //Eu só posso ir para esquerda somente se eu nao estou no indice 0
                var _esq = _indice > 0 ? "<< ":"";
                //Eu só posso ir para a direita se somente se eu ainda não estou no final do vetor
                var _dir = _indice < array_length(_menu[i][4]) -1 ? " >>" : "";
                
                var _cor = c_white;
                //Se eu estou nessa opção, então eu mudo de cor
                if(alterando && menus_sel[pag] == i) _cor  = c_red;
                draw_text_color(_larg / 2,(_alt / 2) - _alt_menu/2 + (i * _espaco_y),_esq +_txt +_dir,_cor,_cor,_cor,_cor, 1);
                
                break;
            }
			case menu_acoe.ajustes_saves:
			{
				//Desenhando as opçoes do lado direito
                //Salvando o Indice onde eu estou
                var _indice = _menu[i][3];
                var _txt = _menu[i][4][_indice];
                //Eu só posso ir para esquerda somente se eu nao estou no indice 0
                var _esq = _indice > 0 ? "<< ":"";
                //Eu só posso ir para a direita se somente se eu ainda não estou no final do vetor
                var _dir = _indice < array_length(_menu[i][4]) -1 ? " >>" : "";
                
                var _cor = c_white;
                //Se eu estou nessa opção, então eu mudo de cor
                if(alterando && menus_sel[pag] == i) _cor  = c_red;
                draw_text_color(_larg / 2,(_alt / 2) - _alt_menu/2 + (i * _espaco_y),_esq +_txt +_dir,_cor,_cor,_cor,_cor, 1);
                
                break;
			}
        }
    }
    //Resetando os meus draw set 
    draw_set_font(-1);
    define_align(-1,-1);
}

controla_menu = function(_menu){
    //Pegando as Telcas
    var  _up,_down,_avanca,_recua,_left,_right;
    static _animar = false;
    _up = keyboard_check_pressed(vk_up);
    _down = keyboard_check_pressed(vk_down);
    
    _avanca = keyboard_check_pressed(vk_enter);
    _recua = keyboard_check_pressed(vk_escape);
    var _sel = menus_sel[pag];
    _right = keyboard_check_pressed(vk_right);
    _left = keyboard_check_pressed(vk_left);

    //Checando se eu Não estou alterando as opções do jogo
    if(!alterando){
        if(_up || _down){
            //Mudando o valor do sel
            menus_sel[pag] += _down - _up;
        
            //Limitando o valor ddo sel
            var _tam = array_length(_menu) - 1;
            menus_sel[pag] = clamp(menus_sel[pag],0, _tam);
        
            // Avisando que pode animar
            _animar = true;
        
        }
    } else {
        //Ou seja, eu estou alterando as opções
        _animar = false;
        //se eu apertar para esquerda ou para direita
        if(_right || _left){
            //achando meu limite
            var _limite = array_length(_menu[_sel][4]) -1 ;
            //Mundando meu indice
            menus[pag][_sel][3] += _right - _left;
            //garantindo que eu nao vou sair do limite
            menus[pag][_sel][3] = clamp(menus[pag][_sel][3],0,_limite);
        }
    }
    
    // o que fazer quando apertar o enter
    if (_avanca)
    {
        switch(_menu[_sel][1])
        {
            //caso seja 0, ele roda um método
            case menu_acoe.roda_metodo:
            _menu[_sel][2]();
            break;
            //mudar o valor da pagina
            case menu_acoe.carrega_menu:
            pag = _menu[_sel][2];
            break;
            case menu_acoe.ajustes_menu:
                alterando = !alterando;
                //Rodando o metodo
                if(!alterando)
                {
                    //saçvandoo o argumento do menu
                    var _arg = _menu[_sel][3];
                    _menu[_sel][2](_arg);
                }
                break;
			case menu_acoe.ajustes_saves:
				alterando = !alterando;
                //Rodando o metodo
                if(!alterando)
                {
                    //saçvandoo o argumento do menu
                    var _arg = _menu[_sel][3];
                    _menu[_sel][2](_arg);
                }
                break;
        }
    }
    
    //Aumentando sempre o marg_val (^^ )so retorna true se apetei um dos dois ou se apertei os dois
    if(_animar){
        marg_val = marg_total * valor_ac(ac_margem,_up ^^ _down,0);
    }
}
#endregion

inicia_jogo = function() {
    alarm[0] = 5;
}

fecha_jogo = function() {
    game_end();
}

function listar_saves() {
    var save_list = [];
    var file_name = file_find_first("*.sav", 0); // Encontra o primeiro arquivo .sav

    while (file_name != "") {
        var file_id = file_text_open_read(file_name); // Abre o arquivo para leitura

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
            
            // Fecha o arquivo após a leitura
            file_text_close(file_id);
        } else {
            show_debug_message("Erro ao abrir o arquivo " + file_name);
        }

        file_name = file_find_next(); // Procura o próximo arquivo .sav
    }

    file_find_close(); // Fecha a busca de arquivos
    return save_list;
}

carregar_jogo = function(filename) {
    if (file_exists(filename)) {
        ini_open(filename);
        obj_player.x = ini_read_real("jogador", "x_atual", 0);
        obj_player.y = ini_read_real("jogador", "y_atual", 0);
        obj_player.vida = ini_read_real("jogador", "vida_atual", 0);
        room_goto(ini_read_real("jogador", "sala_atual", 0));
        ini_close();
    }
}

file_name_parse = function(file_path) {
    var name_start = string_last_index_of(file_path, "/") + 1;
    var name_end = string_length(file_path) - string_length(file_ext(file_path)) - 1;
    return string_copy(file_path, name_start, name_end - name_start + 1);
}

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

function teste(_valor) {
    var selected_save = saves[_valor]; // Obtém o nome do arquivo de save selecionado
    // Aqui você deve adicionar o código para carregar e aplicar o save
    // Por exemplo:
    global.current_save = load_save(selected_save);
}

// quando eu apertar enter no iniciar, ele vai rodar um método
// Quando eu apertar enter no opções, ele vai carregar o menu de opções
// quando eu apertar enter no sair, ele vai rodar o método fechar o jogo

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
    var _menu = [
        ["Iniciar", menu_acoe.roda_metodo, inicia_jogo]
    ];
    
    var save_files = listar_saves();
    if (array_length(save_files) > 0) {
        array_push(_menu, ["Carregar", menu_acoe.carrega_menu, menus_lista.carregar]);
    }
    
    array_push(_menu, ["Opções", menu_acoe.carrega_menu, menus_lista.opcoes]);
    array_push(_menu, ["Sair", menu_acoe.roda_metodo, fecha_jogo]);
    
    return _menu;
};

// Inicializar a lista de saves
var saves = listar_saves();

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
    ["Saves", menu_acoe.ajustes_saves, teste, 0, saves],
    ["Voltar", menu_acoe.carrega_menu, menus_lista.principal]
];

// Salvando todos os meus menus
menus = [menu_principal, menu_opcoes, menu_carregar, menu_tela, menu_dificuldade, menu_pause];

// Salvando a seleção de cada menu
menus_sel = array_create(array_length(menus), 0);
alterando = false;

show_message(saves);
