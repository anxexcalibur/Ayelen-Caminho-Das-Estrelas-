/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento Alarm[0] - Instancia o projétil e define o próximo alarme
var projetil_x = x + lengthdir_x(30, image_angle);
var projetil_y = y + lengthdir_y(30, image_angle);
instance_create(projetil_x, projetil_y, obj_projetil2);

// Define o próximo alarme para controlar o próximo intervalo de tempo
alarm[0] = room_speed * intervalo_tempo; // room_speed é a quantidade de passos de jogo por segundo


var projetil_x = x + lengthdir_x(30, image_angle);
var projetil_y = y + lengthdir_y(30, image_angle);
instance_create(projetil_x, projetil_y, obj_projetil2);