 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Animação para cima e para baixo
event_inherited()
 // Se o jogador está perto do NPC
    if (distance_to_object(obj_player) < 32) 
    {
        // Se ainda não existe um ponto de interrogação para este NPC
        if (!instance_exists(interrogacao)) 
        {
            interrogacao = instance_create_layer(x, y, "instances", obj_interrogacao);
        }
    } 
    else 
    {
        // Se a interrogação desse NPC existir, destrói
        if (instance_exists(interrogacao)) 
        {
            with (interrogacao) instance_destroy();
            interrogacao = noone; // Zera a variável para evitar bugs
        }
    }
if (sprite_index == spr_ceramica_quebrada) {
    // Se já está quebrando, espera a animação terminar
    if (image_index >= image_number - 1) {
        instance_destroy();  // Destrói quando a animação acaba
    }
}
else if (place_meeting(x, y, obj_hit_inimigos) && (obj_player.estado == "ataque" || obj_player.estado == "ataque down")) {
    // Se colidiu e o player está atacando, troca para a animação quebrada
    sprite_index = spr_ceramica_quebrada;
    image_speed = 1;
    image_index = 0;  // Garante que a animação começa do início
}
