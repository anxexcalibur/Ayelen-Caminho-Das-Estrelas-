// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

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

function salvar_progresso() {
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
}


function salvar_itens() {
    ini_open("_itens.sav");  // Arquivo de save de itens

    var keys = ds_map_keys_to_array(global.itens_coletados);
    var tamanho = array_length(keys);

    for (var i = 0; i < tamanho; i++) {
        var key = keys[i];
        ini_write_real("coletados", key, 1);  // Marca no arquivo como coletado
    }

    ini_close();
}


function salvar_jogador(_obj) {
    ini_open("save.sav");
    ini_write_real(global.nome_jogador, "x_atual", _obj.x);
    ini_write_real(global.nome_jogador, "y_atual", _obj.y - 50);
    ini_write_real(global.nome_jogador, "vida_atual", _obj.vida_atual);
    ini_write_real(global.nome_jogador, "sala_atual", room);
    ini_write_real(global.nome_jogador, "etapa_historia", _obj.etapa_historia);
	ini_write_real(global.nome_jogador, "pontuacao", global.pontuacao);
	
    ini_close();
	

	// salvando o estado dos itens
	salvar_itens();
	salvar_progresso()

    /*var nome_jogador = global.nome_jogador;
    var filename = nome_jogador + "_itens.ini";
    var file = file_text_open_write(filename);
    
    // Escreve a seção com o nome do jogador
    file_text_write_string(file, "[" + nome_jogador + "]\n");
    
    // Obtém as chaves e escreve os pares chave=valor
    var keys = ds_map_keys_to_array(global.itens_coletados);
    var tamanho = array_length(keys);

    for (var i = 0; i < tamanho; i++) {
        var key = keys[i];
        var value = global.itens_coletados[? key];
        file_text_write_string(file, key + "=\"" + string(value) + "\"\n");
    }
    
   file_text_close(file);*/
   

	
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
