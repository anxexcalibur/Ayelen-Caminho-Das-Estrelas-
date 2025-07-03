/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// A gosma vai desaparecer suavemente
image_alpha -= 0.01;

if (image_alpha <= 0) {
    instance_destroy();
}
