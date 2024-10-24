/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
audio_play_sound(snd_coletou,5,false)
vida_atual++
global.pontuacao += 10;
with(other){
	instance_destroy();
}