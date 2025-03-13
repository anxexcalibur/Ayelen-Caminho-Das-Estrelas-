// Animação para cima e para baixo
y_offset += direcao * velocidade;
if (y_offset > 3 || y_offset < -3) {
    direcao *= -1;
}

// Calcular a posição `y` para estar sempre acima do objeto
 // 4 é um pequeno ajuste opcional
