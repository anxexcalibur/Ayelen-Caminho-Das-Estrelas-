/// @description Comportamento da piranha

event_inherited();

// Checa o jogador com segurança
var jogador_perto = false;
if (instance_exists(obj_player)) {
    jogador_perto = point_distance(x, y, obj_player.x, obj_player.y) < 300;
}

switch (estado) {
    case "parado":
        // Fica travada na água
        vspeed = 0;
        gravity = 0;
        image_yscale = 1;
        sprite_index = spr_piranha;
        
        // Só conta o tempo quando está realmente parada na água
        timer_estado++;
        
        // Se o chão (água) sumir do nada
        if (!place_meeting(x, y + 1, obj_agua_mortal)) {
            estado = "caindo";
            timer_estado = 0;
        }
        
        // O Pulo!
        if (jogador_perto && timer_estado >= tempo_proximo_pulo) {
            estado = "pulando";
            vspeed = -6; // Força do pulo
            gravity = 0.25;
            timer_estado = 0;
        }
        break;
        
    case "pulando":
        // Está subindo
        gravity = 0.25;
        image_yscale = 1;
        
        // Começou a cair
        if (vspeed >= 0) {
            estado = "caindo";
        }
        break;
        
    case "caindo":
        // Está descendo
        gravity = 0.25;
        image_yscale = -1;
        
        // Bateu na água
        if (place_meeting(x, y + vspeed, obj_agua_mortal) || place_meeting(x, y + 1, obj_agua_mortal)) {
            
            // Gruda perfeitamente na superfície da água
            while (!place_meeting(x, y + 1, obj_agua_mortal)) {
                y += 1;
            }
            
            // Trava e reseta tudo pro próximo pulo
            estado = "parado";
            vspeed = 0;
            gravity = 0;
            timer_estado = 0;
            tempo_proximo_pulo = 30 + irandom(40); 
        }
        break;
}