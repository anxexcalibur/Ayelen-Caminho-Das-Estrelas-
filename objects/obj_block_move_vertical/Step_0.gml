// 1. Calcula o movimento que a plataforma VAI tentar fazer neste frame
var _movimento_vertical = dir * velc;

// 2. Verifica se tem um jogador em cima
var _player_id = instance_place(x, y - 1, obj_player);

// 3. Lógica de Colisão - PREVENÇÃO
var _deve_inverter_direcao = false;

// Verificação de Esmagamento (Subindo): O jogador em cima será esmagado contra uma parede?
if (_movimento_vertical < 0 && instance_exists(_player_id))
{
    if (place_meeting(_player_id.x, _player_id.y + _movimento_vertical, obj_parede_solida_pai))
    {
        _deve_inverter_direcao = true;
    }
}
// Verificação de Esmagamento (Descendo): A plataforma vai esmagar um jogador abaixo dela?
else if (_movimento_vertical > 0 && place_meeting(x, y + _movimento_vertical, obj_player))
{
    _deve_inverter_direcao = true;
}

// Se nenhuma colisão com jogador foi detectada, verifica colisão da plataforma com paredes
if (!_deve_inverter_direcao && place_meeting(x, y + _movimento_vertical, obj_parede_solida_pai))
{
    _deve_inverter_direcao = true;
}

// 4. Reage às Colisões
if (_deve_inverter_direcao)
{
    dir *= -1; // Inverte a direção para o próximo frame
    _movimento_vertical = 0; // Impede o movimento neste frame
}

// 5. Move a plataforma
// Se uma colisão foi detectada, _movimento_vertical será 0 e a plataforma não se moverá.
y += _movimento_vertical;

// 6. Transporta o jogador que está em cima
// Esta verificação acontece depois que a plataforma já se moveu para sua posição final válida.
if (instance_exists(_player_id))
{
    // Move o jogador pela mesma quantidade que a plataforma se moveu
    _player_id.y += _movimento_vertical;
}