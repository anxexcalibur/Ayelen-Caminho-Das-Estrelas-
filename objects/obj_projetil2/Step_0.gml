/// @description Movimento e colisão do projétil

// Inicializa a direção se ainda não foi definida
if (direcao == undefined) direcao = 1;

// Define a velocidade do projétil (ajustável)
var vel_proj = 2 * direcao;

// Movimento horizontal
speed += vel_proj;

// Destrói se sair da tela ou colidir
if (x < view_xview[0] - 100 || x > view_xview[0] + view_wview[0] + 100) {
    instance_destroy();
}

// Colisão com o jogador (se for um projétil inimigo)
if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        vida_atual -= 1; // Ou qualquer efeito de dano
    }
    instance_destroy();
}

// Colisão com o cenário (parede, bloco, etc)
if (place_meeting(x, y, obj_block)) {
    instance_destroy();
}
