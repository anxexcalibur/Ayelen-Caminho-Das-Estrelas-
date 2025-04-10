 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
estado = "cura"
vida_atual++
global.pontuacao += 10;
with(other){
	instance_destroy();
 }
 // No evento de colisão com obj_vida (por exemplo, em "colisão com obj_vida" ou no estado "pulando")
// Variáveis para armazenar o sistema de partículas e o tipo de partícula
// Variáveis para armazenar o sistema de partículas e o tipo de partícula
var particulas_ativas = false;
var part_system;
var part_type;
var part_emitter;

// No evento de colisão com obj_vida (por exemplo, no estado "pulando")
if (place_meeting(x, y, obj_vida)) {
    // Ativar as partículas (se ainda não tiverem sido ativadas)
    if (!particulas_ativas) {
        particulas_ativas = true;

        // Cria o sistema de partículas
        part_system = part_system_create(); // Cria o sistema de partículas

        // Cria o tipo de partícula (verde, poucas partículas)
        part_type = part_type_create();
        part_type_shape(part_type, pt_shape_square); // Forma da partícula (quadrado ou círculo)
        part_type_size(part_type, 0.5, 1, 0, 0);  // Tamanho pequeno da partícula (min = 0.5, max = 1, aleatório = 0, variação do tamanho = 0)
        part_type_color1(part_type, c_green); // Cor verde
        part_type_life(part_type, 10, 20); // Vida curta para as partículas
        part_type_speed(part_type, 0, 1, 0, 360); // Velocidade da partícula (min = 0, max = 1, direção = 0 a 360)

        // Cria o emissor de partículas na posição do jogador
        part_emitter = part_emitter_create(part_system); // Emissor vinculado ao sistema de partículas
        part_emitter_region(part_emitter, x - 10, x + 10, y - 10, y + 10, ps_shape_square, ps_distr_linear, 5); // Emite ao redor do jogador
        part_emitter_burst(part_emitter, part_type, 5, ps_distr_linear); // Lança 5 partículas com distribuição linear
    }
} else {
    // Se as partículas estiverem ativas e o jogador não estiver mais tocando o obj_vida
    if (particulas_ativas) {
        particulas_ativas = false;
        
        // Destrói o sistema de partículas
        part_system_destroy(part_system); // Destroi o sistema de partículas
    }
}






