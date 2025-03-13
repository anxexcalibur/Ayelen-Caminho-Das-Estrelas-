// Verifica se o jogador está tocando o objeto
if (place_meeting(x, y, obj_player)) {
    var _ativou = keyboard_check(ord("F"));
    
    // Verifica o estado do NPC e a etapa do jogador
    if (obj_player.etapa_historia == 3 && _ativou) {
		
        // Altera o estado do player para "cha" e cria as partículas
        obj_player.estado = "cha";
        part_particles_create(p_sys, x, y, p_type, 200);  
        
        // Altera a etapa do jogador e marca o ritual como feito
		
          // Avança para a próxima etapa
		screenshake(10);
		alarm[0] = 120;
    }
}
