/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Desenha o sprite normal do NPC
draw_self();

// Verifica se o player existe
if (instance_exists(obj_player)) {
    var player = obj_player;

    // Checa se a etapa do player é 1 e se ele está próximo (ex: 100 pixels de distância)
    if (player.etapa_historia == 1 && desenha == true && point_distance(x, y, player.x, player.y) < 100) {

        // Define alinhamento e cor do texto
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_set_font(fnt_dialogo); // Use a fonte que quiser, se tiver uma

        // Desenha a mensagem acima do NPC
        draw_text(x, y - 50, texto);
    }
}
