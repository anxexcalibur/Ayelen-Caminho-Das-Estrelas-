/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inicialização do projétil

// Define a direção padrão (caso a cobra não defina)
direcao = 1;

// Define a velocidade base (ajustável)
vel_proj = 6;


/// Criação do sistema de partículas
part_sys = part_system_create();

// Criação do tipo de partículas
part_tipo_veneno = part_type_create();

// Configurações básicas da partícula
part_type_shape(part_tipo_veneno, pt_shape_cloud);  // Forma de nuvem para simular veneno
part_type_size(part_tipo_veneno, 0.2, 1, 0, 0);     // Tamanhos variados
part_type_color1(part_tipo_veneno, make_color_rgb(50, 200, 50));  // Cor verde (veneno)
part_type_alpha2(part_tipo_veneno, 0.2, 0);  // Inicia quase opaco e desaparece

// Movimento das partículas (suave e leve dispersão)
part_type_speed(part_tipo_veneno, 0.2, 0.5, 0, 0);
part_type_direction(part_tipo_veneno, 0, 360, 0, 10);

// Vida das partículas
part_type_life(part_tipo_veneno, 10, 30);  // Dura entre 30 e 60 steps (curta duração)

// Gravidade leve nas partículas
part_type_gravity(part_tipo_veneno, 0.01, 270);  // Queda leve

// Taxa de emissão
part_emission_rate = 1;  // Emitir poucas partículas por frame
