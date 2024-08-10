 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.checkpoint_states = [];

game_over = false;
valor = 0;// variavel que serve para animar o retangulo 
contador = 0  //cariavel para controlar o trandparencia do string "game over"
global.dialogo = false;
// Inicializa as constelações no jogo
global.constelacao_atual = 0;
global.estrelas_coletadas = 0;

// Define uma lista de constelações com nomes e números totais de estrelas
global.constelacoes = [
    {nome: "Homem Velho", total: 6},
    {nome: "Anta do Norte", total: 10},
    {nome: "Veado", total: 8}
];