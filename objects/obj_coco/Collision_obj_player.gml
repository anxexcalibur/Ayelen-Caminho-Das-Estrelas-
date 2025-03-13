/// @description Inserir descrição aqui
// Mostrar animação de quebra
sprite_index = spr_coco_quebrando; // Substitua pelo nome do sprite de animação
image_speed = 0.2;                 // Ajuste a velocidade da animação
image_index = 0;                   // Inicia a animação do início

// Impedir que o coco continue caindo
                    // Remove a gravidade
speed = 0;                         // Para qualquer movimento

// Criar partículas no momento do impacto


// Destruir o coco após a animação
if (image_index == sprite_get_number(sprite_index) - 1) { // Quando a animação terminar
    alarm[0] = 1;                                         // Configura o alarme para destruir o objeto
}
