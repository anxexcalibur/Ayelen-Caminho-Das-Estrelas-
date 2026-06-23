/// @description Controla animação de fade e transição de salas
var _nome_jogador;

if instance_exists(obj_catcine){
	obj_catcine.pode_desenhar = false;
}

if direcao{
	img += img_vel;

	if(img - img_num > cols+1)
	{
		if room == rm_catcine {
			direcao = false;
			_nome_jogador = global.player_name;
			global.player_name = "";
			
			// Destroi player persistente antes de carregar
			if (instance_exists(obj_player)) {
				instance_destroy(obj_player);
			}
			
			carrega_jogo_3(
				_nome_jogador, 
				undefined, 
				undefined, 
				undefined, 
				undefined, 
				false
			);
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false;
			}
			
		} else if room == rm_catcine_2 {
			direcao = false;
			
			// ========== CARREGAR SAVE DA CUTSCENE 2 NA POSIÇÃO (1270, 311) ==========
			_nome_jogador = global.player_name;
			
			// Verifica se tem um save para o jogador
			ini_open("save.sav");
			var save_existe = ini_section_exists(_nome_jogador);
			ini_close();
			
			if (save_existe && _nome_jogador != "" && _nome_jogador != undefined) {
				// Destroi player persistente antes de carregar
				if (instance_exists(obj_player)) {
					instance_destroy(obj_player);
				}
				
				// Carrega o jogo com as coordenadas específicas (1270, 311)
			carrega_jogo_3(
        _nome_jogador,           // 1: nome
        rm_prototipo,            // 2: sala
        4,                       // 3: etapa
        1270,                    // 4: posição X
        311,                     // 5: posição Y
        false                    // 6: direção da transição
    );
				show_debug_message("✅ Cutscene 2: Save carregado para: " + _nome_jogador + " na posição (1270, 311)");
			} else {
				// Se não tem save, vai para o protótipo na posição especificada
				show_debug_message("⚠ Cutscene 2: Save não encontrado para " + string(_nome_jogador) + ", criando novo jogador");
				
				// Cria o jogador se não existir
				if (!instance_exists(obj_player)) {
					instance_create_layer(1270, 311, "Instances", obj_player);
				} else {
					obj_player.x = 1270;
					obj_player.y = 311;
				}
				
				// Vai para a sala destino
				if (room_exists(destino)) {
					room_goto(destino);
				} else {
					room_goto(rm_prototipo);
				}
			}
			
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = false;
			}
			
		} else {
			if(room_exists(destino)){
				room_goto(destino);
				
				if (instance_exists(obj_player) && room != rm_cabana) {
					obj_player.x = destino_x;
					obj_player.y = destino_y;
				}
			}
			direcao = false;
		}
	}
	
} else {
	// Saindo da animação (fade abrindo)
	img -= img_vel;
	
	if img < -5 {
		if (room == rm_catcine || room == rm_catcine_2) {
			if instance_exists(obj_catcine){
				obj_catcine.pode_desenhar = true;
			}
		}
		instance_destroy();
	} 
}