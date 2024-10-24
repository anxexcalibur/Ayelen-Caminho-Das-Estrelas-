/// @description Inserir descrição aqui
//ultimate dela
resistencia = 0;
global.balas = 100
distance_block = 0
_tile = layer_tilemap_get_id("Tile_3")
pode_desenhar = false
// Inicializa o gerador de números aleatórios para garantir que os resultados das funções de randomização sejam diferentes a cada execução do jogo
randomize();
hitbaiacu = false;
// Variável para controlar se o jogador morreu
morreu = false 
//Variável que indica se a vida max passou dos 10
max_vida_boolean = false;
// Cria uma instância da câmera na camada atual na posição (x, y)
var cam = instance_create_layer(x, y, layer, obj_camera);

// Define o alvo da câmera como a instância atual (jogador)
cam.alvo = id;

// Define a velocidade do dash
vel_dash = 10

// Define a duração do dash em frames
duracao_dash = 10;

// Inicializa o contador de tempo do dash com a duração definida
tempo_dash = duracao_dash;

// Inicializa a variável que controla a existência de menus no jogo
menu_existe = false;

// Chama o evento herdado (event_inherited) para garantir que o código do evento pai seja executado
event_inherited();

// Define a vida máxima do jogador
max_vida = 10;

// Define a vida atual do jogador como a vida máxima
vida_atual = max_vida;

// Variável para controlar se o jogador está recebendo dano
recebendohit = true;
congelado = false	
// Define a velocidade máxima horizontal do jogador
max_velh = 3;

// Define a velocidade máxima vertical do jogador
max_velv = 7;

// Variável para controlar se o estado do jogador deve ser mostrado
mostra_estado = true;

// Variável para armazenar o dano recebido, inicializada como 'noone'
dano = noone;

// Define o valor do ataque do jogador
ataque = 30;

// Variável para controlar se o jogador pode realizar certas ações
posso = true;

// Variável para controlar se o ataque para baixo está ativo
ataque_down = false;

// Define a largura da barra de vida
healthbar_width = 200;

// Define a altura da barra de vida
healthbar_height = 24;
// Key
key_shoot = keyboard_check_pressed(ord("X"));
// Calcula a posição x da barra de vida com base na largura da tela e da barra
healthbar_x = (400 / 2) - (healthbar_width / 2);

// Define a posição y da barra de vida
healthbar_y = ystart +100;

// Inicializa a variável 'dashe' como 'noone'
dashe = noone;

// Define a transparência do jogador ao receber dano
alfa_hit = 0;

// Inicializa o alarme 0 com valor 0 (possivelmente para controle de tempo)
alarm[0] = 0;

// Define o tempo de invencibilidade após receber dano
inv_tempo = 180;



// Inicializa a pontuação global do jogo
global.pontuacao = 0;

// Método para iniciar o ataque
/// @method inicia_ataque(chao);
/// @arg {bool} chao
inicia_ataque = function(chao) {
    // Se o jogador está no chão
    if (chao) {
        // Define o estado do jogador como "ataque"
        estado = "ataque";
        // Define a velocidade horizontal como 0
        velh = 0;
        // Define o índice da imagem como 0 (para iniciar a animação do ataque)
        image_index = 0;
    } else {
        // Se a tecla "S" está sendo pressionada
        if (keyboard_check(ord("S"))) {
            // Define o estado do jogador como "ataque aéreo para baixo"
            estado = "ataque aereo down";
            // Define a velocidade horizontal como 0
            velh = 0;
            // Define o índice da imagem como 0 (para iniciar a animação do ataque)
            image_index = 0;
        } else {
            // Define o estado do jogador como "ataque aéreo"
            estado = "ataque aereo";
            // Define o índice da imagem como 0 (para iniciar a animação do ataque)
            image_index = 0;
        }
    }
}

// Função para aplicar a gravidade ao jogador
aplica_gravidade = function() {
    // Verifica se o jogador está colidindo com o chão
    var chao = place_meeting(x, y + 1, obj_block);
    // Se o jogador não está no chão
    if (!chao) {
        // Se a velocidade vertical é menor que o dobro da velocidade máxima vertical
        if (velv < max_velv * 2) {
            // Aumenta a velocidade vertical do jogador pela gravidade multiplicada pela massa
            velv += GRAVIDADE * massa;
        }
    }
}

// Função para carregar o checkpoint do jogador
carregar_checkpoint = function(_value) {
    // Obtém o nome do jogador selecionado na lista
    var jogador = _value;
    
    // Verifica se a instância do jogador ainda não existe na cena
    if (!instance_exists(obj_player)) {
        // Cria uma nova instância do jogador na camada "Instances" na posição (0, 0)
        instance_create_layer(0, 0, "Instances", obj_player);
    }
    
    // Verifica se o arquivo de save existe
    if (file_exists("save.sav")) {
        // Abre o arquivo de save
        ini_open("save.sav");
        
        // Lê a posição x do jogador do arquivo de save
        obj_player.x = ini_read_real(jogador, "x_atual", 0);
        
        // Lê a posição y do jogador do arquivo de save
        obj_player.y = ini_read_real(jogador, "y_atual", 0);
        
        // Lê a vida atual do jogador do arquivo de save
        var _vida_atual = ini_read_real(jogador, "vida_atual", 0);
        
        // Se a vida atual lida é maior ou igual a 0
        if (_vida_atual <= 0) {
            // Define a vida atual do jogador como 1
            obj_player.vida_atual += 2;
        } else {
            // Caso contrário, define a vida atual do jogador como o valor lido do arquivo de save
            obj_player.vida_atual = ini_read_real(jogador, "vida_atual", 0);
        }
        
        // Lê a sala atual do jogador do arquivo de save e muda para essa sala
        room_goto(ini_read_real(jogador, "sala_atual", 0));
        
        // Fecha o arquivo de save
        ini_close();
    } else {
        // Exibe uma mensagem informando que o arquivo de save não foi encontrado
        show_message("Arquivo de save não encontrado!");
    }
}
