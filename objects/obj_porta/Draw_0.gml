// Evento Draw de obj_porta

// 1. Desenha a própria porta
draw_self();

// 2. Se a variável 'mostrar_mensagem' for verdadeira, desenha o texto.
// A decisão foi tomada no Evento Step. Aqui a gente só obedece.
if (mostrar_mensagem) {
    // Pega as dimensões da câmera para centralizar o texto
    var _view_x = camera_get_view_x(view_camera[0]);
    var _view_y = camera_get_view_y(view_camera[0]);
    var _view_w = camera_get_view_width(view_camera[0]);
    var _view_h = camera_get_view_height(view_camera[0]);

    // Configura e desenha o texto
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    //draw_set_font(sua_fonte_de_dialogo); // Lembre-se de definir sua fonte!
    draw_set_color(c_white);
    
    // Desenha o texto um pouco acima da base da tela, para não atrapalhar a visão do jogador
    draw_text(obj_porta.x,obj_porta.y-50 , mensagem);

    // Reseta as configurações de desenho para não afetar outros objetos
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

// A lógica do 'else' para criar o HUD foi removida, pois ela não deve pertencer à porta.