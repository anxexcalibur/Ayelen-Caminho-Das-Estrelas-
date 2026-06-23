function scr_textos(){

    switch (npc_nome) {

        case "Piata":
            switch (obj_pai.estado_npc) {
                case 0:
                    ds_grid_add_text("btc", spr_piata_rosto, 0, "Piatã");
                    obj_player.etapa_historia = 1;
                break;

                case 1:
                    ds_grid_add_text("Ayelen. Meu corpo é velho, mas a voz ainda pesa. Escute.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("As estrelas me puxam toda noite. O tempo encolheu. E o que falta fazer... é muito.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Pai, a vila virou cinza. Os rios tão com gosto de morte. O povo treme. Não sei se aguento isso sozinha.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ka'tupytã sangra. E parte do sangue é de quem devia proteger. Ubiratã abriu a porta.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Ele é nosso, pai. Perdido, mas nosso. Dá pra trazer de volta?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Dá. Mas não com pena — com verdade. Eles usaram o paternalismo contra nós. Não vamos fazer igual com os nossos. Ele precisa enxergar, não ser levado pela mão.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("E as insígnias? Sem elas, o povo não lê o céu. Perde a roça, a festa, a cura.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Por isso você vai, filha. O céu tá mudo sobre Ka'tupytã. Você vai devolver a memória que arrancaram.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Faz o ritual. Escuta os antigos. E lembra: você não vai só — você carrega 500 anos de luta nas costas.", spr_piata_rosto, 0, "Piatã");
                    obj_player.etapa_historia++;
                break;

                case 2:
                    ds_grid_add_text("Consciência sem ação é peso morto. Saber ancestral que não vira luta é cinza na memória. Usa, filha.", spr_piata_rosto, 0, "Piatã");
                break;

                case 3:
                    ds_grid_add_text("Faz o ritual, Ayelen. O povo espera. A terra também.", spr_piata_rosto, 0, "Piatã");
                break;

                case 4:
                    ds_grid_add_text("O caminho é escuro — mas escuridão nenhuma apagou quem tem fogo dentro. Os antigos chamam de Coração da Noite.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Lá tão as respostas que a história oficial enterrou. Quem somos. O que roubaram. O que ainda dá pra pegar de volta.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Coração da Noite... já no nome tem aviso. O que vou encontrar lá, pai?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Você mesma. A parte que o colonizador tentou matar junto com a língua, o ritual, a terra. Muitos chegaram. Poucos voltaram inteiros.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Então o que me protege?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("O coletivo. Ubiratã perdeu isso — por isso a sombra dele consome tudo. Você não perdeu. É a diferença.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("E se eu cair? Você tá doente, pai. Quem cuida de Ka'tupytã?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ka'tupytã se vira. Sempre se virou — antes do capitão, do diretor de índios, da FUNAI. O conselho tá de pé até hoje.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Mas Ubiratã... dizem que ele corrompeu guerreiros. Que o veneno dele espalha.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("É o veneno do individualismo. O mesmo que a cidade usa há 500 anos: dinheiro, poder, a promessa de ser alguém.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("E eu sou imune?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Você cresceu na aldeia. Na solidariedade. Na terra que não é de ninguém. Isso não compra. E não corrompe fácil.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Se eu falhar, pai?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Então Ka'tupytã perde mais uma batalha numa guerra de 500 anos. Mas essa guerra nunca terminou com uma derrota. E não vai terminar agora.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Não vou deixar. Não enquanto eu puder lutar.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Então vai, filha. Pé no chão, olho no horizonte. A esperança inteira de Ka'tupytã anda com você.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Vou buscar as insígnias. Vou enfrentar o Ubiratã. Pela aldeia, pela terra, por quem veio antes e quem ainda vem.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Que Nhanderu clareie cada passo. E lembra: mente organizada vence qualquer arma que eles tenham.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Procura Poiarã. As mãos dele sabem o que você precisa carregar. Ele te dá o que falta.", spr_piata_rosto, 0, "Piatã");
                    obj_player.etapa_historia++;
                break;

                case 5:
                    ds_grid_add_text("Pai... o peso. Parece que o céu inteiro caiu num ombro só. E se eu não for suficiente?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Nenhum guerreiro carrega sozinho. Se o peso é de um, é porque o coletivo ainda não se mexeu. Organiza o povo e o peso se divide.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("E o medo? Isso não passa.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Medo é honesto. É o corpo dizendo que o jogo é real. Quem não sente medo não entende o perigo. Sente — e vai assim mesmo.", spr_piata_rosto, 0, "Piatã");
                break;

                case 6:
                    ds_grid_add_text("Ka'tupytã não precisa da Ayelen perfeita. Precisa da Ayelen de verdade — que tropeça e levanta, que duvida e age.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("Não me sinto pronta, pai.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Guerreiro nenhum se sente pronto na véspera. Prontidão vem no caminho, não antes.", spr_piata_rosto, 0, "Piatã");
                    ds_grid_add_text("...", spr_ayelen_face, 1, "Ayelen");
                break;
            }
        break;

        case "Ancianemimby":
            switch (obj_nemimby_orientadora.estado_npc) {
                case 0:{
                    ds_grid_add_text("Encontra seu pai, Ayelen. Ele tem o que dizer.", spr_xama_rosto, 0, "Nemimby");
                break;
                }
                case 1:{
                    ds_grid_add_text("Seu pai espera. Vai.", spr_xama_rosto, 0, "Nemimby");
                break;
                }
                case 2:
                    ds_grid_add_text("Sente esse vento? Não é vento. São ossos coçando. Os antigos tão se remexendo — e não é por saudade.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Tô pronta, Nemimby. Fala o que precisa.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Primeiro, silêncio. Não o silêncio de quem tem medo — o de quem escuta. A floresta fala. Você parou de ouvir quando a cidade entrou na aldeia.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Tô ouvindo. Sinto o chão diferente hoje.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Bom. Agora oferece tua intenção. Ancestral não ouve quem fala pela garganta — ouve quem fala pelo ventre, pelo sangue, pela convicção.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Minha intenção é clara: entender o que foi destruído e o que ainda dá pra salvar. Saber como lutar sem perder quem sou.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Então segura firme. O ritual começa. O que você vai ver não é ilusão — é memória. A nossa. A que a história oficial enterrou.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Vai pra fogueira. Bebe o chá. Conhecimento tradicional não se aprende em livro — se bebe, se vive, se incorpora.", spr_xama_rosto, 0, "Nemimby");
                    obj_player.etapa_historia++;
                break;

                case 3:
                    ds_grid_add_text("O que vem é pesado, Ayelen — mas pesado que nem terra de roça. Não que nem corrente.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Os antigos chamam de Coração da Noite o lugar onde a gente guardou o que não podia dizer em voz alta por 500 anos. Lá tão as respostas.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("E o que eu encontro nessas respostas?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("A verdade sobre quem somos. Não o que portugueses escreveram. Não o que a FUNAI registrou. O que nós mesmos sabemos.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Pra chegar lá, preciso das insígnias. E elas estão guardadas.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Precisa dos Olhos de Tupã. Pedras sagradas espalhadas pela floresta antiga. Sentinelas de madeira protegem — Espíritos das Raízes.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Eles não lutam. Eles testam. Se quem vem tem paciência, respeito, consciência de que a floresta não é de ninguém.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("E se eu falhar no teste?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("As raízes fecham. O tempo se perde. A memória continua enterrada. Mas você não vai falhar — porque você sabe o que está em jogo.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Vou encontrar os Olhos de Tupã. Vou abrir o Coração da Noite. Vou trazer de volta o que roubaram de Ka'tupytã.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Céu e terra estão com você, Ayelen. Escuta a floresta — ela conhece caminho que mapa nenhum registrou.", spr_xama_rosto, 0, "Nemimby");
                    obj_player.etapa_historia++;
                break;

                case 4:
                case 5:
                    ds_grid_add_text("Chegou a hora, Ayelen. Não tem mais preparo — só caminho.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("O mundo lá fora é armadilha. Mas também tem aliado que ainda não apareceu. Confia no processo coletivo.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Você nunca tá sozinha. Atrás de você: 500 anos de resistência. Na frente: demarcação, dignidade, memória.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Quando a dúvida apertar — e vai apertar — lembra do que é sagrado: a terra. O coletivo. A vida sem tutela.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Que os ancestrais clareiem cada passo. E que a gente se encontre de novo numa Ka'tupytã de pé.", spr_xama_rosto, 0, "Nemimby");
                break;

                case 6:
                    ds_grid_add_text("Ayelen. Ainda aqui? O tempo não espera. Ka'tupytã, muito menos.", spr_xama_rosto, 0, "Nemimby");
                    ds_grid_add_text("Anda. O povo precisa de ação, não de hesitação.", spr_xama_rosto, 0, "Nemimby");
                break;
            }
        break;

        case "Poiara":
            switch(obj_player.etapa_historia){
                case 1:
                case 2:
                case 3:
                case 4: {
                    ds_grid_add_text("Ayelen. Seu pai chamou. Não demora.", spr_rosto_npc_artesao, 0, "Poiarã");
                break;
                }
                case 5: {
                    ds_grid_add_text("Ayelen. Seu pai falou da missão. Senta aqui.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("Eu faço objeto com as mãos. Mas objeto feito à mão carrega intenção. Esse escudo é pensado em você.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("O que vem pela frente não é luta de corpo só — é luta de consciência. E consciência sem proteção gasta antes da hora.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("Leva o Escudo Verde. Não é arma de ataque — é arma de persistência. Ele devolve energia quando você precisar continuar.", spr_escudo, 0, "Poiarã");
                    ds_grid_add_text("Usa com juízo. Não é infinito — como toda proteção coletiva, tem limite se ninguém cuidar.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("Mas no momento certo, ativado com clareza, pode ser a diferença entre cair e seguir de pé.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("Vai, Ayelen. Ka'tupytã espera.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("Sistema: Pressione K para ativar o escudo.", spr_sistema, 0, "Sistema");
                    obj_player.etapa_historia = 6;
                break;
                }
                case 6: {
                    ds_grid_add_text("Cada passo na terra ensina o que escola nenhuma dá. Presta atenção no chão — ele fala.", spr_rosto_npc_artesao, 0, "Poiarã");
                    ds_grid_add_text("As árvores também têm memória. Quando passar, escuta.", spr_rosto_npc_artesao, 0, "Poiarã");
                break;
                }
            }
        break;

        case "kaua":
            switch(obj_player.etapa_historia){
                case 8: {
                    ds_grid_add_text("Você encontra um guerreiro atrás dum arbusto — exausto, lama até o joelho, o olhar de quem viu coisa que não devia.", spr_sistema, 0, "Narrador");
                    ds_grid_add_text("Ei! Você é de Ka'tupytã? Ouvi dizer que mandaram alguém... não esperava que fosse... enfim. Ainda bem que veio.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Sou eu. A aldeia mandou. Você é da Vila do Sol? O que aconteceu aqui é o que eu tô pensando?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Pior. O Caído usou as insígnias pra invocar uma besta do fundo. Nossos guerreiros não tavam preparados — ninguém tava. Maioria fugiu pro sul.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("A besta ainda tá aqui?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Nas grutas. O xamã conseguiu selar a entrada — mas a chave... eu derrubei correndo. Tá ali na frente. Não consigo voltar.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Entendi. Vou pegar a chave, entrar na gruta, recuperar as insígnias e garantir que essa besta não vire arma de novo.", spr_ayelen_face, 1, "Ayelen");
                    obj_player.etapa_historia = 9;
                break;
                }
                case 9: {
                    ds_grid_add_text("Ayelen... já pensou por que isso tudo aconteceu? Não tô falando de destino. Tô falando de causa.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Tô pensando nisso desde que saí de Ka'tupytã. O Caído não surgiu do nada — algo empurrou ele.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Na minha aldeia, os velhos dizem: a Terra, os espíritos e a gente somos um corpo só. Quando uma parte adoece, as outras sentem.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("O vinhoto que matou os rios não matou só a água — matou a relação do povo com a terra. Quem perde isso, perde o chão debaixo do pé.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Então a besta não é a causa — é o sintoma. A causa é o esbulho. A invasão. O veneno. A promessa falsa de que a cidade tem coisa melhor pra dar.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Exato. O que a gente chama de Nhandereko — nosso jeito de ser — quando é destruído de fora, às vezes a destruição continua de dentro.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("O Caído não é um monstro. É alguém que perdeu o Nhandereko e ficou com o vazio.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Então a missão não é só derrotar — é curar. Curar a terra, curar o povo, curar o que a invasão quebrou.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("É isso. E isso é mais difícil do que qualquer luta armada — porque exige olhar pro que falhou na gente também.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Você tá dizendo que a gente falhou com ele. Com o Ubiratã.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Não só ele. A comunidade falhou. Quando alguém se perde no caminho da acumulação e do individualismo, é porque não achou força suficiente no coletivo pra ficar.", spr_kaua_guarda, 0, "Kauã");
                    ds_grid_add_text("Duro de ouvir. Mas é verdade.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Vai com isso no peito, Ayelen. Não como culpa — como compromisso. Cuida de você também.", spr_kaua_guarda, 0, "Kauã");
                break;
                }
            }
        break;

        case "azel":
            ds_grid_add_text("Você? Eles mandaram você pra cá? Os velhos perderam o juízo de vez...", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("A situação é tão grave assim?", spr_ayelen_face, 1, "Ayelen");
            ds_grid_add_text("Grave? Tem um monstro acordado que devorou metade dos meus guerreiros. Grave é pouco.", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Eu sei o que eu vou enfrentar. Tô com medo — não vou mentir. Mas não posso correr. Me escolheram por alguma razão que eu ainda tô tentando entender.", spr_ayelen_face, 1, "Ayelen");
            ds_grid_add_text("Tá. Respeito isso. Pega aqui — vou botar uma magia na sua lança. Sem isso, você não arranha essa coisa.", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Sistema: Projétil desbloqueado. Pressione H para atirar.", spr_sistema, 0, "Sistema");
        break;

        case "arbusto":
            ds_grid_add_text("Sistema: A pêra-do-cerrado (Eugenia klotzschiana) cresce nos campos e cerrados do Brasil central. O nome indígena é cabamixá-açú — 'erva que dá fruto que aperta a língua'. Conhecida antes de qualquer botânico europeu chegar aqui.", spr_sistema, 0, "Sistema");
        break;

        case "ceramica":
            ds_grid_add_text("Sistema: Os povos indígenas foram os primeiros ceramistas desse território. Muito antes de 1500, já dominavam técnicas com argila, fibra vegetal e pigmento orgânico.", spr_sistema, 0, "Sistema");
            ds_grid_add_text("Sistema: Faziam vasilha pra guardar comida, cozinhar, levar água, fazer ritual. Cerâmica não era ferramenta — era linguagem. Cada traço contava cosmologia, história, identidade.", spr_sistema, 0, "Sistema");
            ds_grid_add_text("Sistema: Essa tecnologia existia aqui. Foi criada aqui. É desse povo.", spr_sistema, 0, "Sistema");
        break;

        case "estatua_bianca":
            ds_grid_add_text("Sistema: Estátua da matriarca — guardiã das estrelas e das constelações que guiam Ka'tupytã.", spr_sistema, 0, "Sistema");
            ds_grid_add_text("Sistema: Pros Tupi-Guarani, figura e estátua não eram decoração — eram presença. Representavam entidade, ancestral, força da natureza que continua agindo.", spr_sistema, 0, "Sistema");
            ds_grid_add_text("Sistema: Era proteção, marca de território, elo entre o visível e o invisível. A colonização chamou de idolatria. O povo chamava de memória.", spr_sistema, 0, "Sistema");
        break;

        case "Ayran":
            switch(obj_player.etapa_historia){
                case 6:
                    obj_guarda.alarm[0] = 1;
                    ds_grid_add_text("Ayran: Finalmente alguém que presta. Olha o que consegui arrancar dele antes de cair — quer dizer, antes de eu sofrer uma desaceleração súbita não planejada.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Isso é o quê?", spr_ayelen_face, 0, "Ayelen");
                    ds_grid_add_text("Ayran: Uma estrela petrificada. Dizem que guarda memória de constelação — eu acho que guarda peso, porque quase me derrubou no bolso.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayran: Ah, Ayelen! Bom dia. Que bom que alguém aqui leva esses relatos a sério.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Eu ouvi a versão em que você tropeçou na própria lança. Duas vezes.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Primeiro: foi ELE quem tropeçou. Segundo: foram duas circunstâncias distintas que coincidiram com o meu chão. Terceiro: perdi o fio da meada nessa defesa.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Conta o que houve com o Ubiratã.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Luta memorável. Pra ele. Eu contribuí com uma estratégia de recuperação horizontal no terreno — mas antes disso, juro que ele perdeu uns dentes.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Você desmaiou.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: 'Recuperação emergencial em posição supina' é o termo correto. E ele fugiu! Então, no mínimo, empate técnico.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: E pra onde ele foi depois?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Vila do Sul. Mas a Vila do Sul... já era. Os invasores passaram por lá como o vinhoto passou pelos rios — deixando só silêncio.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Mais um povo destruído. Mais terra tomada.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Nem o decoro dum discurso de justificativa eles tiveram. Chegaram e destruíram. Igual sempre.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: E esse artefato — você tirou dele na luta?", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Ele segurava e eu... realizei uma redistribuição estratégica de posse no calor da batalha.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Você roubou.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: 'Roubou' é uma palavra muito colonial pro que aconteceu. Prefiro: recuperei um bem de origem cultural em situação de conflito.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Hahaha. Tá bom. Mas isso aqui é importante — é uma das insígnias. Vou guardar com cuidado.", spr_ayelen_face, 0, "Ayelen");
                    ds_grid_add_text("Ayran: É. E se perder, vai ter que me ouvir contar a história de como eu quase morri pra conseguir ela mais três vezes.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Incentivo suficiente pra não perder. Valeu, Ayran. De verdade.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Vai com tudo, Ayelen. Mostra pra eles que Ka'tupytã não acabou — e nunca vai acabar.", spr_rosto_guarda, 0, "Ayran");
                    obj_player.etapa_historia = 7;
                break;

                case 7:
                    ds_grid_add_text("Ayran: Sabe qual é o problema de ter medo perto do rio? O medo chega primeiro que você. As piranhas daqui devoram ele antes de você botar o pé na água.", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Isso não faz sentido nenhum.", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Faz sentido sim. Você nunca viu uma piranha assustada, pois não?", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: ...", spr_ayelen_face, 1, "Ayelen");
                    ds_grid_add_text("Ayran: Pois é. Tô coberto de razão. Cientificamente.", spr_rosto_guarda, 0, "Ayran");
                break;

                case 8:
                    ds_grid_add_text("Ayran: Por que a piranha nunca perde uma discussão?", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Não sei. Por quê?", spr_ayelen_face, 0, "Ayelen");
                    ds_grid_add_text("Ayran: Porque ela sempre tem o último argumento na boca. Hahaha!", spr_rosto_guarda, 0, "Ayran");
                    ds_grid_add_text("Ayelen: Continua assim e eu vou começar a torcer pela piranha.", spr_ayelen_face, 0, "Ayelen");
                break;
            }
        break;
    }
}

function ds_grid_add_row(){
    var _grid = argument[0];
    ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
    return ds_grid_height(_grid) - 1;
}

function ds_grid_add_text(_texto, _retrato, _lado, _nome) {
    var _grid = texto_grid;
    var _y = ds_grid_add_row(_grid);

    _grid[# Infos.Texto, _y] = _texto;
    _grid[# Infos.Retrato, _y] = _retrato;
    _grid[# Infos.Lado, _y] = _lado;
    _grid[# Infos.Nome, _y] = _nome;
}