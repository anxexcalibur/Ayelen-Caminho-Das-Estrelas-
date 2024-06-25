// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_ataca_player(player, dist, xscale){
    ///@arg player
    ///@arg dist
    ///@arg xscale
	
    var outro = player;
    // Checando se o player está na minha linha de visão
    var player_collision = collision_line(x, y - sprite_height/2, x + (dist * xscale), y - sprite_height/2, outro, 0, 1);
    // Se o player entrou na linha de visão
    if(player_collision != noone){
		if(player.estado != "ataque"){
			estado = "ataque";
		}
	}
}
