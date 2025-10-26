// inherit do evento pai
event_inherited();

/*
É uma boa prática definir os estados e constantes no evento CREATE do objeto.
Isso torna o código mais legível e fácil de manter. Exemplo:

// --- No evento CREATE ---
enum E_TATU_ESTADO {
    PARADO,
    MOVENDO,
    HIT,
    MORTO
}

estado = E_TATU_ESTADO.PARADO;
timer_estado = 0;

// Constantes
TEMPO_MUDANCA_ESTADO = 180; // Frames (equivalente a 3 segundos a 60 FPS)
VELOCIDADE_MOVIMENTO = 2;
PONTOS_POR_MORTE = 6;
FORCA_SHAKE = 1;
GRAVIDADE = 0.3;
massa = 1.0;
// --- Fim do exemplo do CREATE ---
*/


//==============================================================================
// FÍSICA E COLISÃO
//==============================================================================

// Verifica se o inimigo está no chão
var chao = place_meeting(x, y + 1, obj_block);

// Aplica gravidade apenas se estiver no ar
if (!chao) {
    velv += GRAVIDADE * massa;
}

//==============================================================================
// MÁQUINA DE ESTADOS
//==============================================================================
switch (estado)
{
    //----------------------------------------------------
    // ESTADO: PARADO
    // O inimigo fica imóvel por um tempo.
    //----------------------------------------------------
    case "parado":
    {
        // Ações que acontecem ao ENTRAR no estado "parado"
        if (sprite_index != spr_tatucanastra_parado) {
            sprite_index = spr_tatucanastra_parado;
            image_index = 0;
            velh = 0; // Garante que para completamente
            pode_levar_dano = true; // Permite levar dano novamente
        }

        // Lógica que roda a cada frame no estado "parado"
        timer_estado++;
        if (timer_estado > 200) { // Pode substituir 200 por uma constante
            timer_estado = 0;
            // Decide o próximo estado, com maior chance de se mover
            estado = choose("movendo", "movendo", "parado");
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: MOVENDO
    // O inimigo se move para a esquerda ou direita.
    //----------------------------------------------------
    case "movendo":
    {
        // Ações que acontecem ao ENTRAR no estado "movendo"
        if (sprite_index != spr_tatucanastra) {
            sprite_index = spr_tatucanastra;
            image_index = 0;
            pode_levar_dano = true;
            
            // Escolhe uma direção apenas uma vez ao iniciar o movimento
            var direcao = choose(-1, 1); // -1 para esquerda, 1 para direita
            velh = direcao * 2; // Pode substituir 2 por VELOCIDADE_MOVIMENTO
        }
        
        // Lógica que roda a cada frame no estado "movendo"
        timer_estado++;

        // Interação com o jogador que está defendendo
        if (place_meeting(x, y, obj_player) && obj_player.estado == "defesa") {
            velh = -velh; // Inverte a direção
        }
        
        // Se bater numa parede, inverte a direção (melhoria opcional)
        if (place_meeting(x + velh, y, obj_block)) {
            velh = -velh;
        }

        // Lógica para mudar de estado
        if (timer_estado > 200) {
            timer_estado = 0;
            // Decide o próximo estado, com maior chance de parar
            estado = choose("parado", "parado", "movendo");
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: HIT (ATINGIDO)
    // O inimigo tomou dano e executa uma animação.
    //----------------------------------------------------
    case "hit":
    {
        // Ações que acontecem ao ENTRAR no estado "hit"
        if (sprite_index != spr_tatucanastra_hit) {
            sprite_index = spr_tatucanastra_hit;
            image_index = 0;
            pode_levar_dano = false; // Fica invulnerável durante a animação de hit
            velh = 0; // Para o movimento
            screenshake(1); // Pode substituir 1 por FORCA_SHAKE
        }

        // Lógica de FIM DE ANIMAÇÃO
        // Verifica se o frame atual é o último da animação
        if (image_index >= image_number - 1) {
            if (vida_atual <= 0) {
                estado = "morto";
            } else {
                estado = "parado"; // Volta ao estado "parado" para se recuperar
            }
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: MORTO
    // Animação de morte e destruição do objeto.
    //----------------------------------------------------
    case "morto":
    {
        // Ações que acontecem ao ENTRAR no estado "morto"
        if (sprite_index != spr_tatucanastra_morto) {
            sprite_index = spr_tatucanastra_morto;
            image_index = 0;
            velh = 0; // Garante que pare completamente
            pode_levar_dano = false; // Não pode mais levar dano
            pontuar(6); // Adiciona pontos (pode usar PONTOS_POR_MORTE)
        }
        
        // Lógica de FIM DE ANIMAÇÃO
        // Quando a animação de morte termina, destrói a instância
        if (image_index >= image_number - 1) {
            instance_destroy();
        }
        break;
    }
}


//==============================================================================
// ATUALIZAÇÃO VISUAL
//==============================================================================
// Vira o sprite na direção do movimento.
// A função sign() retorna -1 se velh for negativo, e 1 se for positivo.
if (velh != 0) {
    image_xscale = sign(velh);
}