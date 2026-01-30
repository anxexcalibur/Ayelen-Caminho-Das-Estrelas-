# GDD — Ayelen: Caminho das Estrelas

## 1. Título
Ayelen — Caminho das Estrelas

## 2. Visão Geral
Gênero: Plataformas 2D / Ação com componente narrativo.
Protótipo para TCC inspirado na mitologia tupi-guarani.
Engine: GameMaker Studio (GML, recursos v2.3.0+).

## 3. Objetivos
- Criar um protótipo jogável para apresentação de TCC.
- Equilibrar combate, plataforma e narrativa.

## 4. Mecânicas principais
- Movimento: pulo, deslocamento horizontal e gravidade (macro: GRAVIDADE macro no src_ini).
- Dash: vel_dash, duracao_dash (variáveis em obj_player/Create_0.gml).
- Combate: ataque, hitboxes (obj_hit_box), projéteis (obj_projetil2).
- Diálogos e cutscenes: sistema baseado em texto_grid e paginação (obj_dialogo).
- Transição de salas: sensores que detectam o jogador e teclam W para transição (obj_sensor).
- Salvamento: salvar_jogo/carregar_jogo (invocado por menus/textbox).

### Exemplos de trechos de código referenciados:

```markdown name=objects/obj_player/Create_0.gml url=https://github.com/anxexcalibur/Ayelen-Caminho-Das-Estrelas-/blob/ad8f491ffecc96705f0f2acf8247454724abe2ce/objects/obj_player/Create_0.gml
 /// @description Inserir descrição aqui

randomize();

morreu = false 
var cam = instance_create_layer(x,y,layer,obj_camera);
cam.alvo = id;

vel_dash = 10

duracao_dash = 10;
tempo_dash = duracao_dash;
menu_existe = false;
max_vida = 2;
vida_atual = max_vida;
...
```

```markdown name=scripts/scr_funcoes/scr_funcoes.gml url=https://github.com/anxexcalibur/Ayelen-Caminho-Das-Estrelas-/blob/ad8f491ffecc96705f0f2acf8247454724abe2ce/scripts/scr_funcoes/scr_funcoes.gml
// Os recursos de script mudaram para a v2.3.0; veja ...
function screenshake(_treme,_dir_mode,_direcao){
	var tremer = instance_create_layer(0,0,"instances",obj_screenshake)
	tremer.shake = _treme;
	...
}
```

## 5. Controles (inferred)
- W: interagir / entrar em portas / ativar sensores (obj_sensor usa ord("W")).
- movimentos e demais teclas: confirmar no projeto GameMaker (bindings no IDE).

## 6. Progresso e Estrutura de níveis
- Rooms: rm_init (menu), rm_prototipo (nível protótipo) — verificar o projeto para lista completa.

## 7. UI e HUD
- Barra de vida configurável (healthbar_width/height/positions em obj_player).
- Diálogo com retrato e som de digitação (obj_dialogo).

## 8. Inimigos e IA
- Exemplo: obj_tatucanastra com estados (parado, movendo) e timers; obj_snake que dispara projéteis via alarm.

## 9. Áudio e efeitos
- teclas de diálogo, screenshake, sons em audio_play_sound.

## 10. Salvamento
- salvar_jogo / carregar_jogo sendo usados no menu/textbox. Confirmar o formato de save no projeto.

## 11. Assets
- Pasta assets/ com imagens de UI e screenshots (menu, dialogo, gameplay).

## 12. Roadmap e pendências
- Créditos e finalização de testes ainda pendentes conforme README.

## 13. Arquivos-chave (links)
- README.md: https://github.com/anxexcalibur/Ayelen-Caminho-Das-Estrelas-/blob/ad8f491ffecc96705f0f2acf8247454724abe2ce/README.md
- obj_player/Create_0.gml: https://github.com/anxexcalibur/Ayelen-Caminho-Das-Estrelas-/blob/ad8f491ffecc96705f0f2acf8247454724abe2ce/objects/obj_player/Create_0.gml
- scr_funcoes/scr_funcoes.gml: https://github.com/anxexcalibur/Ayelen-Caminho-Das-Estrelas-/blob/ad8f491ffecc96705f0f2acf8247454724abe2ce/scripts/scr_funcoes/scr_funcoes.gml

## 14. Recomendações para o TCC
- Documentar controles no README, gerar build Windows para apresentação, incluir brief técnico e testes de usabilidade.
