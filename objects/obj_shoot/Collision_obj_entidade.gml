/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var alvo = other; // 'other' se refere à instância de obj_entidade com a qual colidimos

// Verifica se este alvo já foi atingido por este projétil
if (ds_list_find_index(inimigos_acertados, alvo.id) == -1) {
    
    // Aplica o dano e os efeitos
    if (alvo.pode_levar_dano) {
		screenshake(10)
        alvo.estado = "hit";
        alvo.vida_atual -= dano + 5;

        // Adiciona o alvo na lista para não ser atingido de novo
        ds_list_add(inimigos_acertados, alvo.id);
    }

    // --- DECISÃO IMPORTANTE ---
    // Se o projétil deve ser destruído no primeiro impacto, adicione esta linha:
    instance_destroy();
    
    // Se o projétil pode perfurar múltiplos inimigos, NÃO use instance_destroy() aqui.
    // Ele continuará se movendo até sair da tela ou atingir uma parede.
}