/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Criação do sistema de partículas
p_sys = part_system_create();
p_type = part_type_create();
// Crie isso no Create Event do objeto que está detectando o ritual:
ritual_ativado = false;

// Configurações do tipo de partícula
part_type_shape(p_type, pt_shape_pixel); // Forma da partícula
part_type_color1(p_type, c_aqua); // Cor inicial
part_type_color2(p_type, c_red, c_green); // Cor final
part_type_alpha3(p_type, 1, 0.5, 0); // Opacidade
part_type_size(p_type, 0.05, 0.1, 0.2, 0.2); // Tamanho
part_type_speed(p_type, 0.1, 0.5, 0, 0); // Velocidade
part_type_direction(p_type, 0, 360, 0, 0); // Direção
part_type_gravity(p_type, 0, 0); // Gravidade
part_type_life(p_type, 30, 60); // Duração das partículas
// Declaração no evento Create
var ritual_ativo = false;