// Atualiza o timer de cooldown
if (timer_cooldown > 0) {
    timer_cooldown--;
}

// Lógica da máquina de estados
switch (estado)
{
    // --- ESTADO: PARADO ---
    // A cobra está ociosa, esperando o jogador se aproximar.
    case "parado":
        sprite_index = spr_snake; // Defina o nome da sua sprite
        
        // Se o jogador existe na sala...
        if (instance_exists(obj_player)) {
            
            // ...vira na direção do jogador
            if (obj_player.x < x) {
                image_xscale = -1; // Vira para a esquerda
            } else {
                image_xscale = 1;  // Vira para a direita
            }
            
            // ...e verifica a distância
            var _dist = distance_to_object(obj_player);
            
            // Se o jogador está no alcance e o ataque não está em cooldown...
            if (_dist < alcance_visao && timer_cooldown <= 0) {
                // ...muda para o estado de ataque
                estado = "atacando";
                image_index = 0; // Reinicia a animação de ataque
                atirou_neste_ciclo = false; // Prepara para o novo tiro
            }
        }
        break;

    // --- ESTADO: ATACANDO ---
    // A cobra executa a animação e dispara o projétil.
    case "atacando":
        sprite_index = spr_snake_shoot; // Defina o nome da sua sprite de ataque

        // Define o frame exato para o disparo (ajuste conforme sua animação)
        var _frame_do_disparo = 4;
        
        // Se a animação passou do frame de disparo e ainda não atirou...
        if (image_index >= _frame_do_disparo && !atirou_neste_ciclo)
        {
            // Cria o projétil
            var _proj = instance_create_layer(x, y, "Instances", obj_projetil2);
            
            // Passa a direção para o projétil
            _proj.direcao = image_xscale;
            
            // Marca que já atirou para não criar mais projéteis nesta animação
            atirou_neste_ciclo = true;
        }

        // Se a animação de ataque terminou...
        if (image_index >= image_number - 1) { 
            timer_cooldown = cooldown_ataque; // Inicia o tempo de recarga
            estado = "parado"; // Volta para o estado parado
        }
        break;
        
    // --- ESTADO: DANO ---
    // A cobra foi atingida e reage.
    case "hit":
        // Este estado geralmente é ativado por um projétil do jogador
        // Ex: no evento de colisão com o tiro do player, você colocaria: obj_cobra.estado = "hit";
        
        sprite_index = spr_snake_hit; // Defina a sua sprite de dano
        
        // Quando a animação de dano termina...
        if (image_index >= image_number - 1) {
            // ...verifica se a vida acabou.
            if (vida <= 0) {
                estado = "morto";
                image_index = 0;
            } else {
                // Se ainda tem vida, volta a ficar parada
                estado = "parado";
            }
        }
        break;
        
    // --- ESTADO: MORTO ---
    // A cobra foi derrotada.
    case "morto":
        sprite_index = spr_snake_dead; // Defina a sua sprite de morte
        
        // Trava a animação no último frame
        if (image_index >= image_number - 1) {
            image_speed = 0; // Para a animação
            image_index = image_number - 1;
            
            // Após um tempo, desaparece (opcional)
            // Se não tiver um alarme para isso, pode se destruir diretamente.
            // instance_destroy();
        }
        break;
}