/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
y += velocidade_vertical;
velocidade_vertical += gravidade;

if (place_meeting(x, y, obj_inimigo)) {
    desaparecer = true;
}

if (desaparecer) {
    instance_destroy();
}