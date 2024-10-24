/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var px = other.x;
var py = other.y;
for (var i = 0; i < 20; i++) {
    part_particles_create(part_system, px, py, part_type, 1); // Criar as partículas no ponto de impacto
}

