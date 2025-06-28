// Calcula o movimento que a plataforma tentará fazer
var _movimento_horizontal = dir * velc;

// Verifica se o próximo passo vai colidir com qualquer obstáculo (limite, parede ou jogador)
var _colisao_limite = place_meeting(x + _movimento_horizontal, y, obj_limite);
var _colisao_parede = place_meeting(x + _movimento_horizontal, y, obj_parede_solida_pai);
var _colisao_jogador = place_meeting(x + _movimento_horizontal, y, obj_player);

// Se houver uma colisão com qualquer um desses obstáculos...
if (_colisao_limite || _colisao_parede || _colisao_jogador)
{
    // ...move a plataforma pixel por pixel até encostar no obstáculo.
    // Isso garante que a plataforma pare exatamente na borda do obstáculo.
    while (!place_meeting(x + dir, y, obj_limite) && !place_meeting(x + dir, y, obj_parede_solida_pai) && !place_meeting(x + dir, y, obj_player))
    {
        x += dir;
    }
    
    // Inverte a direção para o próximo frame
    dir *= -1;
    // Cancela o movimento para este frame.
    _movimento_horizontal = 0; 
}

// Move a plataforma para sua posição final.
// Se uma colisão foi detectada, _movimento_horizontal será 0.
x += _movimento_horizontal;


// --- 2. Lógica para Transportar o Jogador ---

// Verifica se o jogador está EM CIMA da plataforma
var _player_em_cima = instance_place(x, y - 1, obj_player);

// Se houver um jogador em cima...
if (instance_exists(_player_em_cima))
{
    // ...verifica se a plataforma não vai esmagá-lo contra uma parede.
    if (!place_meeting(_player_em_cima.x + _movimento_horizontal, _player_em_cima.y, obj_parede_solida_pai))
    {
        // Se o caminho estiver livre, move o jogador junto.
        _player_em_cima.x += _movimento_horizontal;
    }
}