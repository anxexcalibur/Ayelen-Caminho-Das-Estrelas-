/// @description Inicialização da piranha

event_inherited(); // Chama as variáveis e lógicas do objeto pai

// Atributos base
max_vida = 1 * global.dificuldade;
ataque = 2;
massa = 0.5;
pode_levar_dano = false;

// Variáveis da Máquina de Estados
estado = "caindo"; // Começa caindo pra achar a superfície da água
timer_estado = 0;
tempo_proximo_pulo = 30 + irandom(40); // Tempo aleatório para o primeiro pulo

// Variáveis Visuais
sprite_index = spr_piranha;
image_yscale = 1;