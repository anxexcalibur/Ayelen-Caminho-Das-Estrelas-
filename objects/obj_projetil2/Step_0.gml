x += velocidade * direcao;

// Define a orientação da sprite para a direção do movimento
image_xscale = direcao;

// --- 2. Efeito Visual ---
// Cria um rastro de partículas de veneno
part_particles_create(part_sys, x, y, part_tipo_veneno, 1);

// --- 3. Colisão e Destruição ---

// Colisão com o jogador
if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        // Aplica o dano ou efeito de veneno
        // Exemplo: vida_atual -= 1;
    }
    instance_destroy(); // Destrói o projétil
}

// Colisão com paredes ou chão
if (place_meeting(x, y, obj_parede_solida_pai)) { // Usar um objeto pai é mais eficiente
    instance_destroy(); // Destrói o projétil
}

// Destrói se sair da tela (para economizar memória)
if (x < view_xview[0] - 50 || x > view_xview[0] + view_wview[0] + 50) {
    instance_destroy();
}