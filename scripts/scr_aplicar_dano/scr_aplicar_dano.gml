// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_aplicar_dano(){
	/// @description Aplica dano a uma entidade
	/// @param dano Quantidade de dano a ser aplicado
	/// @param obj obj que vai sofre o dano

	var dano = argument0; // Obtém o valor do parâmetro passado para o script

	if (!dano_aplicado) {
	    vida_atual -= dano; // Aplica o dano baseado na quantidade passada
	    dano_aplicado = true; // Marca que o dano já foi aplicado
	}

}