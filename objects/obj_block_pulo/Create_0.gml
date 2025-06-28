// obj_block_pulo - Evento Create
//==================================================================
// Neste evento, nós definimos não apenas a velocidade, mas também
// as variáveis para os efeitos visuais que adicionamos.

/// @description Inicializa o bloco de pulo/elevador
velocidade_subida = 3; // A velocidade máxima que o jogador atingirá
suavidade_subida = 0.1; // Quão rápido o jogador acelera (0.0 a 1.0)

// --- PREPARAÇÃO DO SISTEMA DE PARTÍCULAS ---

// 1. Cria o "container" para as nossas partículas
part_system = part_system_create();

// 2. Cria o "molde" da partícula
part_type = part_type_create();

// 3. Define a aparência e o comportamento da partícula
part_type_shape(part_type, pt_shape_spark); // Formato de faísca/brilho
part_type_size(part_type, 0.10, 0.30, 0, 0); // Começa pequena e cresce um pouco
part_type_color3(part_type, c_yellow, c_orange, c_white); // Cores que se misturam
part_type_alpha3(part_type, 1, 0.5, 0); // Começa opaca e desaparece (fade-out)
part_type_life(part_type, 20, 40); // Duração da partícula em frames (curta)
part_type_speed(part_type, 1, 3, 0, 0.1); // Velocidade inicial e desaceleração
part_type_direction(part_type, 45, 135, 0, 10); // Direção para cima e para os lados

