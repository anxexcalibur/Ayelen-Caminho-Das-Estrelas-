// Step Event do obj_transicao

if (mudei) {
    // Já mudei de room, então vou ficando invisível
    alpha -= 0.03;
} else {
    // Ainda não mudei de room, vou ficando visível
    alpha += 0.03;
}

// Quando o alpha chegar em 1, mudo de sala
if (alpha >= 1) {
    room_goto(destino);

    // Controla a posição do player (caso queira mover imediatamente ao trocar de sala)
    obj_player.x = destino_x;
    obj_player.y = destino_y;

    // Cria o jogador na nova sala, se ainda não existir
    if (!instance_exists(obj_player)) {
        var inst_player = instance_create_layer(destino_x, destino_y, "Instances", obj_player);
        inst_player.etapa_historia = etapa; // Ajusta a etapa se necessário
    }

    mudei = true;
}

// Me destruo após a transição terminar (ficar invisível de novo)
if (mudei && alpha <= 0) {
    instance_destroy();
}
