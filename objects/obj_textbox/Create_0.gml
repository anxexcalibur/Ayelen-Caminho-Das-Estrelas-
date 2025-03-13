 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento Alarm[0]
nome_max = 30;
aperto_enter = 0;
alarm[0]=1;
// Defina uma variável global para armazenar o nome
// Initialization
global.player_name = "";
global.name_input_active = false;


draw_input_name = function() {
    draw_set_color(c_white);
    draw_set_font(fnt_fonte);
    draw_set_halign(fa_center);

    // Desenha o texto "Por favor, entre com o seu nome"
    draw_text(room_width / 2, 64, "Por favor, entre com o seu nome");
    draw_set_font(-1);
    // Desenha o sprite da caixa de texto
    draw_sprite(spr_textbox, 0, x, y);
    draw_self();

    // Alinha o texto dentro da caixa de texto à esquerda
    draw_set_halign(fa_left);
    draw_text_color(x + 10, y + 15, keyboard_string, c_black, c_black, c_black, c_black, 1);

    // Desenha o cursor piscante
    if (alarm[0]) {
        draw_line_width(x + 10 + string_width(keyboard_string), y + 15, x + 10 + string_width(keyboard_string), y + 35, 3);
    }

    // Desenha o texto "Pressione Enter Para continuar" abaixo da caixa de texto
    draw_set_halign(fa_center); // Centraliza o texto horizontalmente
	draw_set_color(c_red);
	draw_text(room_width / 2, y + sprite_height, "No mínimo 3 Caracter");
	draw_set_color(-1)
    draw_text(room_width / 2, y + sprite_height + 40, "Pressione Enter Para continuar");
	
	global.nome_jogador = keyboard_string;
	if room == rm_username &&  keyboard_check(vk_enter)
	{
		if string_length(global.nome_jogador) >= 3  
		{
			alarm[2] = 5
		
		}

	}
	show_debug_message(global.name_input_active)
}
salvar_jogo = function(nome_jogador, x, y) {
    // Verifica se x e y foram fornecidos, caso contrário define valores padrão
    if (argument_count < 3) {
        x = 60;
        y = 240;
    }

    // Abre o arquivo de save "save.sav" para adicionar conteúdo ao final
    var file_id = file_text_open_append("save.sav");
    
    if (file_id != -1) {
        // Escreve os dados do jogador no arquivo de save
        file_text_write_string(file_id, "[" + string(nome_jogador) + "]\n");
        file_text_write_string(file_id, "x_atual=" + string(x) + "\n");
        file_text_write_string(file_id, "y_atual=" + string(y) + "\n");
        file_text_write_string(file_id, "vida_atual=" + string(10) + "\n");
        file_text_write_string(file_id, "sala_atual=" +"1.000000" + "\n");
        file_text_write_string(file_id, "\n"); // Adiciona uma linha em branco para separar os registros
        
        file_text_close(file_id); // Fecha o arquivo de save
    } else {
        show_debug_message("Erro ao abrir o arquivo save.sav para escrita.");
    }
}




