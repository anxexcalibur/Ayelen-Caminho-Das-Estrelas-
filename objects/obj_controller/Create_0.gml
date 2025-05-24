 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.checkpoint_states = [];
// Evento Create
global.estrelas_coletadas = 0;

// Constelações e estrelas
global.constelacoes = [
    {nome: "Homem Velho", total: 6, coletadas: 0},
    {nome: "Anta do Norte", total: 10, coletadas: 0},
    {nome: "Veado", total: 8, coletadas: 0}
];
global.estrelas = [
    {id: 1, nome: "Aldebaran", constelacao: "Homem Velho"},
    {id: 2, nome: "Betelgeuse", constelacao: "Homem Velho"},
    {id: 3, nome: "Bellatrix", constelacao: "Homem Velho"},
    {id: 4, nome: "Meissa", constelacao: "Homem Velho"},
    {id: 5, nome: "Saiph", constelacao: "Homem Velho"},
    {id: 6, nome: "Rigel", constelacao: "Homem Velho"},
    {id: 7, nome: "Dubhe", constelacao: "Anta do Norte"},
    {id: 8, nome: "Merak", constelacao: "Anta do Norte"},
    {id: 9, nome: "Phecda", constelacao: "Anta do Norte"},
    {id: 10, nome: "Megrez", constelacao: "Anta do Norte"},
    {id: 11, nome: "Alioth", constelacao: "Anta do Norte"},
    {id: 12, nome: "Mizar", constelacao: "Anta do Norte"},
    {id: 13, nome: "Alkaid", constelacao: "Anta do Norte"},
    {id: 14, nome: "Theta Ursae Majoris", constelacao: "Anta do Norte"},
    {id: 15, nome: "Iota Ursae Majoris", constelacao: "Anta do Norte"},
    {id: 16, nome: "Kappa Ursae Majoris", constelacao: "Anta do Norte"},
    {id: 17, nome: "Arneb", constelacao: "Veado"},
    {id: 18, nome: "Nihal", constelacao: "Veado"},
    {id: 19, nome: "Gamma Leporis", constelacao: "Veado"},
    {id: 20, nome: "Delta Leporis", constelacao: "Veado"},
    {id: 21, nome: "Epsilon Leporis", constelacao: "Veado"},
    {id: 22, nome: "Zeta Leporis", constelacao: "Veado"},
    {id: 23, nome: "Eta Leporis", constelacao: "Veado"},
    {id: 24, nome: "Iota Leporis", constelacao: "Veado"},
    {id: 25, nome: "Kappa Leporis", constelacao: "Veado"},
    {id: 26, nome: "Lambda Leporis", constelacao: "Veado"},
    {id: 27, nome: "Mu Leporis", constelacao: "Veado"},
    {id: 28, nome: "Nu Leporis", constelacao: "Veado"},
    {id: 29, nome: "Xi Leporis", constelacao: "Veado"},
    {id: 30, nome: "Omicron Leporis", constelacao: "Veado"},
    {id: 31, nome: "Pi Leporis", constelacao: "Veado"},
    {id: 32, nome: "Rho Leporis", constelacao: "Veado"},
    {id: 33, nome: "Sigma Leporis", constelacao: "Veado"},
    {id: 34, nome: "Tau Leporis", constelacao: "Veado"},
    {id: 35, nome: "Upsilon Leporis", constelacao: "Veado"},
    {id: 36, nome: "Phi Leporis", constelacao: "Veado"},
    {id: 37, nome: "Chi Leporis", constelacao: "Veado"},
    {id: 38, nome: "Psi Leporis", constelacao: "Veado"},
    {id: 39, nome: "Omega Leporis", constelacao: "Veado"},
    {id: 40, nome: "Phaedrus", constelacao: "Veado"}
];
// Carrega progresso  estrela salvo

carregar_progresso();
if (!variable_global_exists("itens_coletados")) {
    global.itens_coletados = ds_map_create();
}


game_over = false;
valor = 0;// variavel que serve para animar o retangulo 
contador = 0  //cariavel para controlar o trandparencia do string "game over"
global.dialogo = false;

som_tocou = false; // Variável para controlar a reprodução do som


function carregar_itens() {
    global.itens_coletados = ds_map_create();

    if (file_exists("_itens.ini")) {
        ini_open("_itens.ini");

        var chaves = ini_section_get_keys(global.nome_jogador);
        var total = array_length(chaves);

        for (var i = 0; i < total; i++) {
            var chave = chaves[i];
            var valor = ini_read_bool(global.nome_jogador, chave, false);

            if (valor) {
                ds_map_set(global.itens_coletados, chave, true);
            }
        }

        ini_close();
    }
}
