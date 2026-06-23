 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No Evento Step do obj_controller
if (player == noone) {
    player = instance_find(obj_player, 0);
}

if instance_exists(obj_porta){
	desenha_porta = obj_porta.mostrar_mensagem
}

scr_checkRoom(global.items_coletados);

// ═══ DETECÇÃO DE TROCA DE SALA - NOME DA FASE ═══
if (!variable_instance_exists(id, "sala_anterior")) {
	sala_anterior = room;
	mostrou_nome_fase = false;
}

if (!variable_instance_exists(id, "mostrou_nome_fase")) {
	mostrou_nome_fase = false;
}

if (room != sala_anterior) {
	sala_anterior = room;
	mostrou_nome_fase = false;
}

if (!mostrou_nome_fase && instance_exists(obj_message)) {
	if (!variable_global_exists("nomes_fases")) {
		global.nomes_fases = ds_map_create();
		ds_map_add(global.nomes_fases, rm_prototipo, "Mundo Comum");
		ds_map_add(global.nomes_fases, rm_prototipo_level2, "Travessia de Limiar");
		ds_map_add(global.nomes_fases, rm_prototipo_level3, "Aproximação da Caverna Oculta");
		ds_map_add(global.nomes_fases, rm_prototipo_bossroom, "Caverna Oculta");
	}

	if (ds_map_exists(global.nomes_fases, room)) {
		var _nome = ds_map_find_value(global.nomes_fases, room);
		obj_message.text1 = _nome;
		obj_message.alpha = 0;
		obj_message.mostra_message = true;
		obj_message.tempo_decorrido = 0;
		obj_message.tempo_espera = 20;
		obj_message.tempo_final = 60;
		mostrou_nome_fase = true;
	}
}
