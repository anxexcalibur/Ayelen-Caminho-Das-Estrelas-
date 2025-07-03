/// @description Configuração da partícula mágica verde
// Evento Create do obj_shoot
dano = obj_player.ataque; // Pega o dano do player no momento da criação
inimigos_acertados = ds_list_create(); // Lista para evitar dano múltiplo
// Criação do sistema de partículas e tipo de partícula
part_system = part_system_create();
part_type = part_type_create();

// Definir o formato da partícula (círculo)
part_type_shape(part_type, pt_shape_explosion);

// Definir o tamanho da partícula (inicial e final)
part_type_size(part_type, 0.1, 0.2, 0, 0);

// Definir a cor da partícula (verde)
part_type_color1(part_type, make_color_rgb(0, 255, 0));

// Definir a transparência (começa opaca e vai ficando transparente)
part_type_alpha2(part_type, 0.3, 0);

// Definir a velocidade da partícula (mínima, máxima, incremento, variação)
part_type_speed(part_type, 0.1, 1, 0, 0); // Usando 5 argumentos

// Definir a direção da partícula (mínima, máxima, incremento, variação)
part_type_direction(part_type, 0, 200, 0, 0);

// Definir o tempo de vida da partícula (mínimo e máximo)
part_type_life(part_type, 20, 21);

// Definir a gravidade da partícula (força e direção)
part_type_gravity(part_type, 0.01, 270);
