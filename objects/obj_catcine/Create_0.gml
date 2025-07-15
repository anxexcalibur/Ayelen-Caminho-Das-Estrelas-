/// @description Inicializa o sistema de diálogo
pode_desenhar =true
// --- Variáveis de Controle ---
dialogos = [];               // Array que guarda os diálogos da sala
dialogo_atual = 0;           // Índice do diálogo atual
mostrando_dialogo = false;       // Controla se a cutscene está ativa
proximo_dialogo = false;     // Gatilho para avançar para o próximo texto

// --- Variáveis do Efeito "Typewriter" (texto aparecendo) ---
texto_atual = "";            // O texto que é exibido na tela
indice = 0;                  // Posição do caractere atual
tempo_delay = 0;             // Timer para o delay entre letras
velocidade_texto = 3;        // Mais fácil de ajustar aqui. Quanto menor, mais rápido.

// --- Variáveis de Controle do Jogador ---
count_space = 0;             // Sua variável para contar os espaços
exibe = false;               // Sua variável para a mensagem "Esc"

// --- Carrega os Diálogos Apropriados para a Sala ---
// Fazer isso no Create é mais eficiente do que no Step
switch(room) {
    case rm_catcine:
        dialogos = [
            {texto: "No crepúsculo dos primórdios, onde o tempo dançava em nebulosas incertezas", imagem: spr_2},
            {texto: "Tupã, o grande criador, desceu dos céus em meio a relâmpagos e trovões, conferindo vida ao infinito.", imagem: spr_2, palavra_chave: "Tupã", cor_chave: c_yellow}, // Exemplo de efeito
            {texto: "Com seu toque divino, moldou a beleza e a perfeição, criando a terra, os mares, as florestas e todos os seres vivos que habitam o mundo.", imagem: spr_3},
            {texto: "Para iluminar sua criação, Tupã criou Guaraci, o deus Sol, que trouxe luz e calor ao dia, e Jaci, a deusa Lua, que trouxe suavidade e encanto às noites.", imagem: spr_4},
            {texto: "Guaraci e Jaci, irmãos e amantes, revezavam-se no céu, garantindo o ciclo eterno de dia e noite.", imagem: spr_4_1},
            {texto: "Contudo, para manter o equilíbrio, Tupã criou Anhangá, espírito protetor dos animais e florestas.", imagem: spr_5},
            {texto: "Anhangá pode assumir diversas formas para enganar os caçadores, e embora temido pelos humanos, fazia parte do equilíbrio necessário.", imagem: spr_6},
            {texto: "Em meio a esse equilíbrio, surgiu uma deusa chamada Bianca, Deusa das constelações, uma das criações de Tupã.", imagem: spr_8},
            {texto: "Seus olhos celestiais encontraram a vila guerreira de Katupytã, onde a harmonia reinava e a natureza era reverenciada.", imagem: spr_9},
            {texto: "Impressionada pela devoção daquela comunidade, Bianca desceu dos céus em uma noite enluarada, trazendo bênçãos aos guerreiros que prometeram proteger a harmonia.", imagem: spr_10},
            {texto: "Bianca instruiu os habitantes a construírem três templos, representando as constelações sob seu domínio:", imagem: spr_11},
            {texto: "Homem-Velho, Anta-Norte e Veado.", imagem: spr_12},
            {texto: "Esses templos sagrados garantiram a proteção de Katupytã por gerações, enquanto a sabedoria dos ancestrais era passada de geração em geração.", imagem: spr_12},
            {texto: "Entretanto, forças sombrias conspiravam. Jurupari, um espírito que visitava os sonhos, trazendo pesadelos e presságios...", imagem: spr_16},
            {texto: "Aproveitando-se das fraquezas humanas, Jurupari semeou discórdia e corrupção entre os habitantes de Katupytã.", imagem: spr_17},
            {texto: "Ubiratã, um guerreiro outrora respeitado, sucumbiu à ganância e aos sussurros de Jurupari, desviando-se do caminho da luz.", imagem: spr_18},
            {texto: "Influenciado por promessas de poder, ele roubou as sagradas insígnias do templo de Bianca...", imagem: spr_19},
            {texto: "...deixando a vila vulnerável a invasores estrangeiros que buscavam dominar aquelas terras em nome de deuses desconhecidos.", imagem: spr_19},
            {texto: "Desesperados, os anciãos da vila recorreram a antigas profecias que falavam de uma guerreira iluminada, guiada pela Estrela Dalva.", imagem: spr_21},
            {texto: "Nascida sob a proteção de Bianca, ela veio ao mundo com os Angá-mirim despertos, os sete pontos de força que conectam o corpo, a alma e o espírito.", imagem: spr_22},
            {texto: "Com a terra firmando seus passos, a água guiando suas emoções, o fogo ardendo em sua coragem, e o ar dando voz ao seu destino...", imagem: spr_23},
            {texto: "...ela traria um novo amanhecer onde a harmonia triunfaria sobre o caos.", imagem: spr_dialogoimage},
        ];
        break;
        
    case rm_catcine_2:
        dialogos = [
            {texto: "Em uma noite enluarada, Ayelen se preparava para o ritual sagrado com o chá de ayahuasca, como os anciãos da vila lhe haviam instruído.", imagem: spr_cha_1},
            {texto: "Ao beber o chá, seus sentidos começaram a se expandir. O ar ao seu redor se tornava vibrante, cheio de luzes que dançavam como estrelas cadentes.", imagem:  spr_cha_2},
            {texto: "Foi quando uma presença tomou conta da sala. Araci, a mãe do dia, manifestou-se, e seus olhos refletiam estrelas distantes.", imagem:  spr_cha_3},
            {texto: "'Ayelen, filha da luz, você é chamada para uma missão. Você carrega dentro de si os Angá-mirim, os sete pontos de força.'", imagem: spr_cha_4, palavra_chave: "Angá-mirim", cor_chave: c_aqua}, // Exemplo de efeito
            {texto: "Ayelen, ainda atordoada, questionou: 'Mas... como posso ser eu a restaurar o que foi roubado? Sou apenas uma guerreira.'", imagem: spr_cha_5},
            {texto: "Araci sorriu: 'Você não é apenas uma guerreira, Ayelen. Você é a ponte entre os mundos. Sua força reside na harmonia dos elementos dentro de si.'", imagem: spr_cha_6},
            {texto: "'Quando você harmonizar esses elementos, será capaz de restaurar as insígnias e trazer o equilíbrio ao seu mundo.'", imagem: spr_cha_222},
            {texto: "A fogueira brilhou intensamente. Ayelen sentiu uma onda de energia percorrer seu corpo, e os Angá-mirim dentro dela começaram a brilhar.", imagem: spr_cha_8},
            {texto: "Araci então estendeu uma pedra luminosa: 'Esta pedra contém a essência dos Angá-mirim. Carregue-a, e ela será seu guia.'", imagem: spr_cha_9},
            {texto: "'Lembre-se, a verdadeira força não está no corpo, mas na harmonia entre seu espírito e os elementos que residem em seu ser.'", imagem: spr_cha_10},
            {texto: "Ayelen, agora ciente de seu poder e de seu papel crucial, sentiu sua mente clarear.", imagem: spr_cha_11},
            {texto: "'Eu irei. A paz e a harmonia precisam retornar, e eu serei a portadora dessa luz.'", imagem: spr_cha_12},
            {texto: "Araci sorriu uma última vez, e sua presença se dissipou. Ayelen despertou do transe, com a pedra em mãos e a certeza de que a jornada estava prestes a começar.", imagem: spr_cha_13}
        ];
        break;
}

// --- Inicia o Primeiro Diálogo ---
if (array_length(dialogos) > 0) {
    mostrando_dialogo = true;
    imagem_dialogo = dialogos[0].imagem; // Pega a imagem do primeiro diálogo
} else {
    instance_destroy(); // Se não houver diálogos para esta sala, se autodestrói
}
