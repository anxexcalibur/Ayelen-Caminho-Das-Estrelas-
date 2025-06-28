// Função principal para controle dos diálogos entre NPCs e jogadores
function scr_textos(){
	
	
	switch (npc_nome) {
		
		case "Piata":
			switch (obj_pai.estado_npc) {
				case 0:
					ds_grid_add_text("btc", spr_piata_rosto, 0, "Piatã");
					obj_player.etapa_historia = 1;
				break;
				case 1:
					ds_grid_add_text("Ayelen, minhas forças são frágeis e o peso dos anos me consome, mas meu coração permanece firme.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Sinto a conexão das estrelas me guiando, mesmo em meu estado frágil.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Ayelen: Pai, estou preocupada com tudo o que aconteceu. A vila está arruinada.", spr_ayelen_face, 1, "Ayelen");
					ds_grid_add_text("Piatã: A vila foi saqueada, graças ao jovem guerreiro que resolveu brincar de herói sem preparo.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Ayelen: Ele é imprudente, mas agora precisamos seguir em frente. O céu pede algo de nós.", spr_ayelen_face, 1, "Ayelen");
					ds_grid_add_text("Piatã: Mas agora não é hora de rir de crianças imprudentes; o céu pede seu sangue e seu amor.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Ayelen: O que você quer dizer com isso, pai? O que as estrelas esperam de mim?", spr_ayelen_face, 1, "Ayelen");
					ds_grid_add_text("Piatã: Você carrega a luz em seu coração, minha filha. Confio em você para completar isso.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Piatã: Vá fazer o ritual  ritual. O céu nos chama.", spr_piata_rosto, 0, "Piatã");
					
					obj_player.etapa_historia++;
					 // Avança para o próximo estado
					
					break;

				case 2:
					ds_grid_add_text("Agora que estás consciente, prepare-se para buscar os segredos das estrelas.", spr_piata_rosto, 0, "Piatã");
					 // Avança para outro estado após progresso
					break;
				case 3:
					ds_grid_add_text("faça o ritual!", spr_piata_rosto, 0, "Piatã");
					 // Avança para outro estado após progresso
				break;

	
				case 4:
				    ds_grid_add_text("O caminho à sua frente é sombrio, Ayelen, mas também repleto de esperança.", spr_piata_rosto, 0, "Piatã");
				    ds_grid_add_text("Os antigos sussurram sobre o 'caverna de ', um lugar escondido onde a luz nunca tocou.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("'Coração da Noite'? Esse nome parece... inquietante. O que encontrarei lá?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Lá repousam os ecos de nossos ancestrais e, com eles, respostas que o mundo ainda desconhece.", spr_piata_rosto, 0, "Piatã");
				    ds_grid_add_text("Mas Ayelen, a escuridão que mora ali testa não apenas a coragem, mas a verdade dentro de cada um.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Então não é a escuridão que devemos temer, mas o que ela revela de nós mesmos...", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Sim, filha das estrelas. Muitos chegaram lá, mas poucos regressaram com o coração íntegro.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Pai, não posso! Você está doente... e se eu partir? Quem cuidará de você?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Minha filha... o destino de Ka’tupytã pesa mais do que minhas enfermidades.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Você não está entendendo! Se algo acontecer comigo, e com você nesse estado...", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayelen, você é a única. A magia de Ubiratã ainda vive — uma maldição que corrompe a alma dos guerreiros mais fortes.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Uma maldição?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Sim... Ubiratã consome aqueles que ousam enfrentá-lo. Soldados inteiros perderam-se em desespero e escuridão. Ele se tornou uma sombra viva, amaldiçoando todos ao redor.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Então como eu poderia enfrentá-lo? Sou apenas uma filha da vila!", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Porque a Deusa Bianca lhe concedeu imunidade. Sua luz protege a sua mente contra o veneno de Ubiratã. Somente você pode desafiá-lo sem perder quem é.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Eu... sou imune? A Deusa Bianca... ela sabia?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Sim, minha filha. É o que chamam de o Dom das Estrelas. Só os puros e escolhidos resistem às sombras de Ubiratã.", spr_piata_rosto, 0, "Piatã");
				    ds_grid_add_text("Ninguém mais pode. Foi por isso que tantos tombaram antes mesmo de tocar sua espada.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Pai... mesmo assim, é uma missão que carrega o peso da morte. E se eu falhar?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Então Ka’tupytã morrerá. Eu morrerei. Mas pior, Bianca será silenciada. A escuridão de Ubiratã se espalhará e consumirá as estrelas do firmamento.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Eu não posso deixar que isso aconteça. Não... enquanto o Dom das Estrelas ainda brilha em mim.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Então vá, minha filha. Vá sabendo que a esperança de uma vila inteira anda com você... e que estou orgulhoso.", spr_piata_rosto, 0, "Piatã");

				    ds_grid_add_text("Vou encontrar os Olhos de Tupã e enfrentar Ubiratã, por você, pela vila, pela Estrela Dalva.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Que Bianca ilumine cada um de seus passos, minha filha. Jamais se esqueça... sua mente é a chave para vencer o inimigo.", spr_piata_rosto, 0, "Piatã");
					ds_grid_add_text("Você deve buscar Poiarã, o artesão da tribo. Dizem que suas mãos moldam não apenas objetos, mas também o destino daqueles que cruzam seu caminho. Ele pode te guiar para além do que seus olhos alcançam.", spr_piata_rosto, 0, "Piatã");
					obj_player.etapa_historia++;
					break;
					case 5:
					{
						ds_grid_add_text("Me sinto sobre carregada pai, sinto que os céus exigem de mais de mim, me sinto afundando em um rio de cobranças, não sei se consigo fazer isso", spr_ayelen_face, 1, "Ayelen");
					    ds_grid_add_text("Ouça, pequena estrela… até os deuses respeitam o tempo. Se os céus exigem demais, mostre a eles que a sua luz brilha por sua própria vontade, não por cobrança", spr_piata_rosto, 0, "Piatã");
						ds_grid_add_text("alvez eu ainda esteja com medo, talvez ainda me sinta cansada... mas vou seguir em frente. Um passo de cada vez, como você disse.", spr_ayelen_face, 1, "Ayelen");
						ds_grid_add_text("E, se eu cair, sei que você estará lá, bianca estará lá, para me ajudar a levantar. Isso já me faz sentir um pouco mais forte..", spr_ayelen_face, 1, "Ayelen");
					break;
					}
					case 6:
						ds_grid_add_text("Vamos Filha, não tenha medo, os Deuses estão com você, não tema, nossa vila precisa de você", spr_piata_rosto, 0, "Piatã");
						ds_grid_add_text("Não me sinto pronta, pai, mas irei ...", spr_ayelen_face, 1, "Ayelen");
						ds_grid_add_text("não se preocupe filha, você vai ser preparada ao longo da jornada!", spr_piata_rosto, 0, "Piatã");
						ds_grid_add_text(" ...", spr_ayelen_face, 1, "Ayelen"); 
						 // Avança para outro estado após progresso
					break;
			}
		break;
		case "Ancianemimby":
				
				switch (obj_nemimby_orientadora.estado_npc) {
					
					case 0:{
						ds_grid_add_text("Encontre seu pai ayelen", spr_xama_rosto, 0, "Nemimby");
					
					break;
					}
					case 1:{
						ds_grid_add_text("Encontre seu pai ayelen", spr_xama_rosto, 0, "Nemimby");
						break;
					}
					case 2:
						ds_grid_add_text("Ayelen, o véu entre os mundos está mais tênue esta noite. O chamado dos ancestrais ecoa em meu espírito.", spr_xama_rosto, 0, "Nemimby");
						ds_grid_add_text("É como se o vento sussurrasse segredos antigos. Estou pronta, Nemimby. O que devemos fazer agora?", spr_ayelen_face, 1, "Ayelen");
            
			            ds_grid_add_text("Primeiro, precisamos da harmonia. Respire fundo, Ayelen, e permita que a floresta cante em sua alma.", spr_xama_rosto, 0, "Nemimby");
			            ds_grid_add_text("O som das folhas, o pulsar do chão... Sim, sinto a conexão se fortalecendo. Estou pronta para o próximo passo.", spr_ayelen_face, 1, "Ayelen");
            
					    ds_grid_add_text("Muito bem. Agora, ofereça sua intenção ao universo, com sinceridade e coragem. Só então a bebida nos guiará pelo caminho oculto.", spr_xama_rosto, 0, "Nemimby");
					    ds_grid_add_text("Minha intenção é clara: quero respostas, Nemimby. Quero entender o que o céu e a terra esperam de mim.", spr_ayelen_face, 1, "Ayelen");
            
						ds_grid_add_text("Então segure firme, Ayelen. O ritual começa agora. Não tema o que verá. Tudo é parte do aprendizado.", spr_xama_rosto, 0, "Nemimby");
						ds_grid_add_text("vá até a fogueira e beba o chá", spr_xama_rosto, 0, "Nemimby");
						obj_player.etapa_historia++;
					
					break;
					case 3:
						
							ds_grid_add_text("O caminho à sua frente é sombrio, Ayelen, mas também repleto de esperança.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Os antigos sussurram sobre o 'Coração da Noite', um lugar escondido onde a luz nunca tocou.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("'Coração da Noite'? Esse nome parece... inquietante. O que encontrarei lá?", spr_ayelen_face, 1, "Ayelen");

							ds_grid_add_text("Lá repousam os ecos de nossos ancestrais e, com eles, respostas que o mundo ainda desconhece.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Mas Ayelen, a escuridão que mora ali testa não apenas a coragem, mas a verdade dentro de cada um.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Então não é a escuridão que devemos temer, mas o que ela revela de nós mesmos...", spr_ayelen_face, 1, "Ayelen");
							ds_grid_add_text("Sim, filha das estrelas. Muitos chegaram lá, mas poucos regressaram com o coração íntegro.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("O que preciso para chegar até o 'Coração da Noite'?", spr_ayelen_face, 1, "Ayelen");
							ds_grid_add_text("Precisamos dos Olhos de Tupã, pedras sagradas espalhadas pela floresta antiga, há muito tempo protegidas pelas sentinelas de madeira.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Sentinelas de madeira? Você fala dos antigos Espíritos das Raízes, não fala?", spr_ayelen_face, 1, "Ayelen");

							ds_grid_add_text("Sim. Eles observam e guardam. Você precisará de paciência e respeito; só assim revelarão a você o caminho adormecido.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("E se falhar em conquistá-los?", spr_ayelen_face, 1, "Ayelen");

							ds_grid_add_text("Então as árvores se fecharão ao seu redor, e o tempo se tornará uma prisão onde até a luz esquece de existir.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Vou encontrar os Olhos de Tupã e retornarei com o caminho para o Coração da Noite. Confie em mim.", spr_ayelen_face, 1, "Ayelen");

							ds_grid_add_text("O céu e a terra andam com você, Ayelen. Escute a floresta... e jamais caminhe sozinha no silêncio.", spr_xama_rosto, 0, "Nemimby");
							obj_player.etapa_historia++;
						break;
						case 4:
							ds_grid_add_text("Ayelen, chegou a hora de seguir o seu caminho.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Lembre-se: o mundo à sua frente está cheio de desafios.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Mas também está cheio de aliados... e lições a serem aprendidas.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Você nunca está sozinha. A força das estrelas está com você.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Escute a floresta, sinta o vento, olhe para o céu.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Sempre que a dúvida invadir, lembre-se do que é sagrado para você.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("E confie no seu coração, pois ele conhece o caminho.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("O céu e a terra andam com você, Ayelen.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Que a luz das estrelas a guie... até que nos encontremos novamente.", spr_xama_rosto, 0, "Nemimby");
						break;
						case 5:
							ds_grid_add_text("Ayelen, chegou a hora de seguir o seu caminho.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Lembre-se: o mundo à sua frente está cheio de desafios.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Mas também está cheio de aliados... e lições a serem aprendidas.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Você nunca está sozinha. A força das estrelas está com você.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Escute a floresta, sinta o vento, olhe para o céu.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("Sempre que a dúvida invadir, lembre-se do que é sagrado para você.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("E confie no seu coração, pois ele conhece o caminho.", spr_xama_rosto, 0, "Nemimby");

							ds_grid_add_text("O céu e a terra andam com você, Ayelen.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Que a luz das estrelas a guie... até que nos encontremos novamente.", spr_xama_rosto, 0, "Nemimby");
						break;
						case 6:
							ds_grid_add_text("Ayelen, Oque está fazendo aqui ?.", spr_xama_rosto, 0, "Nemimby");
							ds_grid_add_text("Apresse-te: o mundo à sua frente está cheio de desafios.", spr_xama_rosto, 0, "Nemimby");
													
						break;
				 }

			break;

		case "Poiara":
    switch(obj_player.etapa_historia){
        case 1:
        case 2:
        case 3:
        case 4: {
            ds_grid_add_text("Ayelen, seu pai está te procurando.", spr_rosto_npc_artesao, 0, "Poiarã");
            break;
        }
        case 5: {
            ds_grid_add_text("Poiarã: Ah, Ayelen! Você finalmente chegou.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Seu pai mencionou sua missão importante.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: O desconhecido testa até mesmo os mais fortes.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Antes que vá... quero ajudá-la.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Esta jornada não é só de força... é de resiliência.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Leve isto: o Escudo Verde.", spr_escudo, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Ele irá protegê-la e devolver parte de sua energia.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Use-o com sabedoria. Ele não durará para sempre.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Mas, quando ativado no momento certo... pode salvar sua vida.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Vá agora, Ayelen. O destino a aguarda.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Pressione K para ativar o escudo.", spr_sistema, 0, "Sistema");
            obj_player.etapa_historia = 6;
            break;
        }
        case 6: {
            ds_grid_add_text("Poiarã: O tempo está bom para caminhar, mas lembre-se, cada passo ensina algo novo.", spr_rosto_npc_artesao, 0, "Poiarã");
            ds_grid_add_text("Poiarã: Lembre-se de ouvir o som das árvores, elas têm muito a contar.", spr_rosto_npc_artesao, 0, "Poiarã");
            break;
        }
    }
    break;

case "kaua":
    switch(obj_player.etapa_historia){
        case 8: {
            ds_grid_add_text("Você se depara com um guerreiro escondido atrás de um arbusto, claramente exausto... e meio sujo de lama.", spr_sistema, 0, "Narrador");
            ds_grid_add_text("Olá, moça! Ouvi boatos sobre a lendária Katupitan... Não me diga que é você?", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Hahaha! Talvez... Fui enviada pela minha vila. Você é da Vila do Sol? Ouvi dizer que ela foi... digamos... bem, destruída.", spr_ayelen_face, 1, "Ayelen");
            ds_grid_add_text("Sim, infelizmente. O Caído invocou uma besta marítima das lendas com o poder dos artefatos. O infeliz fugiu e a criatura acabou com vários dos nossos guerreiros... A maioria migrou para o sul, onde temos esconderijos.", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Espera... Besta? Que papo é esse? Ela ainda está por aqui?", spr_ayelen_face, 1, "Ayelen");
            ds_grid_add_text("Sim, senhorita! Ela se escondeu nas grutas. Mas fique tranquila, o Xamã selou a porta! Fui encarregado de guardar a chave e... entregar pra você!", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Porém... meio que deixei ela cair enquanto fugia. Está ali na frente, mas não tenho a menor coragem de voltar pra pegar!", spr_kaua_guarda, 0, "Kauã");
            ds_grid_add_text("Beleza, pode deixar! Vou enfrentar essa fera, recuperar as insígnias e ganhar um tempinho extra pra minha vila... e talvez também pra você não morrer de medo!", spr_ayelen_face, 1, "Ayelen");
            obj_player.etapa_historia = 9;
            break;
        }case 9: {
	    ds_grid_add_text("Kauã: Sabe, Ayelen... talvez tudo isso tenha acontecido porque tinha que acontecer.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Ayelen: Como assim? Você tá dizendo que... era destino?", spr_ayelen_face, 1, "Ayelen");

	    ds_grid_add_text("Kauã: Não só destino. Na nossa aldeia, aprendemos que a Terra, os espíritos e nós... somos um só.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Kauã: Quando esquecemos de escutar a natureza... ela fala mais alto.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Ayelen: Então... essa besta, o caos, a destruição... são respostas?", spr_ayelen_face, 1, "Ayelen");

	    ds_grid_add_text("Kauã: É o que os anciões dizem. O mundo visível é só metade do que existe. O outro lado é o espírito — o Nhandereko, nosso jeito de ser.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Kauã: Quando a alma da aldeia adoece... a floresta sente, os rios respondem.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Ayelen: Então... nossa missão não é só derrotar a besta, né?", spr_ayelen_face, 1, "Ayelen");

	    ds_grid_add_text("Kauã: Não. É curar o que foi ferido... em nós e na Terra.", spr_kaua_guarda, 0, "Kauã");

	    ds_grid_add_text("Ayelen: Bonito... e difícil. Mas vamos lá. Por você, pela aldeia... e pelo espírito da floresta.", spr_ayelen_face, 1, "Ayelen");

	    ds_grid_add_text("Kauã: Lembre-se... não é destino. É que a realidade responde à nossa alma. Se adoecemos e seguimos caminhos de trevas... consequências como essas acontecem.", spr_kaua_guarda, 0, "Kauã");
		ds_grid_add_text("Ayelen:...", spr_ayelen_face, 1, "Ayelen");
	    ds_grid_add_text("Ayelen: Difícil de aceitar, mas compreendo a responsabilidade que temos como grupo, falhamos com ele, o caido...", spr_ayelen_face, 1, "Ayelen");
		ds_grid_add_text("Kauã: sim..., vá cuide se", spr_kaua_guarda, 0, "Kauã");
    break;
}

    }
    break;

case "arbusto":
    ds_grid_add_text("Sistema: A pêra-do-cerrado (Eugenia klotzschiana) é uma fruta rara e pouco conhecida, nativa dos cerrados e campos do Brasil central e sudeste. Seu nome indígena é cabamixá-açú, que significa 'erva que dá fruto que aperta a língua'.", spr_sistema, 0, "Sistema");
    break;

		case "ceramica":
			ds_grid_add_text("Sistema: Os povos indígenas foram os primeiros ceramistas do território brasileiro, desenvolvendo técnicas sofisticadas de produção muito antes da chegada dos europeus. ", spr_sistema, 0, "arbusto");
			ds_grid_add_text("Sistema: Usando recursos naturais como argila, fibras vegetais e pigmentos orgânicos, criaram recipientes resistentes para armazenar alimentos, cozinhar, transportar água e até mesmo realizar rituais sagrados. ", spr_sistema, 0, "arbusto");
			ds_grid_add_text("Sistema: A cerâmica não era apenas uma ferramenta, mas uma linguagem visual que transmitia valores, cosmologias e modos de vida. ", spr_sistema, 0, "arbusto");
		
		break;
		case "estatua_bianca":
		    ds_grid_add_text("Sistema: Estátua referente à matriarca, deusa das estrelas e constelações que protege a vila.", spr_sistema, 0, "arbusto");
		    ds_grid_add_text("Sistema: Para os povos indígenas Tupi-Guarani, estátuas e figuras cerâmicas não eram apenas arte — elas representavam entidades espirituais, ancestrais e forças da natureza. Serviam como proteção simbólica, marca de território e conexão com o mundo espiritual.", spr_sistema, 0, "arbusto");
			ds_grid_add_text("Sistema: Serviam como proteção simbólica, marca de território e conexão com o mundo espiritual.", spr_sistema, 0, "arbusto");
		break;

		case "Ayran":
			switch(obj_player.etapa_historia){
				case 6: 
				    ds_grid_add_text("Ayran: Ah, finalmente alguém que presta atenção nos relatos! Você não tem ideia do que acontece por aqui...", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Considerando que ouvi seu nome em uma história sobre um soldado tropeçando na própria lança... tenho uma ideia sim.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Ei, ei, isso é injusto! Primeiro, foi ELE quem tropeçou, não eu. Segundo, foram DUAS vezes. Terceiro... bom, eu ia dizer algo esperto aqui, mas perdi a linha de raciocínio.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Como sempre, então. Mas vai, me conta logo, ouvi que você enfrentou Ubiratã.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Ah, agora sim, uma história digna! Foi uma luta memorável... pelo menos pra ele.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Isso quer dizer que você desmaiou, não é?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Olha, eu chamaria de \"tática de recuperação emergencial no chão\". Mas antes disso, ele perdeu uns dentes, tenho certeza!", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Hahaha, vou fingir que acredito. Mas e depois?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Bom... ele fugiu. Mas juro que parecia menos cabeludo quando saiu correndo. Coincidência? Acho que não.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: E agora ele tá na vila do sul, né?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Tava. Vila do sul já era. Exploradores brancos passaram por lá como uma tempestade de destruição. Nem as histórias escaparam.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: … Então essa é a real.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: E o pior? Eles nem sabiam fazer um discurso decente de vilão. Que desperdício.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Você realmente esperava que eles tivessem estilo?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Olha, um pouco de carisma não mata ninguém! Mas enfim, sobre a luta... consegui pegar isso aqui.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: O quê?", spr_ayelen_face, 0, "Ayelen");
				    ds_grid_add_text("Ayran: Mostra o artefato Uma estrela petrificada. Dizem que tem magia e tal... mas até agora é só um belo peso de papel.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Espera, você pegou isso na luta contra Ubiratã?!", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Exato! Troféu de guerra! Bom... tecnicamente ele tava segurando e eu meio que... peguei no susto.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Então você roubou no meio da briga?!", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Roubei é uma palavra forte. Eu chamo de “redistribuição estratégica de recursos”.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Hahaha, certo, certo. Mas isso parece importante. Vou guardar como se fosse minha coleção de piadas melhores.", spr_ayelen_face, 0, "Ayelen");
				    ds_grid_add_text("Ayran: Ei! Minhas piadas são um patrimônio cultural!", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: E por isso mesmo precisam de proteção.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Tsc, ingrata. Mas falando sério, Ayelen... guarde bem isso. Se perder...", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Você vai ter que inventar uma nova história trágica?", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Exatamente! E sinceramente, minha criatividade anda em baixa.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Ok, ok, já entendi. Mas falando nisso... essa missão só ficou ainda mais importante. Eles acham que podem destruir sem consequência.", spr_ayelen_face, 0, "Ayelen");
				    ds_grid_add_text("Ayran: Exato. Ensina pra eles quem manda, hein?", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Pode apostar. Ah, e sobre correr? Eu só corro de uma coisa...", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Inimigos?", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Suas piadas!", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Ofendidíssimo Eu sabia.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Haha, valeu pelo aviso, Ayran. Agora, se me der licença, tenho um vilão para caçar.", spr_ayelen_face, 1, "Ayelen");
				    ds_grid_add_text("Ayran: Vai com tudo, campeã! Mas se precisar de ajuda... quer dizer, tem gente melhor que eu, mas eu sou ótimo pra assistir histórias.", spr_rosto_guarda, 0, "protetor");
				    ds_grid_add_text("Ayelen: Não duvido. Até mais!", spr_ayelen_face, 1, "Ayelen");
				    obj_guarda.alarm[0] = 1200;
				    obj_player.etapa_historia =7;
				break
				case 7:
					ds_grid_add_text("Ayran:  Você não tem ideia do que aquelas piranhas fazem... São tão ferozes que até meu café da manhã ficou com medo!", spr_rosto_guarda, 0, "protetor");
					ds_grid_add_text("Ayelen: Piranhas? Achei que você só tivesse medo de promoção pra capitão... ou de tomar banho!", spr_ayelen_face, 1, "Ayelen");
					ds_grid_add_text("Ayran: hahahah", spr_rosto_guarda, 0, "protetor");
					break
				case 8:
					ds_grid_add_text("Ayran: Sabe por que as piranhas nunca jogam conversa fora?", spr_rosto_guarda, 0, "protetor");
					ds_grid_add_text("Ayelen: Não... Por quê?", spr_ayelen_face, 0, "Ayelen");
					ds_grid_add_text("Ayran: Porque elas preferem morder a língua! Hahaha!", spr_rosto_guarda, 0, "protetor");
					ds_grid_add_text("Ayelen: ... Se eu ouvir mais uma dessas, vou começar a torcer pelas piranhas.", spr_ayelen_face, 0, "Ayelen");

				break
			}



		break;
		/*
		case "pai_despedida":
			ds_grid_add_text("Minha filha, eu sou velho e já vivi minha jornada.", spr_pai_rosto, 0, "pai");
			ds_grid_add_text("A sua está apenas começando. Não se prenda ao medo, mas sim à esperança.", spr_pai_rosto, 0, "pai");
			ds_grid_add_text("Eu prometo voltar com as runas, e quando eu voltar, nossa terra estará em paz novamente.", spr_ayelen_face, 1, "Ayelen");
			ds_grid_add_text("Eu acredito em você. Vá com a força das estrelas, minha filha.", spr_pai_rosto, 0, "pai");
		break;

		

		case "npc_secundario2":
			ds_grid_add_text("Minha avó sempre dizia: 'Nunca confie em um porco-espinho que sorri'. Nunca entendi por quê.", spr_npc_aleatorio, 0, "Habitante");
			ds_grid_add_text("Mas também nunca vi um porco-espinho sorrindo, então acho que estou seguro.", spr_npc_aleatorio, 0, "Habitante");
		break;

		case "npc_secundario3":
			ds_grid_add_text("Sabe, ouvi dizer que os astros podem prever o futuro. Perguntei à Estrela Dalva se eu encontraria amor.", spr_npc_aleatorio, 0, "Jovem Romântico");
			ds_grid_add_text("Ela me respondeu com um brilho... ou talvez tenha sido só um reflexo. Mas me senti esperançoso!", spr_npc_aleatorio, 0, "Jovem Romântico");
		break;

		case "npc_secundario4":
			ds_grid_add_text("Tem algo errado com a plantação. As abóboras começaram a crescer... nas árvores.", spr_npc_aleatorio, 0, "Fazendeiro");
			ds_grid_add_text("Acho que Tupã está de brincadeira com a gente.", spr_npc_aleatorio, 0, "Fazendeiro");
		break;*/
	}
}

// Função auxiliar para adicionar uma nova linha ao grid
function ds_grid_add_row(){
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return ds_grid_height(_grid) - 1;
}

// Função para inserir o texto no grid de diálogo
function ds_grid_add_text(_texto, _retrato, _lado, _nome) {
    var _grid = texto_grid;
    var _y = ds_grid_add_row(_grid);

    _grid[# Infos.Texto, _y] = _texto;
    _grid[# Infos.Retrato, _y] = _retrato;
    _grid[# Infos.Lado, _y] = _lado;
    _grid[# Infos.Nome, _y] = _nome;
}
