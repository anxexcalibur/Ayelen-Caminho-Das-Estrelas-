
/// @description Inicializa o projétil de veneno

// Variáveis de Movimento
direcao = 1;    // Será definido pela cobra (1 para direita, -1 para esquerda)
velocidade = 8; // Velocidade do projétil

// --- Partículas de Veneno (Seu código) ---
part_sys = part_system_create();
part_tipo_veneno = part_type_create();
part_type_shape(part_tipo_veneno, pt_shape_cloud);
part_type_size(part_tipo_veneno, 0.2, 1, 0, 0);
part_type_color1(part_tipo_veneno, make_color_rgb(50, 200, 50));
part_type_alpha2(part_tipo_veneno, 0.8, 0);
part_type_speed(part_tipo_veneno, 0.2, 0.5, 0, 0);
part_type_direction(part_tipo_veneno, 0, 360, 0, 10);
part_type_life(part_tipo_veneno, 30, 60);
part_type_gravity(part_tipo_veneno, 0.01, 270);