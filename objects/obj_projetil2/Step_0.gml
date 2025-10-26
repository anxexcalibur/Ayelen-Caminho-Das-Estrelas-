/// @description Movimento e colisões do projétil

// Movimento
x += velocidade * direcao;

// Orientação da sprite
image_xscale = direcao;

// --- Efeito visual (rastro de veneno, opcional) ---
// Usa apenas se part_sys e part_tipo_veneno existirem
if (variable_global_exists("part_sys") && variable_global_exists("part_tipo_veneno")) {
    part_particles_create(global.part_sys, x, y, global.part_tipo_veneno, 1);
}

// --- Colisão com o jogador ---
if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        // Exemplo de dano
        vida_atual -= 1;
    }
    instance_destroy();
}

// --- Colisão com paredes ---
if (place_meeting(x, y, obj_parede_solida_pai)) {
    instance_destroy();
}

// --- Fora da tela (limpeza de memória) ---
if (x < view_xview[0] - 50 || x > view_xview[0] + view_wview[0] + 50) {
    instance_destroy();
}
