 /// @description Inserir descrição aqui

randomize();


//criando a câmera
morreu = false 
var cam = instance_create_layer(x,y,layer,obj_camera);
cam.alvo = id;

// Velocidade do Dash
vel_dash = 10

//Contando a duração do dash
duracao_dash = 10;
tempo_dash = duracao_dash;
// Você pode escrever seu código neste editor
menu_existe = false;
event_inherited();
max_vida = 2;
vida_atual = max_vida;
recebendohit = true;
max_velh = 3;
max_velv = 7;
mostra_estado = true;
dano = noone;
ataque = 1;
posso = true;
ataque_down = false;
healthbar_width = 200;
healthbar_height = 24;
healthbar_x = (400/2) -(healthbar_width/2);
healthbar_y = ystart -100;
dashe = noone
alfa_hit = 0;
alarm[0] = 0;
inv_tempo = 180;
// inicialização de constelações
global.constelacao_atual = 0;
global.estrelas_coletadas = 0;
global.constelacoes = [
	{nome: "Homem Velho", total: 6},
    {nome: "Anta do Norte", total: 10},
    {nome: "Veado", total: 8}
];

// Inicializando a pontuação
global.pontuacao = 0;
//metodo para iniciar o ataque
///@method inicia_ataque(chao);
///@arg {bool} chao
inicia_ataque = function(chao)
{
	if(chao){
		estado = "ataque";
		velh = 0;
		image_index = 0;
	}else{
		if(keyboard_check(ord("S"))){
			estado = "ataque aereo down";
			velh = 0;
			image_index = 0;
		}else{
			estado = "ataque aereo"
			
			image_index = 0;
		}
	}
	 
}
//aplicando gravidade
aplica_gravidade = function(){
	// Aplicando gravidade
	var chao = place_meeting(x,y+1,obj_block);
	if (!chao) {
	    if (velv < max_velv * 2) {
	        velv += GRAVIDADE * massa 
	    }
	}
}


