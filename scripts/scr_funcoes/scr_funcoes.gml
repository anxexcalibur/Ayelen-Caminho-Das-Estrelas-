// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

}
// Coloque isso dentro de um Script limpo (não em um objeto)

/// @function scr_addItem(array, item_id)
/// @description Adiciona um item a um array se ele ainda não existir.
/// @param {Array} array O array para modificar.
/// @param {Any} item_id O id do item para adicionar.
/// @return {Array} O array modificado.

function scr_addItem(_array, _id_item) {

    // 1. Garante que o ID a ser adicionado seja uma string para consistência
    var id_str = string(_id_item);

    // 2. Verifica se o item JÁ EXISTE no array
    // A função array_contains() retorna 'true' se encontrar, e 'false' se não.
    // O '!' na frente inverte o resultado (NOT), então o código executa se o item NÃO for encontrado.
    if (!array_contains(_array, id_str)) {
        
        // 3. Se não existe, adiciona o item ao final do array
        array_push(_array, id_str);
        show_message("Item " + id_str + " adicionado com sucesso!");
    } else {
        // Opcional: uma mensagem para saber que o item já existia
        show_message("O item " + id_str + " já está no array.");
    }
    
    // 4. (Opcional) Mostra todos os itens atuais do array para debug
    // Usamos string_join para juntar todos os elementos do array em uma única string, separados por ", "
    show_message("Itens atuais: " + string_join(", ", _array));

    // 5. Retorna o array atualizado
    return _array;
}


/// @function scr_checkRoom(collected_items_array)
/// @description Verifica todos os itens na sala (baseados em obj_item_pai)
///              e destrói aqueles cujo ID já está no array de itens coletados.
/// @param {Array} collected_items_array   O array que armazena os IDs dos itens que o jogador já coletou.

function scr_checkRoom(_collected_items_array) {

    // A instrução 'with' é a forma mais eficiente de aplicar uma lógica
    // a todas as instâncias de um objeto (e seus filhos) na sala.
    with (obj_item_pai) {
    
        // 1. VERIFICAÇÃO DE SEGURANÇA:
        // Checa se a variável 'id_item' existe nesta instância antes de tentar lê-la.
        // Isso previne erros caso você, acidentalmente, coloque um objeto na sala
        // que não tenha essa variável configurada.
        if (variable_instance_exists(id, "id_item")) {
        
            // 2. CONVERSÃO PARA STRING:
            // Garante que o ID do item seja uma string. Isso é crucial para que
            // a comparação com os dados do array (que também são strings) funcione 100% das vezes.
            var _current_item_id = string(id_item);
            
            // 3. A LÓGICA PRINCIPAL:
            // A função array_contains() retorna 'true' se o ID do item atual
            // for encontrado dentro do array de itens já coletados.
            if (array_contains(_collected_items_array, _current_item_id)) {
            
                // 4. DESTRUIR A INSTÂNCIA:
                // Se o ID foi encontrado, o item já foi coletado anteriormente.
                // O comando instance_destroy() remove o objeto da sala.
                instance_destroy();
            }
        }
    }
}
/// @function draw_health_bar(x_pos, y_pos, vida_atual, max_vida, largura=40, altura=6)
function draw_health_bar(x_pos, y_pos, vida_atual, max_vida, largura=40, altura=6) {
    var bar_width = largura;
    var bar_height = altura;
    var bar_x = x_pos - bar_width / 2;
    var bar_y = y_pos;

    var vida_percent = clamp(vida_atual / max_vida, 0, 1);

    // Barra de fundo (preta)
    draw_set_color(c_black);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

    // Barra de vida (verde)
    draw_set_color(c_lime);
    draw_rectangle(bar_x + 1, bar_y + 1, bar_x + 1 + (bar_width - 2) * vida_percent, bar_y + bar_height - 1, false);

    // Contorno (branco)
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

    // Texto dentro da barra, texto preto
    var texto = string(vida_atual) + " / " + string(max_vida);
    var texto_x = x_pos;
    var texto_y = bar_y + bar_height / 2 + 1;


    draw_set_color(c_black);
    // Use sua fonte pequena, se tiver, troque "fnt_pequena" pelo nome da sua fonte
    // Se não tiver, pode comentar essa linha e usar fonte padrão
     draw_set_font(fnt_pequena);

    draw_set_halign(1); // centro horizontal
    draw_set_valign(1); // meio vertical
    draw_text(texto_x, texto_y, texto);

    // Resetando alinhamento para padrão
    draw_set_halign(-1); // left
    draw_set_valign(-1); // bottom
    draw_set_color(-1);
     draw_set_font(-1);
}



function animation_end() {
    return image_index >= image_number - 1;
}
/// @function scr_colisao_movimento()
/// @description Executa a lógica de colisão e movimento para uma instância.
///              A instância que chama este script DEVE ter as variáveis velh e velv.
function carregar_checkpoint(_value) {
    var jogador = _value;

    if (!instance_exists(obj_player)) {
        instance_create_layer(0, 0, "Instances", obj_player);
    }

    if (file_exists("save.sav")) {
        ini_open("save.sav");
        obj_player.x = ini_read_real(jogador, "x_atual", 0);
        obj_player.y = ini_read_real(jogador, "y_atual", 0);
        var _vida_atual = ini_read_real(jogador, "vida_atual", 0);
        obj_player.vida_atual = (_vida_atual <= 0) ? 2 : _vida_atual;
        global.estrelas_coletadas = ini_read_real(jogador, "estrelas_coletadas", 0);
		
        var sala_atual = ini_read_real(jogador, "sala_atual", room);
        ini_close();
        room_goto(sala_atual);
    } else {
        show_message("Arquivo de save não encontrado!");
    }
}
function scr_drop_item(x_origem, y_origem, item_objeto) {

    // Cria a instância do item
    var _item = instance_create_layer(x_origem, y_origem, "Instances", item_objeto);
    
    // Com a instância criada, podemos definir algumas variáveis iniciais nela
    with (_item) {
        
        // 1. EFEITO DE "PULO":
        // Dá um impulso para cima (vspd negativo)
        vspd = -4; 
        
        // Dá um impulso horizontal aleatório para a esquerda ou para a direita
        hspd = random_range(-2, 2);
        
        // 2. EFEITO VISUAL INICIAL:
        // Começa um pouco maior que o normal
        image_xscale = 1.2; // Reduzido de 1.5
        image_yscale = 1.2; // Reduzido de 1.5
        
        // Começa semi-transparente
        image_alpha = 1;
        
        // Uma variável para controlar o estado, garantindo que a animação só aconteça uma vez
        estado_drop = "animando";
    }
}
function scr_colisao_movimento() {

    // --- COLISÃO HORIZONTAL ---
    // Usamos instance_place para pegar a ID da parede/porta que vamos atingir.
    var _parede_h = instance_place(x + velh, y, obj_parede_solida_pai);

    if (_parede_h != noone) {
        // PONTO-CHAVE: Verificamos se a parede que encontramos é uma porta e se ela está aberta.
        var _eh_porta_aberta = (_parede_h.object_index == obj_porta && _parede_h.ativou == true);

        // Se NÃO for uma porta aberta (ou seja, é uma parede comum OU uma porta fechada)...
        if (!_eh_porta_aberta) {
            // ...então executamos a colisão pixel-a-pixel.
            // Usamos obj_parede_solida aqui para garantir que paramos em qualquer parede, não apenas na que encontramos primeiro.
            while (!instance_place(x + sign(velh), y,  obj_parede_solida_pai)) {
                x += sign(velh);
            }
            velh = 0; // Paramos o movimento horizontal.
        }
    }
    // Aplica o movimento horizontal final (que será 0 se colidiu).
    x += velh;


    // --- COLISÃO VERTICAL ---
    // Usamos instance_place novamente para a colisão vertical.
    var _parede_v = instance_place(x, y + velv, obj_parede_solida_pai);

    if (_parede_v != noone) {
        // A mesma lógica da porta aberta se aplica aqui.
        var _eh_porta_aberta = (_parede_v.object_index == obj_porta && _parede_v.ativou == true);
        
        // Se NÃO for uma porta aberta...
        if (!_eh_porta_aberta) {
            // ...colidimos.
            while (!instance_place(x, y + sign(velv), obj_parede_solida_pai)) {
                y += sign(velv);
            }
            
            // Se a instância que chama o script tem uma máquina de estados...
            // e estava no estado "pulando", mudamos para "parado".
            if (variable_instance_exists(id, "estado") && estado == "pulando" && velv > 0) {
                estado = "parado"; 
            }
            velv = 0; // Paramos o movimento vertical.
        }
    }
    // Aplica o movimento vertical final.
    y += velv;
    
}
// plataforma movel
/// No obj_player - Script ou no próprio objeto
function move_platform_x(dx) {
    // Primeiro tenta mover a plataforma
    if (place_meeting(x + dx, y, obj_block)) {
        dir *= -1; // inverte direção se colidir com parede
        return;
    }

    // Verifica se tem player colidindo ao lado (posição após movimento)
    var p = instance_place(x + dx, y, obj_player);
    if (p != noone) {
        // Se player não está em cima da plataforma (y menor)
        if (p.y < y) {
            dir *= -1; // inverte direção
            return;
        }
    }

    // Move plataforma normalmente
    x += dx;

    // Se player estiver em cima (y >= y da plataforma), move player junto
    var player_em_cima = instance_place(x, y - 1, obj_player);
    if (player_em_cima != noone) {
        player_em_cima.x += dx;
    }
}

function player_follow_platform(inst_platform, velh) {
    // Verifica se o player está na plataforma
    var player_inst = instance_place(inst_platform.x, inst_platform.y, obj_player);

    if (player_inst != noone) {
        // Calcula nova posição do player junto com a plataforma
        var new_x = player_inst.x + velh;

        // Move o player junto só se não colidir com blocos
        if (!place_meeting(new_x, player_inst.y, obj_block)) {
            player_inst.x = new_x;
            return true; // player foi movido com sucesso
        } else {
            return false; // não pode mover o player
        }
    }
    return true; // sem player, sem problema
}


// Função para gerenciar a música de fundo
function gerenciar_musica(nome_musica) {
    audio_pause_all();  // Pausa qualquer música tocando

    // Para as músicas atuais, se estiverem tocando
    if (audio_is_playing(snd_background)) {
        audio_stop_sound(snd_background);  // Para a música de protótipo
    }
    if (audio_is_playing(snd_background_catcines)) {
        audio_stop_sound(snd_background_catcines);  // Para a música de catcine
    }

    // Verifica qual música deve ser tocada com base no parâmetro
    switch (nome_musica) {
        case "prototipo":
            if (global.current_music != "prototipo") {
                audio_play_sound(snd_background, 1, true);  // Toca a música de protótipo em loop
                global.current_music = "prototipo";  // Atualiza a música atual
            }
            break;

        case "catcine":
            if (global.current_music != "catcine") {
                audio_play_sound(snd_background_catcines, 1, true);  // Toca a música de catcine em loop
                global.current_music = "catcine";  // Atualiza a música atual
            }
            break;
		 case "main theme":
           if (global.current_music != "main theme") {
                audio_play_sound(snd_maintheme, 1, true);  // Toca a música de protótipo em loop
                global.current_music = "main theme";  // Atualiza a música atual
            }
            break;

        case "none":
            global.current_music = "none";  // Nenhuma música tocando
            break;
		

        default:
            global.current_music = "none";  // Caso não haja música correspondente
    }
}

/// @function salvar_jogador(obj)
/// @desc Salva os dados do jogador no arquivo save.sav
/// @param obj - O objeto jogador cujos dados serão salvos

/***function salvar_progresso() {
    var buffer = buffer_create(1024, buffer_fixed, 1);
    
    // Salva número total de estrelas coletadas
    buffer_write(buffer, buffer_u32, global.estrelas_coletadas);
    
    // Salva progresso das constelações (quantas estrelas coletadas em cada)
    for (var i = 0; i < array_length(global.constelacoes); i++) {
        buffer_write(buffer, buffer_u32, global.constelacoes[i].coletadas);
    }
    
    buffer_save(buffer, "savefile.dat");
    buffer_delete(buffer);
}

function carregar_progresso() {
    if (file_exists("savefile.dat")) {
        var buffer = buffer_load("savefile.dat");
        
        global.estrelas_coletadas = buffer_read(buffer, buffer_u32);
        
        for (var i = 0; i < array_length(global.constelacoes); i++) {
            global.constelacoes[i].coletadas = buffer_read(buffer, buffer_u32);
        }
        
        buffer_delete(buffer);
    } else {
        global.estrelas_coletadas = 0;
        for (var i = 0; i < array_length(global.constelacoes); i++) {
            global.constelacoes[i].coletadas = 0;
        }
    }
}***/

function salvar_checkpoint(_secao_save) {
    
    if (!instance_exists(obj_player)) {
        show_debug_message("⚠ ERRO ao salvar: salvar_checkpoint foi chamado, mas obj_player não existe!");
        return;
    }

    ini_open("save.sav");

    var _x = obj_player.x;
    var _y = obj_player.y - 50;
    var _vida = obj_player.vida_atual;
    var _etapa = obj_player.etapa_historia;
    var _tiros = obj_player.qtd_tiros;
    
    ini_write_real(_secao_save, "x_atual", _x);
    ini_write_real(_secao_save, "y_atual", _y);
    ini_write_real(_secao_save, "vida_atual", _vida);
    ini_write_real(_secao_save, "sala_atual", room);
    ini_write_real(_secao_save, "etapa_historia", _etapa);
    ini_write_real(_secao_save, "qtd_tiros", _tiros);

    ini_write_real(_secao_save, "pontuacao", global.pontuacao);
    ini_write_real(_secao_save, "estrelas_coletadas", global.estrelas_coletadas);

    // CORRIGIDO: nome da função + nome da global
    if (variable_global_exists("itens_coletados")) {
        var _inventory_json = json_stringify(global.itens_coletados);
        ini_write_string(_secao_save, "inventario", _inventory_json);
    } else {
        ini_write_string(_secao_save, "inventario", "[]"); 
    }
    
    ini_close();
    
    show_debug_message("CHECKPOINT: Jogo salvo na seção [" + _secao_save + "]");
}

/// @function salvar_progresso_cutscene_2()
/// @desc Salva o progresso específico da cutscene 2 mantendo pontuação e avançando para etapa 4
function salvar_progresso_cutscene_2() {
    ini_open("save.sav");
    
    // Pega os valores atuais (se existirem)
    var pontuacao_atual = 0;
    var estrelas_atual = 0;
    var vida_atual = 10;
    var tiros_atual = 4;
    var inventario_atual = "[]";
    
    // Tenta carregar dados existentes primeiro
    if (ini_section_exists(global.player_name)) {
        pontuacao_atual = ini_read_real(global.player_name, "pontuacao", 0);
        estrelas_atual = ini_read_real(global.player_name, "estrelas_coletadas", 0);
        vida_atual = ini_read_real(global.player_name, "vida_atual", 10);
        tiros_atual = ini_read_real(global.player_name, "qtd_tiros", 4);
        inventario_atual = ini_read_string(global.player_name, "inventario", "[]");
    }
    
    // Se o player existir na cena, usa os valores dele
    if (instance_exists(obj_player)) {
        pontuacao_atual = global.pontuacao;
        estrelas_atual = global.estrelas_coletadas;
        vida_atual = obj_player.vida_atual;
        tiros_atual = obj_player.qtd_tiros;
        
        if (variable_global_exists("itens_coletados")) {
            inventario_atual = json_stringify(global.itens_coletados);
        }
    }
    
    // Salva os dados atualizados
    ini_write_real(global.player_name, "x_atual", 128.923584);
    ini_write_real(global.player_name, "y_atual", 328.504913);
    ini_write_real(global.player_name, "vida_atual", vida_atual);
    ini_write_real(global.player_name, "sala_atual", rm_prototipo);
    ini_write_real(global.player_name, "etapa_historia", 4.000000); // Avança para etapa 4
    ini_write_real(global.player_name, "pontuacao", pontuacao_atual);
    ini_write_real(global.player_name, "estrelas_coletadas", estrelas_atual);
    ini_write_real(global.player_name, "qtd_tiros", tiros_atual);
    ini_write_string(global.player_name, "inventario", inventario_atual);
    
    ini_close();
    
    show_debug_message("=========================================");
    show_debug_message("✅ Cutscene 2 finalizada!");
    show_debug_message("   Jogador: " + global.player_name);
    show_debug_message("   Etapa: 4");
    show_debug_message("   Pontuação mantida: " + string(pontuacao_atual));
    show_debug_message("   Estrelas mantidas: " + string(estrelas_atual));
    show_debug_message("   Vida mantida: " + string(vida_atual));
    show_debug_message("   Tiros mantidos: " + string(tiros_atual));
    show_debug_message("=========================================");
}

/// @function carregar_com_nome_jogador(nome_jogador)
/// @desc Carrega o save específico do jogador pelo nome
/// @param {string} nome_jogador - Nome do jogador para carregar
function carregar_com_nome_jogador(nome_jogador) {
    if (!file_exists("save.sav")) {
        show_debug_message("❌ Arquivo save.sav não encontrado!");
        return false;
    }
    
    ini_open("save.sav");
    
    // Verifica se a seção do jogador existe
    if (!ini_section_exists(nome_jogador)) {
        show_debug_message("❌ Seção " + nome_jogador + " não encontrada!");
        ini_close();
        return false;
    }
    
    // Garante que o player existe
    if (!instance_exists(obj_player)) {
        instance_create_layer(0, 0, "Instances", obj_player);
    }
    
    // Carrega TODOS os dados do jogador
    obj_player.x = ini_read_real(nome_jogador, "x_atual", 128);
    obj_player.y = ini_read_real(nome_jogador, "y_atual", 328);
    obj_player.vida_atual = ini_read_real(nome_jogador, "vida_atual", 10);
    obj_player.etapa_historia = ini_read_real(nome_jogador, "etapa_historia", 0);
    obj_player.qtd_tiros = ini_read_real(nome_jogador, "qtd_tiros", 4);
    
    // Carrega dados globais
    global.pontuacao = ini_read_real(nome_jogador, "pontuacao", 0);
    global.estrelas_coletadas = ini_read_real(nome_jogador, "estrelas_coletadas", 0);
    
    // Carrega inventário
    var inventory_json = ini_read_string(nome_jogador, "inventario", "[]");
    if (string_length(inventory_json) > 2) { // Verifica se não está vazio
        global.itens_coletados = json_parse(inventory_json);
    } else {
        global.itens_coletados = [];
    }
    
    // Carrega a sala de destino
    var sala_destino = ini_read_real(nome_jogador, "sala_atual", rm_prototipo);
    
    ini_close();
    
    // Vai para a sala
    room_goto(sala_destino);
    
    show_debug_message("=========================================");
    show_debug_message("✅ Jogo carregado para: " + nome_jogador);
    show_debug_message("   Etapa: " + string(obj_player.etapa_historia));
    show_debug_message("   Pontuação: " + string(global.pontuacao));
    show_debug_message("   Estrelas: " + string(global.estrelas_coletadas));
    show_debug_message("   Sala: " + string(sala_destino));
    show_debug_message("=========================================");
    
    return true;
}

global.dificuldade = 1;
//Enumerator para definir as minhas açoes possiveis no menu
enum menu_acoe
{
	roda_metodo,//0
	carrega_menu,//1
	ajustes_menu,//2
	ajustes_saves,//3
	ajustes_controle//4
}
enum menus_lista
{
	principal,
	opcoes,
	carregar,
	tela,
	dificuldade,
	controles
	
}
//Tremendo a tela
///@function screenshake(valor_da_tremida)
///@arg força_da_tremida
///@arg [dir_mode]
///@arg [direcao]
function screenshake(_treme,_dir_mode,_direcao){
	var tremer = instance_create_layer(0,0,"instances",obj_screenshake)
	tremer.shake = _treme;
	tremer.dir_mode = _dir_mode
	tremer.dir = _direcao
}
//enumerator para definir as minhas açoes possiveis
///@function denfine_align(_vertical,_horizontal)
function define_align(_hor, _ver) {
    draw_set_halign(_hor);
    draw_set_valign(_ver);
}
//enum menu_acoes{
//	roda_metodo,
//	carrega_menu
	
//}
//enum menus_lista
//{
//	opcoes,
//	opcoes_opcoes
//}
/// @function salvar_jogador(jogador)
/// @desc Salva todos os dados importantes do jogador
/// @param {id} jogador - O objeto jogador
function salvar_jogador(jogador) {
    if (!instance_exists(jogador)) {
        show_debug_message("⚠ ERRO: salvar_jogador - jogador não existe!");
        return;
    }
    
    // Usa o sistema de checkpoint existente
    salvar_checkpoint("jogador");
    
    // Salva dados adicionais específicos do jogador
    ini_open("save.sav");
    
    // Salva dados que podem não estar no salvar_checkpoint
    ini_write_real("jogador", "etapa_historia", jogador.etapa_historia);
    ini_write_real("jogador", "vida_atual", jogador.vida_atual);
    ini_write_real("jogador", "qtd_tiros", jogador.qtd_tiros);
    ini_write_real("jogador", "x_atual", jogador.x);
    ini_write_real("jogador", "y_atual", jogador.y);
    ini_write_real("jogador", "sala_atual", room);
    
    // Salva dados globais
    ini_write_real("jogador", "pontuacao", global.pontuacao);
    ini_write_real("jogador", "estrelas_coletadas", global.estrelas_coletadas);
    
    // Salva inventário se existir
    if (variable_global_exists("itens_coletados")) {
        var _inventory_json = json_stringify(global.itens_coletados);
        ini_write_string("jogador", "inventario", _inventory_json);
    }
    
    ini_close();
    
    show_debug_message("✅ Jogador salvo com sucesso!");
}

//Pegar o valor da animation curve
///@function valor_ac(animation_curve,canal, animar,[canal])
function valor_ac(_anim,_animar = false,_chan = 0)
{
	//posição da animação
	static _pos = 0, _val = 0;
	
	//Aumentando o valor do pos
	//Em 1 segundo o pos vai do 0 até 1 (final da animação
	
	_pos += delta_time / 1000000;
	
	if(_animar)_pos = 0;
	//Pegando o valor do canal
	var _canal = animcurve_get_channel(_anim,_chan);
	
	_val = animcurve_channel_evaluate(_canal,_pos);
	
	return _val;
}

function pontuar(valor = 3)
{
	global.pontuacao += valor 
}
//essa função mostr ao inicativo dse objetos interativos
function scr_exclamacao()
{
    // Se o jogador está perto do NPC
    if (distance_to_object(obj_player) < 32) 
    {
        // Se ainda não existe um ponto de interrogação para este NPC
        if (!instance_exists(interrogacao)) 
        {
            interrogacao = instance_create_layer(x, y, "instances", obj_interrogacao);
        }
    } 
    else 
    {
        // Se a interrogação desse NPC existir, destrói
        if (instance_exists(interrogacao)) 
        {
            with (interrogacao) instance_destroy();
            interrogacao = noone; // Zera a variável para evitar bugs
        }
    }
}