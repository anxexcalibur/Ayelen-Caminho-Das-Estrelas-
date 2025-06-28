
event_inherited();
//==================================================================

/// @description Inicializa a cobra inimiga

// Variáveis de Estado
estado = "parado";

// Atributos de Combate
vida = 3;
alcance_visao = 350; // Distância em que a cobra "vê" o jogador
cooldown_ataque = 120; // Tempo em frames entre os ataques (2 segundos a 60FPS)
timer_cooldown = 0;   // Timer atual do cooldown

// Atributos de Física (se a cobra se mover ou cair)
hspd = 0;
vspd = 0;
grav = 0.2;

// Variáveis de Controle
atirou_neste_ciclo = false; // Garante que atire apenas uma vez por animação