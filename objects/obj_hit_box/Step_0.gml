// Usando instance_place_list para checar múltiplos alvos de uma vez
var lista_alvos = ds_list_create();
var num_alvos = instance_place_list(x, y, obj_entidade, lista_alvos, false);

if (num_alvos > 0) {
    // Itera sobre todos os alvos que estão colidindo
    for (var i = 0; i < num_alvos; i++) {
        var alvo = lista_alvos[| i];

        // Verifica se o alvo JÁ FOI ATINGIDO por este golpe
        if (ds_list_find_index(inimigos_acertados, alvo.id) == -1) {
            // Se não foi encontrado na lista (-1), então aplicamos o dano

            if (alvo.pode_levar_dano) {
                alvo.estado = "hit";
                alvo.vida_atual -= obj_player.ataque;
				audio_play_sound(snd_hit_inimigos, 2, false)

                // ADICIONA o alvo na lista para não ser atingido novamente
                ds_list_add(inimigos_acertados, alvo.id);
				
            }
        }
    }
}

ds_list_destroy(lista_alvos);
// Limpa a lista de checagem de colisão
