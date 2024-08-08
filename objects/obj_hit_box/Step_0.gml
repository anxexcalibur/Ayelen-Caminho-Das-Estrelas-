
var outro = instance_place(x,y,obj_inimigos_pai);
x_hitbox = x;
y_hitbox = y;
// if se eu estou tocando em alguém
if(outro){
	// se eu não sou o pai
	if(outro.id != pai){ 
		if(outro.vida_atual > 0 ){
			outro.estado = "hit";
			outro.vida_atual -= obj_player.ataque;
			
			
			if(estado = "ataque aereo down"){
				outro.vida_atual -= 3;
				outro.x += lengthdir_x(4, 1);
			}else {
				outro.vida_atual -= ataque;	
			} 
			
			instance_destroy();
			
		}
		
	}
}




