/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Definindo a velocidade inicial do projétil
velocidade = 0.5; // ajuste a velocidade conforme necessário

// Definir o sistema de partículas
part_sistema = part_system_create();

// Criar o tipo de partícula de água
part_agua = part_type_create();
part_type_shape(part_agua, pt_shape_circle); // Forma de círculo para parecer uma gota de água
part_type_size(part_agua, 0.1, 0.3, 0, 0);  // Tamanho pequeno
part_type_color1(part_agua, c_aqua);         // Cor água
part_type_alpha2(part_agua, 0.5, 0);         // Começa translúcido e desaparece
part_type_speed(part_agua, 0.5, 1, 0, 0);    // Movimento suave
part_type_direction(part_agua, 0, 360, 0, 0); // Direção aleatória
part_type_life(part_agua, 30, 60);           // Tempo de vida curto


