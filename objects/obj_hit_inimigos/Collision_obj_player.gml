/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(_player.vida_atual > 0 ){
		
	if _player.estado != "hit" && _player.estado != "morto" 
	{
		if obj_boss_baiacu.ataque_estado != 2 && _player.estado == "defesa"{
			scr_aplica_dano(obj_player, 0.002 - obj_player.resistencia)
			instance_destroy(obj_hit_inimigos.id)
		}
		
	}else if _player.estado == "defesa" && obj_boss_baiacu.ataque_estado != 2 {
		screenshake(3)
		instance_destroy(obj_hit_inimigos.id)
		scr_aplica_dano(obj_boss_baiacu,0.01 - obj_player.resistencia)
		
	}else if _player.estado == "ataque projetil" {
		instance_destroy(obj_hit_inimigos.id)
		_player.estado = "hit"
		
	}
	
	
	
	
	
}

			
	




