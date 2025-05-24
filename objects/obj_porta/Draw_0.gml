draw_self();

if (encostou) {
    var mensagem = global.key ? "Pressione F para ativar" : "Você precisa de uma chave";
    draw_text(x, y - 32, mensagem);
}
