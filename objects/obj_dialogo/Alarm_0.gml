/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if inicializar == true{
	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
		var _snd = choose(som_teclado,som_teclado_2);
		audio_play_sound(_snd,1,0)
	}
	caractere++;
	alarm[0] = 4;
}