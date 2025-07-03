// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

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
    ini_write_real(global.nome_jogador, "estrelas_coletadas", global.estrelas_coletadas); // Adicionado para salvar as estrelas

    ini_close();
    
    // salvando o estado dos itens
    // Certifique-se de que as funções salvar_itens() e salvar_progresso()
    // estejam definidas em outro script do seu projeto.
    salvar_itens();
    

    
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
