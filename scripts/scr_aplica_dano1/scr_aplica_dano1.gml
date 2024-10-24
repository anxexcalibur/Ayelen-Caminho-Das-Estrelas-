// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_aplica_dano(obj, dano) {
    // Verifica se o objeto é válido e tem uma variável 'vida'
    if (instance_exists(obj)) {
        // Aplica o dano ao objeto
        obj.vida_atual -= dano;
        obj.estado = "hit"
        // Se quiser, pode adicionar uma condição para controlar quando a vida do objeto for menor ou igual a 0, por exemplo, mudando seu estado
        //if (obj.vida <= 0) {
            // Aqui você pode mudar o estado do objeto para "morto" ou algo similar
            //obj.estado = "morto"; // Exemplo, mude conforme necessário
//}
    }
}
