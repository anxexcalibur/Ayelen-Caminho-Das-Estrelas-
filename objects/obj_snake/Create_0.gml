
event_inherited();
/// @description Inicialização da cobra inimiga

// Estados possíveis: "parado", "atirando", "hit", "morto"
estado = "parado";

// Vida
vida_atual = 3;

// Direção inicial (1 = direita, -1 = esquerda)
lado_certo = -1;

// Velocidade vertical
velv = 0;
max_velv = 10;
massa = 1;
alvo_x = 0; // ← ADICIONE ESSAS LINHAS
alvo_y = 0;

// Cooldown entre tiros
tiro_cooldown = 0;

// Flag para controlar se já atirou neste ciclo de animação
atirou = false;

// Define sprite inicial
sprite_index = spr_snake;
image_xscale = lado_certo;
