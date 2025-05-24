var id_item = string(x) + "_" + string(y);

if (!ds_map_exists(global.itens_coletados, id_item)) {
    ds_map_set(global.itens_coletados, id_item, 1);  // Marca no mapa como coletado

    // Aqui você pode colocar outras ações de coleta, como:
    // global.pontuacao += 10;
    // audio_play_sound(snd_pegar_item, 1, false);

    instance_destroy();  // Destroi o item
}
