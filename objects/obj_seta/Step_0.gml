// Calcula a posição da seta
switch(obj_player.etapa_historia){
	case 1:
		if room = rm_prototipo{
			status = true
		
			global.alvo_x = obj_pai.x;
			global.alvo_y = obj_pai.y;
		}
	break;
	case 2:
		status = true
		if room = Casa_guarani_1{
			status = false	
		}else{
			global.alvo_x = obj_sensor.x;
			global.alvo_y = obj_sensor.y;
		}
		
	break;
	case 3:
		status = true
		if room == Casa_guarani_1{
			global.alvo_x = obj_fogueira1.x;
			global.alvo_y = obj_fogueira1.y;
		}else{
			global.alvo_x = obj_sensor.x;
			global.alvo_y = obj_sensor.y
		}
		
	break;
	case 4:
		status = true
		if room = rm_prototipo{
			global.alvo_x = obj_pai.x;
			global.alvo_y = obj_pai.y;
		}else{
			status = false;
		}
	break;
		
	case 5:
		status = true
		if room = rm_prototipo{
			global.alvo_x = obj_npc_artesao.x;
			global.alvo_y = obj_npc_artesao.y;
		}else{
			status = false;
		}
	break;
	case 6:
		status = false
		
	break;
}

seta_x = obj_player.x;
seta_y = obj_player.y - obj_player.sprite_height / 2; // Centraliza a seta sobre a cabeça do jogador

// Calcula as diferenças entre o jogador e o alvo
var dx = global.alvo_x - seta_x;
var dy = global.alvo_y - seta_y;

// Define a distância entre o jogador e o alvo
var distancia = sqrt(dx * dx + dy * dy);

// Define se a seta deve aparecer


mostrar_seta =  status;

// Variáveis para o efeito de fade
fade_timer += 1;
alpha_value = 0.5 + 0.5 * sin(fade_timer / 10.0); // Cria o efeito de fade com um padrão oscilatório

// Garante que seta_indice seja real
if (dx < 0) {
    seta_indice = real(1); // Índice real para seta quando está à esquerda
} else {
    seta_indice = real(2); // Índice real para seta quando está à direita
}

// Verifica se o jogador está próximo o suficiente e pressionando "para cima"

