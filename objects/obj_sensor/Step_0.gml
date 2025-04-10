 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Checar se estou colidindo com o playe
var player = place_meeting(x,y,obj_player);
// o player esta colidindo comigo
var up = keyboard_check_released(ord("W"))
if(player && up and !place_meeting(x,y,obj_portal_levelup)){
//CODIGO DA TRANSISÃO
	with(obj_player){
		velh = 0
	}
	var tran = instance_create_layer(0,0, layer,obj_trasicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
	switch(room){
			case rm_prototipo: {
			global.nivel_do_jogo = 2;
			
		}
		
	
}

	
}else if (player && up and place_meeting(x, y, obj_portal_levelup)) {
    with (obj_player) {
        velh = 0;
    }

    // Criar a transição
    var tran = instance_create_layer(0, 0, layer, obj_trasicao);
    tran.destino = destino;
    tran.destino_x = destino_x;
    tran.destino_y = destino_y;

    // Criar a mensagem de "Level Up"
    var levelup_message = instance_create_layer(room_width / 2, room_height / 2, "instances", obj_levelup_message);
    levelup_message.text = "Level Up!";  // O texto da mensagem
    
	levelup_message.duration = 10;  // Duração de 3 segundos para mostrar a mensagem
		
    // Ajustar o nível do jogo
    switch (room) {
        case rm_prototipo: {
            global.nivel_do_jogo = 2;
        }
    }
}

