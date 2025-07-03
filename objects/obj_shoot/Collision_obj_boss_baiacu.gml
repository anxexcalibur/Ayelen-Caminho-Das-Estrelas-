/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Código de colisão entre a lança e o chefe

// Causar dano no chef

// Tremor de tela ao atingir o chefe; // Crie a função de tremor de tela ou use sua própria
screenshake(10)
// Gerar partículas no ponto de colisão
var px = other.x;
var py = other.y;
for (var i = 0; i < 20; i++) {
    part_particles_create(part_system, px, py, part_type, 1); // Criar as partículas no ponto de impacto
}

// Destruir a lança após o impacto
instance_destroy();

