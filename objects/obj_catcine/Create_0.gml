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
    {texto: "No início, Tupã criou a vida, moldou a terra, os mares e os seres vivos.", imagem: spr_catcine_1},
    {texto: "Para iluminar sua criação, Tupã deu origem a Guaraci, o deus Sol, e Jaci, a deusa Lua.", imagem: spr_catcine_2},
    {texto: "Guaraci e Jaci revezavam-se no céu, mantendo o ciclo eterno de dia e noite.", imagem: spr_catcine_3},
    {texto: "Tupã criou Anhangá para proteger a natureza, guardião dos animais e florestas.", imagem: spr_catcine_5},
    {texto: "Em meio a este equilíbrio, Bianca, Deusa das Constelações, observava os povos da Terra.", imagem: spr_catcine_6},
    {texto: "Ao encontrar a aldeia de Katupytã, abençoou o povo", imagem: spr_catcine_7},
	{texto:" e instruiu a construção de três templos: Homem-Velho, Anta-Norte e Veado.", imagem: spr_catcine_8},
	{texto:" Criando um veu de invisibilidade e proteção", imagem: spr_catcine_8_1},
    {texto: "Nos tempos antigos, os videntes previram que em eras de caos surgiriam dois espíritos, filhos do céu, para definir o destino do mundo.", imagem: spr_catcine_9},
    {texto: "Eles seriam diferentes, mas complementares, e viriam com os Angá-mirim despertos.", imagem: spr_catcine_10},
    {texto: "Assim nasceram Ayelen e Ubiratã. Ela com os Angá-mirim de cima, ele com os de baixo.", imagem: spr_catcine_11},
    {texto: "Ayelen treinou também os de baixo, tornando-se forte e destemida, completa em espírito e corpo.", imagem: spr_catcine_12},
    {texto: "Ubiratã, por sua vez, não desenvolveu compaixão nem luz, e seu coração permaneceu endurecido.", imagem: spr_catcine_13},
    {texto: "A harmonia da vila se quebrou quando o pai de Ubiratã comandante, movido por luxúria e ego, matou o tio de Ayelen em uma revolta pelo poder ", imagem: spr_catcine_14_1},
    {texto: "O comandante do exército formou aliados e tentou tomar o poder, mas foi derrotado pelo pai de Ayelen.", imagem: spr_catcine_15},
    {texto: "Ubiratã, tomado pelo ódio e ressentimento, exilou-se, carregando fúria contra a vila.", imagem:spr_catcine_16 },
	{texto: "Sozinho, ele roubou as insígnias sagradas dos templos, desfazendo o véu de proteção invisível que mantinha a aldeia segura.", imagem: spr_catcine_17},
    {texto: "Enquanto isso, rumores de invasões de povos em nome de um deus desconhecido se aproximavam, ameaçando a aldeia desprotegida.", imagem: spr_catcine_18},
    {texto: "Ayelen, filha do líder da vila, viu seu amigo de infância se tornar inimigo, dividida entre amor e dever recebeu o dom da cura e de depretrificar a mágia de ubiratã.", imagem: spr_catcine_19}
    
];

        break;
        
    case rm_catcine_2:
        dialogos = [
    {texto: "Em uma noite enluarada, Ayelen se preparava para o ritual sagrado.", imagem: spr_cha_1},
    {texto: "Ela seguia os ensinamentos antigos da teko'a, com o coração tranquilo.", imagem: spr_cha_2},
    {texto: "Ao beber o chá, seus sentidos se expandiram.", imagem: spr_cha_2},
    {texto: "Luzes e cores dançavam ao seu redor como constelações vivas.", imagem: spr_cha_2},
    {texto: "Uma presença tomou conta da sala. Araci, a mãe do dia, apareceu.", imagem: spr_cha_3},
    {texto: "Seus olhos refletiam a vastidão do céu, brilhando com mistério.", imagem: spr_cha_3},
    {texto: "'Ayelen, filha da luz, o destino da teko'a repousa em suas mãos.'", imagem: spr_cha_4, palavra_chave: "Angá-mirim", cor_chave: c_aqua},
    {texto: "'Você carrega os Angá-mirim, os sete pontos de força.'", imagem: spr_cha_4},
    {texto: "Ayelen, assustada, perguntou: 'Como posso restaurar o que foi roubado?'", imagem: spr_cha_5},
    {texto: "'Sou apenas uma guerreira da aldeia.'", imagem: spr_cha_5},
    {texto: "Araci respondeu: 'Você não é apenas uma guerreira.'", imagem: spr_cha_6},
    {texto: "'Você é a ponte entre o mundo visível e o invisível.'", imagem: spr_cha_6},
    {texto: "'Sua força está na harmonia dos elementos que habitam seu ser.'", imagem: spr_cha_6},
    {texto: "'Quando equilibrar esses elementos, poderá recuperar as insígnias.'", imagem: spr_cha_222},
    {texto: "'E proteger a teko'a do caos que se aproxima.'", imagem: spr_cha_222},
    {texto: "A fogueira brilhou intensamente. Uma onda de energia percorreu Ayelen.", imagem: spr_cha_8},
    {texto: "Seus Angá-mirim começaram a pulsar com luz própria.", imagem: spr_cha_8},
    {texto: "Araci estendeu uma pedra luminosa: 'Esta pedra guarda a essência dos Angá-mirim.'", imagem: spr_cha_9},
    {texto: "'Ela guiará seus passos e iluminará sua jornada.'", imagem: spr_cha_9},
    {texto: "'Lembre-se, a verdadeira força não está no corpo,'", imagem: spr_cha_10},
    {texto: "'mas na união de espírito, mente e elementos da vida.'", imagem: spr_cha_10},
    {texto: "Ayelen sentiu sua mente clarear, percebendo seu papel crucial.", imagem: spr_cha_11},
    {texto: "'Irei. Trazer paz e harmonia à teko'a é minha missão.'", imagem: spr_cha_12},
    {texto: "'Serei a portadora da luz.'", imagem: spr_cha_12},
    {texto: "Araci sorriu e se desvaneceu. Ayelen despertou do transe com a pedra em mãos.", imagem: spr_cha_13},
    {texto: "Ela estava pronta para iniciar a jornada que mudaria seu destino.", imagem: spr_cha_13}
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
