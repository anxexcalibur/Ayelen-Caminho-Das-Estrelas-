
// Inicializa a estrela
ativou = false;
timer = 0; 
tempo_de_ativacao = 120; 
velocidade_subida = 5; 

// Cria o sistema e tipo de partículas
part_system = part_system_create();
part_type = part_type_create();
part_type_shape(part_type, pt_shape_circle);
part_type_size(part_type, 0.1, 0.4, 0, 0);
part_type_life(part_type, 20, 40);
part_type_speed(part_type, 1, 2, 0, 0);
part_type_gravity(part_type, 0, 0);
part_type_color1(part_type, c_yellow);
part_type_color2(part_type, c_red, c_red);

// Evento Create
text = "";


