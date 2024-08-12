/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
duration--;
alpha = max(0, alpha - 0.01); // Diminui gradualmente a opacidade

if (duration <= 0) {
    instance_destroy();
}