/// @description Atualiza a posição e visibilidade da mensagem

// Verifica se a mensagem deve ser exibida
if (mostra_message) {
    // Calcula a posição central da câmera
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    // Define a posição do objeto para o centro da câmera
    x = cam_x + cam_w / 2;
    y = cam_y + cam_h / 2;

    // Atualiza o alfa para fazer a mensagem desaparecer gradualmente
    alpha -= (1 / (room_speed * 4)); // Duração de 2 segundos
    if (alpha <= 0) {
        alpha = 0; // Garante que a opacidade não se torne negativa
        mostra_message = false; // Não exibe mais a mensagem
    }else if(alpha >=1 ){
		alpha +=(1 / (room_speed * 4)) 
	}
}

