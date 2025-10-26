//==============================================================================
// DETECÇÃO E APLICAÇÃO DE DANO EM ÁREA (HITBOX)
//==============================================================================

// Cria uma lista temporária para armazenar os alvos atingidos neste frame.
var lista_alvos = ds_list_create();
var num_alvos = instance_place_list(x, y, obj_entidade, lista_alvos, false);

if (num_alvos > 0) {
    // Itera sobre todos os alvos que estão colidindo com a hitbox.
    for (var i = 0; i < num_alvos; i++) {
        var _alvo_id = lista_alvos[| i];

        // Garante que a instância do alvo ainda existe antes de interagir com ela.
        if (!instance_exists(_alvo_id)) {
            continue; // Pula para a próxima iteração do loop.
        }

        // Verifica se o alvo JÁ FOI ATINGIDO por este golpe específico.
        if (ds_list_find_index(inimigos_acertados, _alvo_id) == -1) {
            
            // Verifica se o alvo pode receber dano no estado atual.
            if (_alvo_id.pode_levar_dano) {
                // --- Aplica os efeitos do golpe ---

                // [CORREÇÃO] Acessamos o enum diretamente, sem passar pela instância '_alvo_id'.
                _alvo_id.estado = "hit";
                
                _alvo_id.vida_atual -= obj_player.ataque;
                _alvo_id.velh = 0;

                audio_play_sound(snd_hit_inimigos, 2, false);

                // Adiciona o ID do alvo na lista 'inimigos_acertados'
                ds_list_add(inimigos_acertados, _alvo_id);
            }
        }
    }
}

// Limpa a lista temporária da memória para evitar memory leaks.
ds_list_destroy(lista_alvos);