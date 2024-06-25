/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

contador = lerp(contador,1,.02)
if (place_meeting(x, y, obj_block)) {
    // Colisão aconteceu com o objeto 'obj_outro'
    // Faça algo aqui, como mudar uma variável, destruir um objeto, etc.
	
	if(contador > 0.90){
		
		show_debug_message("estou destruindo")
	}
}


