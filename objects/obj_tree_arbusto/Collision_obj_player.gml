// Verifica se o jogador está próximo
if (place_meeting(x, y, obj_player)) {
    // Gera um número aleatório e verifica se está dentro da probabilidade
    if (irandom(99) < 0.1) { // 5% de chance (número entre 0 e 99)
        instance_create_layer(x, y - 60, "instances", obj_coco);
    }
}

