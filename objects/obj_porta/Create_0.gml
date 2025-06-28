// Inicialização
ativou = keyboard_check_pressed(ord("F"));
global.key = true; // Defina como true ao pegar a chave
porta_ativada = false
mensagem = "";
mostrar_mensagem = false;
colisao_ativa = false
// Evento Create
image_speed = 0; // A animação começa parada
image_index = 0;   // Garante que ela comece no primeiro frame
som_abertura_tocado = false;