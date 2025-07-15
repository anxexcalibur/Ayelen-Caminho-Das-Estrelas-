var _player_id = instance_place(x, y, obj_player);

// 2. Se a colisão estiver acontecendo...
if (_player_id != noone)
{
    // --- EFEITO DE PARTÍCULAS ---
    // Cria uma "explosão" de 20 a 30 partículas na posição do bloco
   
    
    // Toca um som de "impulso" (opcional, mas recomendado)
    // audio_play_sound(snd_impulso, 10, false);
    
    // 3. Usamos 'with' para aplicar a lógica diretamente na instância do jogador
    with (_player_id)
    {
        // 4. Sobrepõe a velocidade vertical do jogador.
        velv = -other.velocidade_subida;
        
        // 5. Força o estado do jogador para "pulando".
        estado = "pulando";
    }
}
