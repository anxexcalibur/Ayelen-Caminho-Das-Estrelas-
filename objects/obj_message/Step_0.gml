
if (mostra_message) {
    x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
    y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
	// Evento Step
	tempo_decorrido += 1; 
	 if (tempo_decorrido >= tempo_espera and tempo_decorrido <= tempo_final) {
        alpha = lerp(alpha, 1, 0.02); // Aumenta alpha gradualmente até 1
		
    }
    // Fase de redução de alpha
    else if(tempo_decorrido >= tempo_final ){
        // Reduzir o alpha gradualmente usando lerp
		
        alpha = lerp(alpha, 0, 0.02); // Interpola entre alpha atual e 0, com uma taxa de 0.02
    }

    if (alpha <= 0.01) { // Quando o alpha for bem próximo de 0, esconde a mensagem
        mostra_message = false;
    }
}