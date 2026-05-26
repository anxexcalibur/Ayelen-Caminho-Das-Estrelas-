/// @description Tela de Game Over - Tema Indígena
if (game_over)
{
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);
    var cam_cx = cam_x + cam_w / 2;
    var cam_cy = cam_y + cam_h / 2;
    
    var bar_h = cam_h * 0.15;
    
    // Animação
    valor = lerp(valor, 1, 0.04);
    
    // --- FUNDO ESTRELADO ESCURO ---
    draw_set_alpha(clamp(valor, 0, 0.85));
    draw_set_color(make_color_rgb(10, 5, 20)); // Roxo bem escuro
    draw_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, false);
    
    // Estrelas piscando (simples)
    draw_set_color(make_color_rgb(255, 255, 200));
    for (var i = 0; i < 20; i++)
    {
        var sx = cam_x + 50 + (i * 47) % cam_w;
        var sy = cam_y + 30 + (i * 73) % cam_h;
        var brilho = 0.3 + 0.4 * sin(current_time / 1000 + i);
        draw_set_alpha(valor * brilho);
        draw_point(sx, sy);
    }
    
    // --- BARRAS COM PADRÃO INDÍGENA ---
    draw_set_alpha(1);
    
    // Barra superior
    draw_set_color(make_color_rgb(30, 10, 5)); // Marrom escuro
    draw_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + bar_h * valor, false);
    
    // Barra inferior
    draw_rectangle(cam_x, cam_y + cam_h - bar_h * valor, cam_x + cam_w, cam_y + cam_h, false);
    
    // Linhas decorativas (grafismo)
    draw_set_color(make_color_rgb(180, 100, 30)); // Laranja queimado
    draw_line_width(cam_x, cam_y + bar_h * valor, cam_x + cam_w, cam_y + bar_h * valor, 3);
    draw_line_width(cam_x, cam_y + cam_h - bar_h * valor, cam_x + cam_w, cam_y + cam_h - bar_h * valor, 3);
    
    // Triângulos decorativos (padrão indígena)
    var tri_w = 20;
    for (var tx = cam_x; tx < cam_x + cam_w; tx += tri_w * 2)
    {
        // Superior
        draw_triangle(tx, cam_y + bar_h * valor, tx + tri_w, cam_y + bar_h * valor, tx + tri_w/2, cam_y + bar_h * valor - 12, false);
        draw_triangle(tx + tri_w, cam_y + bar_h * valor, tx + tri_w * 2, cam_y + bar_h * valor, tx + tri_w * 1.5, cam_y + bar_h * valor - 12, false);
        
        // Inferior
        draw_triangle(tx, cam_y + cam_h - bar_h * valor, tx + tri_w, cam_y + cam_h - bar_h * valor, tx + tri_w/2, cam_y + cam_h - bar_h * valor + 12, false);
        draw_triangle(tx + tri_w, cam_y + cam_h - bar_h * valor, tx + tri_w * 2, cam_y + cam_h - bar_h * valor, tx + tri_w * 1.5, cam_y + cam_h - bar_h * valor + 12, false);
    }
    
    // --- TEXTO ---
    if (valor >= 0.6)
    {
        contador = lerp(contador, 1, 0.02);
        draw_set_alpha(contador);
        
        // Frase temática
        draw_set_font(fnt_pequena);
        draw_set_color(make_color_rgb(255, 200, 100)); // Dourado
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(cam_cx, cam_cy - 80, "As estrelas recolheram sua luz...");
        
        // Título
        draw_set_font(fnt_game_over);
        
        // Sombra
        draw_set_color(make_color_rgb(100, 30, 0));
        draw_text(cam_cx + 4, cam_cy - 25 + 3, "A JORNADA TERMINOU");
        
        // Texto principal (dourado)
        draw_set_color(make_color_rgb(255, 180, 40));
        draw_text(cam_cx, cam_cy - 25, "A JORNADA TERMINOU");
        
        // Linha decorativa
        var line_w = 250 * contador;
        draw_set_color(make_color_rgb(255, 150, 30));
        draw_line_width(cam_cx - line_w/2, cam_cy + 10, cam_cx + line_w/2, cam_cy + 10, 2);
        
        // Instrução piscante
        var alpha_pisca = 0.5 + 0.5 * sin(current_time / 500);
        draw_set_alpha(contador * alpha_pisca);
        draw_set_font(fnt_pequena);
        draw_set_color(make_color_rgb(255, 220, 150));
        draw_text(cam_cx, cam_cy + 55, "Pressione ENTER para renascer");
        
        draw_set_halign(-1);
        draw_set_valign(-1);
        draw_set_font(-1);
    }
    
    draw_set_alpha(1);
}
else
{
    valor = 0;
    contador = 0;
    draw_set_alpha(1);
}