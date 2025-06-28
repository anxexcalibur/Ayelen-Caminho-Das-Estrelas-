/// @description Inicializa a estrela com todos os estados possíveis

// --- Sua Lógica Original ---
ativou = false;
timer = 0;
tempo_de_ativacao = 120;
velocidade_subida = 5;
text = "";

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

// --- Variáveis para a Física do Drop e Coleta por Toque ---
vspd = 0; // Velocidade vertical
hspd = 0; // Velocidade horizontal
grav = 0.2; // Força da gravidade

// Variáveis de Animação do Drop
escala_final = 1.0;
velocidade_anim = 0.1;

// --- A Variável Chave: A Máquina de Estados ---
// Define o comportamento inicial da estrela.
// "coletavel" -> Está parada no cenário, esperando a tecla "F".
// "animando" / "parado" -> Foi dropada e tem física.
estado_drop = "coletavel";
