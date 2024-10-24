/// @description Inserir descrição aqui
event_inherited();

// Inicializa o stun_timer

// Variáveis para o empurrão
var empurrao_forca = 5; // Força do empurrão
var empurrao_direcao;
var chao = place_meeting(x, y + 1, obj_block);

if (!chao) {
    velv += GRAVIDADE * massa;
}

switch (estado) {
    #region parado
    case "parado": {
        timer_estado++;
        velh = 0;

        // Colocando o sprite certo
        if (sprite_index != spr_baiacu) {
            sprite_index = spr_baiacu;
            image_index = 0;
        }

        // Saindo do estado
        if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);
            // Se o player estiver muito perto, vou atrás dele
            if (_dist < 300) {
                estado = "movendo";
            }
        }

        // Condição para atordoamento (vida menor que 50 e ainda não atordoado)
        if (vida_atual <= 50 && _atordou == false) {
            estado = "atordoado";
            _atordou = true;
            stun_timer = stun_duration; // Inicia o timer de atordoamento
        }
        break;
    }
    #endregion

    case "movendo": {
        timer_estado++;
        if (sprite_index != spr_baiacu_walk) {
            sprite_index = spr_baiacu_walk;
            image_index = 0;
        }

        if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);
            var _dir = point_direction(x, y, obj_player.x, obj_player.y);
            // Definindo a minha velocidade
            if (_dist > 60) {
                velh = lengthdir_x(2, _dir);
                show_debug_message(velh);
            } else {
                // Chegou muito perto, ele para e me ataca
                velh = 0;
                estado = "ataque";
                ataque_estado = choose(1, 1, 2); // Escolhendo o ataque
            }
        } else {
            velh = 0;
            estado = "parado";
        }
        break;
    }

    case "ataque": {
        // Lógica de ataque
        switch (ataque_estado) {
            case 1: {
                velh = 0;
                if (sprite_index != spr_baiacu_attack_2) {
                    image_index = 0;
                    sprite_index = spr_baiacu_attack_2;
                }
                if (image_index >= 10) {
                    // Criando o ataque
                    if (image_xscale == 1) {
                        instance_create_layer(x + 75, y - 12, layer, obj_boladeagua_mortal);
                    } else if (image_xscale == -1) {
                        instance_create_layer(x - 75, y - 12, layer, obj_boladeagua_mortal);
                    }
                    estado = "provocando";
                    velh = 0;
                    posso = true;
                }
                break;
            }

            case 2: {
                velh = 0;
                if (sprite_index != spr_baiacu_attack_3) {
                    image_index = 0;
                    sprite_index = spr_baiacu_attack_3;
                }
                if (image_index >= 3) {
                    // Criando o ataque
                    if (image_xscale == 1) {
                        instance_create_layer(x + 100, y - 12, layer, obj_hit_inimigos);
                        with (obj_player) {
                            xscale = -1;
                            screenshake(1);
                        }
                    } else if (image_xscale == -1) {
                        instance_create_layer(x - 100, y - 12, layer, obj_hit_inimigos);
                        with (obj_player) {
                            xscale = 1;
                            screenshake(1);
                        }
                    }
                    pode_desenhar = false;
                    estado = "provocando";
                    velh = 0;
                    posso = true;
                }
                break;
            }
        }
        break;
    }

    case "hit": {
        if (sprite_index != spr_baiacu_hit) {
            image_index = 0;
            sprite_index = spr_baiacu_hit;
            vida_atual -= obj_player.id.ataque;
            screenshake(1);
        }

        if (image_index > image_number - 1) {
            estado = "parado";
        }

        if (vida_atual <= 0) {
            if (image_index > image_number - 1) {
                estado = "morto";
            }
        }
        break;
    }

    case "provocando": {
        velh = 0;
        if (sprite_index != spr_baiacu_provocando) {
            sprite_index = spr_baiacu_provocando;
            image_index = 0;
        }
        if (image_index > image_number - 1) {
            estado = "parado";
        }
        break;
    }

    case "atordoado": {
        velh = 0;
        if (sprite_index != spr_baiacu_stun) {
            sprite_index = spr_baiacu_stun;
            image_index = 0;
        }

        // Reduz o stun_timer a cada frame
        stun_timer--;

        // Se o stun_timer chegar a zero, volta ao estado "parado"
        if (stun_timer <= 0) {
            estado = "parado";
        }
        break;
    }

    case "morto": {
        if (sprite_index != spr_caracol_morto) {
            pontuar(6);
            sprite_index = spr_caracol_morto;
            image_index = 0;

            // Criação do sistema de partículas
            var part_sys = part_system_create();

            // Explosão de partículas
            var part_explosion = part_type_create();
            part_type_shape(part_explosion, pt_shape_explosion);  // Forma da explosão
            part_type_size(part_explosion, 1, 2, 0, 0);           // Tamanho das partículas
            part_type_color1(part_explosion, c_red);              // Cor vermelha
            part_type_alpha2(part_explosion, 1, 0);               // Transparência
            part_type_speed(part_explosion, 3, 6, 0, 0);          // Velocidade das partículas
            part_type_life(part_explosion, 30, 60);               // Tempo de vida das partículas

            // Criar várias partículas no centro do chefe (100 partículas)
            part_particles_create(part_sys, x, y, part_explosion, 100);

            // Destruir o tipo de partícula (opcional, caso não seja mais necessário)
            part_type_destroy(part_explosion);

            // O sistema de partículas pode ser destruído posteriormente se não for mais necessário
            // part_system_destroy(part_sys);  // Destrua o sistema de partículas quando não for mais usado
        }

        if (image_index > image_number - 1) {
            instance_create_layer(x, y, layer, obj_star_1);
            instance_destroy();
        }
        break;
    }
}
