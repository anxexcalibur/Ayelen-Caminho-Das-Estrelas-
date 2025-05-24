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