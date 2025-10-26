/// @description Comportamento da piranha inimiga
// Inherit the parent event

event_inherited();
var _toggle_bateu = true
// Definição de variáveis principais
var chao = place_meeting(x, y + 1, obj_agua_mortal);
var jogador_proximo = (point_distance(x, y, obj_player.x, obj_player.y) < 100);
var altura_maxima = y - 50; // Define até onde a piranha pode subir
var velocidade_salto = -6; // Reduzida para tornar o salto mais lento
var velocidade_queda = 3; // Reduzida para tornar a descida mais lenta
var tempo_espera = 90; // Tempo de espera entre pulos

if (!chao) {
    velv += GRAVIDADE * massa;
} else {
    velv = 0; // Impede deslizamento na água
}

switch (estado) {
    case "parado": {
        timer_estado++;
        
        // Alternando entre os frames do sprite de animação
		if(!_toggle_bateu){
			sprite_index = spr_piranha;
			image_speed = 0.1;
			image_yscale = 1; // Garante que a piranha esteja na orientação normal
		}else{
			sprite_index = spr_piranha_splash;
			image_speed = 0.1;
			image_yscale = 1;
			if (image_index >= image_number - 1){
				_toggle_bateu = false
			}
		}
        // Se o jogador estiver perto, mudar para "pulando"
        if (jogador_proximo && timer_estado > tempo_espera) {
            estado = "pulando";
            velv = velocidade_salto;
            timer_estado = 0;
        }
        
        // Definir pulos regulares com tempo controlado
        if (timer_estado > tempo_espera * 2) {
            estado = "pulando";
            velv = velocidade_salto;
            timer_estado = 0;
        }
		 if (place_meeting(x, y + 1, obj_wall_slide) && velv > 0) {
             sprite_index = spr_piranha;
        }
        break;
    }
	  
		
    break;
    case "pulando": {
        y += velv;
        
        // --- LÓGICA PARA INVERTER A SPRITE ---
        // Se a velocidade vertical for negativa (subindo), a escala é normal.
        if (velv < 0) {
            image_yscale = 1;
        } 
        // Se a velocidade vertical for positiva (caindo), inverte a sprite.
        else if (velv > 0) {
            image_yscale = -1;
        }
        // ------------------------------------

        // Quando atinge o ponto mais alto, começa a descer
        if (y <= altura_maxima) {
            velv = velocidade_queda;
        }
        
        // Retorna ao estado parado ao tocar a água novamente
        if (place_meeting(x, y + 1, obj_wall_slide) && velv > 0) {
			_toggle_bateu = true;
            estado = "parado";
            velv = 0;
            timer_estado = 0;
        }
        break;
    }
}