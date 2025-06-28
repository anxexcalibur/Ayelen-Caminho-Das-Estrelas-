// Verifica se uma instância do jogador existe na sala
draw_self()
if (instance_exists(obj_player)) {
    // CORREÇÃO: Usa 'obj_player.x' e 'obj_player.y' diretamente para checar a distância.
    // O GameMaker encontrará a primeira instância de obj_player.
    if (point_distance(x, y, obj_player.x, obj_player.y) < 100) {
        // Agora que sabemos que estamos perto, podemos desenhar o texto.
        
        // Define alinhamento e cor do texto
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_set_font(fnt_dialogo);

        // Desenha a mensagem acima do NPC
        draw_text(x, y - 50, "F");

        // Reseta as configurações de desenho para o padrão para não afetar outros textos
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(-1);
        draw_set_color(c_black); // ou a cor padrão que preferir
    }
}