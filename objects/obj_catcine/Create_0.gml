/// @description Inicializa o sistema de diálogo
pode_desenhar = true;

// --- Variáveis de Controle ---
dialogos = [];
dialogo_atual = 0;
mostrando_dialogo = false;
proximo_dialogo = false;

// --- Variáveis do Efeito "Typewriter" ---
texto_atual = "";
indice = 0;
tempo_delay = 0;
velocidade_texto = 3;

// --- Variáveis de Controle do Jogador ---
count_space = 0;
exibe = false;

// --- Carrega os Diálogos Apropriados para a Sala ---
switch(room) {
    case rm_catcine:
        dialogos = [
            {texto: "No princípio de tudo, Nhanderu moldou a terra, as matas e os rios — e sobre tudo isso pôs o céu como teto e testemunha.", imagem: spr_catcine_1},
            {texto: "Para iluminar sua criação, trouxe Guaraci, o Sol, senhor do dia e do trabalho. E Jaci, a Lua, guardiã das marés, dos partos e das festas.", imagem: spr_catcine_2},
            {texto: "Guaraci e Jaci revezavam-se sem fim — e nesse revezamento, o povo aprendeu a medir o tempo da roça, da caça e da celebração.", imagem: spr_catcine_3},
            {texto: "Anhangá caminhava entre as matas como guardião dos animais. Não um espírito do mal — um espírito do equilíbrio, que punia quem quebrava a ordem da floresta.", imagem: spr_catcine_5},
            {texto: "Nas estrelas, Nhanderu desenhou os caminhos das constelações: o Homem-Velho, a Anta-Norte e o Veado. O céu era o calendário do povo.", imagem: spr_catcine_6},
            {texto: "Esses saberes orientavam Ka'tupytã — a aldeia protegida. Seus fundadores selaram a terra com um pacto antigo, erguendo uma redoma invisível sobre o território.", imagem: spr_catcine_7},
            {texto: "A redoma era obra de Yacy Porã — a Bela Lua, deusa das constelações e da memória astronômica. Ela escondia Ka'tupytã dos olhos que viessem com intenção de destruir.", imagem: spr_catcine_8},
            {texto: "Sob sua proteção, o povo vivia em terra coletiva, sem senhores, sem cercas. Caçavam, plantavam e celebravam. Eram guardiães da natureza e da memória.", imagem: spr_catcine_8_1},
            {texto: "Mas o equilíbrio foi testado. Homens vieram pelo mar — vindos de terras que o povo nunca havia pisado, carregando ferro, fogo e uma fome que não tinha nome.", imagem: spr_catcine_9},
            {texto: "O cacique Irapu e o guerreiro Mboré lideraram Ka'tupytã na Grande Barreira — a batalha que impediu os invasores de encontrar o caminho até a aldeia. Venceram. A redoma resistiu.", imagem: spr_catcine_10},
            {texto: "Irapu e Mboré voltaram como heróis. Cada um deixou um filho: Irapu, pai de Ayelen. Mboré, pai de Ubiratã. Filhos da mesma vitória, criados sob a mesma proteção.", imagem: spr_catcine_11},
            {texto: "Ayelen cresceu ouvindo as histórias da Grande Barreira. Aprendeu com as mães e os anciãos o sentido do coletivo, a responsabilidade com a terra e o respeito às constelações.", imagem: spr_catcine_12},
            {texto: "Ubiratã cresceu carregando o peso do pai herói. E quando Mboré morreu de uma doença trazida pelo vento dos invasores — uma morte sem batalha, sem glória — algo nele se quebrou.", imagem: spr_catcine_13},
            {texto: "Sem o pai, Ubiratã buscou nos espíritos das fronteiras uma resposta que a aldeia não lhe deu. E nas fronteiras da redoma, vozes antigas esperavam por alguém com dor suficiente para escutá-las.", imagem: spr_catcine_14_1},
            {texto: "Essas vozes prometiam poder. Prometiam que a morte do pai não ficaria sem resposta. Prometiam que, com as insígnias das constelações, qualquer homem poderia invocar o que Yacy Porã havia selado.", imagem: spr_catcine_15},
            {texto: "Ubiratã acreditou. Não por maldade — por luto. E o luto sem comunidade é a ferida que os espíritos das fronteiras sempre souberam encontrar.", imagem: spr_catcine_16},
            {texto: "Uma a uma, ele retirou as insígnias dos templos das constelações — o Homem-Velho, a Anta-Norte, o Veado. Cada insígnia removida petrificou um templo. A memória do povo foi se apagando.", imagem: spr_catcine_17},
            {texto: "Sem as insígnias, a redoma de Yacy Porã começou a enfraquecer. Ka'tupytã, que nunca havia sido encontrada, passou a ser visível. O perigo vindo do mar se aproximou.", imagem: spr_catcine_18},
            {texto: "Ayelen, filha do cacique Irapu, recebeu do conselho a missão: restaurar as insígnias, refazer a redoma e trazer Ubiratã de volta — antes que os invasores encontrassem o caminho.", imagem: spr_catcine_19}
        ];
        break;

    case rm_catcine_2:
        dialogos = [
            {texto: "Na noite do conselho, a fogueira ardia no centro da aldeia. Ayelen preparava-se para o ritual de passagem — não de guerreiro, mas de Ypy, a portadora da memória.", imagem: spr_cha_1},
            {texto: "Ypy era o nome dado àquelas escolhidas por Yacy Porã para carregar as insígnias em tempos de ruptura. Não era título de nascimento — era chamado. E Ayelen havia sido chamada.", imagem: spr_cha_2},
            {texto: "Ao sorver o chá da raiz de imburana — a planta que abre o olho que não está no rosto — seu corpo afundou e sua memória subiu.", imagem: spr_cha_2},
            {texto: "A fogueira mudou de cor. O som da aldeia sumiu. E no lugar do silêncio, uma presença tomou forma — não uma sombra, não uma luz. Uma voz que vinha de baixo da terra.", imagem: spr_cha_2},
            {texto: "Era Tupã Reko — a Guardiã do Pacto, sacerdotisa de Yacy Porã que havia selado a redoma na geração dos fundadores e permanecido entre os dois mundos para velar por ela.", imagem: spr_cha_3},
            {texto: "Não era jovem nem velha. Era antiga como a primeira constelação desenhada no céu — e falava com a voz de quem já viu o povo sobreviver a coisas piores do que essa.", imagem: spr_cha_3},
            {texto: "'Ayelen, filha de Irapu, filha desta terra-mãe. O pacto está se desfazendo. As insígnias foram removidas por mãos do nosso próprio sangue.'", imagem: spr_cha_4, palavra_chave: "Nhenderu", cor_chave: c_aqua},
            {texto: "'Ubiratã não é inimigo — é ferida. Mas ferida aberta envenena o corpo inteiro se não for tratada. E o corpo inteiro aqui é Ka'tupytã.'", imagem: spr_cha_4},
            {texto: "Ayelen perguntou: 'Por que eu? Há guerreiros mais fortes, anciãos mais sábios. Por que me escolheram?'", imagem: spr_cha_5},
            {texto: "'Porque as insígnias foram petrificadas pelo luto de Ubiratã — e só pode desfazer a petrificação quem carrega o vínculo oposto. Não a força. O pertencimento.'", imagem: spr_cha_5},
            {texto: "'Você cresceu dentro da aldeia, dentro da memória, dentro do coletivo. Seu vínculo com Yacy Porã não é de sangue — é de presença. Você nunca se afastou. Por isso a pedra responde a você.'", imagem: spr_cha_6},
            {texto: "'Ubiratã se afastou da comunidade antes de se afastar das insígnias. A petrificação é o reflexo disso — pedra é o que fica quando o vínculo vai embora.'", imagem: spr_cha_6},
            {texto: "'Você não pode simplesmente pegar as insígnias. Precisa refazer o vínculo em cada templo — lembrar ao lugar o que ele é, antes que a pedra esqueça completamente.'", imagem: spr_cha_6},
            {texto: "'Os espíritos das fronteiras que corromperam Ubiratã também guardam os templos agora. Eles não são monstros — são o que sobra quando a memória vai embora. Alimentam-se do esquecimento.'", imagem: spr_cha_222},
            {texto: "'E os homens do mar estão se aproximando. Cada dia sem a redoma é um dia que Ka'tupytã pode ser encontrada. Não há tempo para hesitação — mas há tempo para fazer certo.'", imagem: spr_cha_222},
            {texto: "A fogueira crepitou. Tupã Reko estendeu a mão e dela saiu a Estrela Petrificada — o fragmento da primeira insígnia, o núcleo do pacto original.", imagem: spr_cha_8},
            {texto: "'Esta pedra carrega a memória de Yacy Porã. Enquanto a segurar, os templos vão reconhecer sua presença. Ela não é arma — é chave. E só funciona nas mãos de quem pertence.'", imagem: spr_cha_8},
            {texto: "'Cada insígnia que restaurar vai reacender uma constelação. Cada constelação reacendida vai fortalecer a redoma. O Homem-Velho primeiro — ele é o mais antigo. Ele sustenta os outros.'", imagem: spr_cha_9},
            {texto: "'Mas Ayelen — quando encontrar Ubiratã, não o enfrente como inimiga. Ele precisa lembrar quem era antes da dor. Só o próprio Ubiratã pode desfazer o que fez. Você só pode abrir o caminho.'", imagem: spr_cha_9},
            {texto: "'Yacy Porã não escolhe guerreiras pela força dos braços. Escolhe pelo tamanho do vínculo. E o seu vínculo com esse povo, Ayelen, é o maior que já vi em muito tempo.'", imagem: spr_cha_10},
            {texto: "'Vá pelos templos. Restaure as insígnias. Refaça a redoma. E traga Ubiratã de volta — não como prisioneiro, mas como filho desta terra que ainda pode voltar a ser.'", imagem: spr_cha_10},
            {texto: "Ayelen sentiu o peso da Estrela Petrificada nas mãos — fria no começo, depois quente, depois com o pulso suave de algo muito antigo reconhecendo quem a segurava.", imagem: spr_cha_11},
            {texto: "'Irei pelos templos. Vou restaurar cada insígnia, cada constelação, cada pedaço da memória que foi apagado. E vou encontrar Ubiratã.'", imagem: spr_cha_12},
            {texto: "'Não como inimiga. Como parente. Como filha da mesma vitória que nos trouxe até aqui.'", imagem: spr_cha_12},
            {texto: "A presença de Tupã Reko se desfez como fumaça que o vento leva. A fogueira voltou à cor normal. A aldeia voltou ao som normal.", imagem: spr_cha_13},
            {texto: "Ayelen estava de pé, com a Estrela Petrificada na mão e os templos à sua frente. A jornada tinha nome, tinha forma e tinha urgência.", imagem: spr_cha_13}
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
