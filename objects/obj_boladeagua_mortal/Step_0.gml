// Verifica se o jogador existe
if (instance_exists(obj_player)) {
    // Pega a direção entre o projétil e o jogador
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Movimenta o projétil na direção do jogador
    x += lengthdir_x(velocidade, dir);
    y += lengthdir_y(velocidade, dir);
}

// Nenhuma gravidade aplicada, então não precisa adicionar código de gravidade
// Emite algumas partículas (pequena quantidade)
part_particles_create(part_sistema, x, y, part_agua, 1);
