/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Reduzir a duração e destruir o objeto quando o tempo acabar
duration -= 1 / room_speed;  // Reduzir o tempo conforme a taxa de quadros

if (duration <= 0) {
    instance_destroy();  // Destruir o objeto quando a duração terminar
}
// Detectar quando a tecla "U" for pressionada
if (keyboard_check_pressed(ord("U"))) {
    desenha = true;  // Definir desenha como true quando a tecla "U" for pressionada
}
