/// @description Comportamento completo do caracol (Estilo Tatu)
//==============================================================================
// FÍSICA E GRAVIDADE
//==============================================================================
var _chao = place_meeting(x, y + 1, obj_block);
if (!_chao) {
    if (velv < VELOCIDADE_MAX_QUEDA) {
        velv += GRAVIDADE * massa;
    }
} else {
    velv = 0;
}

//==============================================================================
// MÁQUINA DE ESTADOS
//==============================================================================
switch (estado)
{
    //----------------------------------------------------
    // ESTADO: PARADO
    // O caracol fica imóvel por um tempo.
    //----------------------------------------------------
    case "parado":
    {
        // Ações de ENTRADA no estado
        if (sprite_index != spr_caracol_parado) { // Assumindo que você tenha um sprite para ele parado
            sprite_index = spr_caracol_parado;
            image_index = 0;
            pode_levar_dano = true;
        }

        // Lógica de ATUALIZAÇÃO do estado
        timer_estado++;
        if (timer_estado > TEMPO_MUDANCA_ESTADO) {
            timer_estado = 0;
            estado ="andando";
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: ANDANDO
    // O caracol se move e deixa um rastro.
    //----------------------------------------------------
    case "andando":
    {
        // Ações de ENTRADA no estado
        var _sprite_andando = (direcao == 1) ? spr_caracol_andando_direita : spr_caracol_andando_esquerda;
        if (sprite_index != _sprite_andando) {
            sprite_index = _sprite_andando;
            image_index = 0;
            pode_levar_dano = true;
        }
        
        // Lógica de ATUALIZAÇÃO do estado
        timer_estado++;
        
        // Lógica de Colisão e Inversão
        if (colisao_cooldown > 0) {
            colisao_cooldown--;
        } else {
            var _pos_checar = x + direcao;
            var _colisao_parede = place_meeting(_pos_checar, y, obj_block);
            var _alvo_player = instance_place(_pos_checar, y, obj_player);

            if (_colisao_parede || (_alvo_player != noone && _alvo_player.estado == "defesa")) {
                direcao *= -1;
            }
        }
        
        // Movimento Pixel-Perfect
        var _vel = VELOCIDADE_H;
        while (_vel > 0) {
            var _passo = min(1, _vel);
            if (!place_meeting(x + (_passo * direcao), y, obj_block)) { x += _passo * direcao; } else { break; }
            _vel -= _passo;
        }

        // Criação de Rastro
        if (random(100) < CHANCE_GOSMA) {
            var _offset_x = -25 * direcao;
            instance_create_layer(x + _offset_x, y - 33, "Instances", obj_gosma_rastro);
        }

        // Lógica de mudança de estado
        if (timer_estado > TEMPO_MUDANCA_ESTADO) {
            timer_estado = 0;
            estado = "parado";
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: HIT (ATINGIDO)
    //----------------------------------------------------
    case "hit":
    {
        // Ações de ENTRADA no estado
        if (sprite_index != spr_caracol_dano) {
            sprite_index = spr_caracol_dano;
            image_index = 0;
            pode_levar_dano = false;
            screenshake(1);
        }

        // Lógica de FIM DE ANIMAÇÃO
        if (image_index >= image_number - 1) {
            if (vida_atual <= 0) {
                estado ="morto";
            } else {
                estado = "recuperando";
            }
        }
        break;
    }

    //----------------------------------------------------
    // ESTADO: RECUPERANDO
    // Pausa após o dano para evitar bugs.
    //----------------------------------------------------
    case "recuperando":
    {
        // Ações de ENTRADA no estado
        if (sprite_index != spr_caracol_tonto) {
            sprite_index = spr_caracol_tonto;
            image_index = 0;
            timer_recuperacao = 19; // Define o timer ao entrar no estado
        }

        // Lógica de ATUALIZAÇÃO do estado
        timer_recuperacao--;
        if (timer_recuperacao <= 0) {
            estado = CARACOL_ESTADO.PARADO; // Volta a ficar parado para recomeçar o ciclo
            colisao_cooldown = 5; // Ativa a imunidade de colisão
        }
        break;
    }
    
    //----------------------------------------------------
    // ESTADO: MORTO
    //----------------------------------------------------
    case "morto" :
    {
        // Ações de ENTRADA no estado
        if (sprite_index != spr_caracol_morto) {
            sprite_index = spr_caracol_morto;
            image_index = 0;
            pode_levar_dano = false;
            pontuar(PONTOS_POR_MORTE);
        }
        
        // Lógica de FIM DE ANIMAÇÃO
        if (image_index >= image_number - 1) {
            instance_destroy();
        }
        break;
    }
}