/// @description Inicialização do jogador

// Itens e progresso
if (!variable_global_exists("pontuacao")) {
    global.pontuacao = 0;
}
pontuacao = global.pontuacao
// Estados e atributos
estado = "parado";
velv = 1;
velh = 1;
massa = 1;
resistencia = 0;
recebendohit = true;
congelado = false;
hitbaiacu = false;
morreu = false;
max_vida_boolean = false;
posso = true;
ataque_down = false;
mostra_estado = true;
// Evento Create do obj_player
// ... seu outro código ...
hitbox_criada = false;
// Evento Create do obj_player
// ... seu outro código ...
tiro_disparado = false;
// Vida
max_vida = 10;
vida_atual = max_vida;
// Adicione esta linha junto com suas outras variáveis
hitbox_aerea_id = noone;
// Ataque
ataque = 30;

// Dash
vel_dash = 10;
duracao_dash = 8;
tempo_dash = duracao_dash;
pode_dash = true;
dash_direcao = 1;
dashe = noone;

// Gravidade
 // Certifique-se que isso esteja definido
max_velh = 3;
max_velv = 7;

// Tilemap e HUD
_tile = layer_tilemap_get_id("Tile_3");
distance_block = 0;
pode_desenhar = false;
etapa_historia = 1;

// Invencibilidade
alfa_hit = 0;
inv_tempo = 180;
alarm[0] = 0;

// Barra de vida
healthbar_width = 200;
healthbar_height = 24;
healthbar_x = (400 / 2) - (healthbar_width / 2);
healthbar_y = ystart + 100;

// Partículas
particulas_ativas = false;

// Câmera
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;

// Randomização
randomize();

// Função de ataque
inicia_ataque = function(chao) {
    var s_pressionado = keyboard_check(ord("S"));

    if (chao) {
        estado = "ataque";
    } else {
        if (s_pressionado) {
            estado = "ataque aereo down";
        }
    }

    velh = 0;
    image_index = 0;
};

// Função para aplicar gravidade
aplica_gravidade = function() {
    var chao = place_meeting(x, y + 1, obj_pai_cenarios);
    if (!chao && velv < max_velv * 2) {
        velv += GRAVIDADE * massa;
    }
};


