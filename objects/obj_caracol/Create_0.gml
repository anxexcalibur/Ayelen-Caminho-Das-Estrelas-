//==============================================================================
// INICIALIZAÇÃO DO CARACOL (Estilo Tatu)
//==============================================================================

// Herda o código do objeto pai, se houver
event_inherited();

// --- Atributos ---
vida_atual = 2;
pode_levar_dano = true;
massa = 1.2;

// --- Constantes de Comportamento ---

#macro VELOCIDADE_MAX_QUEDA 10
VELOCIDADE_H = 0.2;         // Velocidade de movimento horizontal
TEMPO_MUDANCA_ESTADO = 180; // 3 segundos a 60 FPS
CHANCE_GOSMA = 4;           // Chance em % de criar gosma
PONTOS_POR_MORTE = 3;

// --- Máquina de Estados ---
enum CARACOL_ESTADO {
    PARADO,
    ANDANDO,
    HIT,
    RECUPERANDO,
    MORTO
}
estado = CARACOL_ESTADO.PARADO;

// --- Variáveis de Controle ---
direcao = choose(1, -1); // 1 para direita, -1 para esquerda
timer_estado = 0;
timer_recuperacao = 0;
colisao_cooldown = 0;