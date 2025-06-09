// Verifica se o jogador está tocando o objeto
if (!ritual_ativado && place_meeting(x, y, obj_player)) {
    var _ativou = keyboard_check_pressed(ord("F")); // Usa keyboard_check_pressed para detectar só 1 vez

    if (obj_player.etapa_historia == 3 && _ativou) {
        
        // Marca como ativado
        ritual_ativado = true;

        // Altera o estado do player e cria partículas
       if (obj_player.estado != "cha") {
            obj_player.estado = "cha";
        }
        part_particles_create(p_sys, x, y, p_type, 200);

        // Avança a história e aciona efeitos
        screenshake(10);
        alarm[0] = 120;
    }
}
