/// @description Máquina de Estados e Comportamento do Chefe Baiacu
event_inherited();

// --- LÓGICA CONTÍNUA (EXECUTADA A CADA FRAME) ---
var chao = place_meeting(x, y + 1, obj_block);
if (!chao) {
    velv += GRAVIDADE * massa;
}

if (estado != "hit" && estado != "morto" && estado != "atordoado") {
    if (instance_exists(obj_player)) {
        if (obj_player.x < x) { image_xscale = -1; } else { image_xscale = 1; }
    }
}

if (fala_timer > 0) {
    fala_timer--;
}

// === MÁQUINA DE ESTADOS ===
switch (estado) {

    #region parado
    case "parado": {
        pode_levar_dano = true;
        velh = 0;
        if (sprite_index != spr_baiacu) { sprite_index = spr_baiacu; image_index = 0; }

        if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);
            if (_dist < 300) {
                if (fala_timer <= 0) {
                    var _i = irandom(array_length(falas_encontro) - 1);
                    fala_atual = falas_encontro[_i];
                    fala_timer = 180;
                }
                estado = "movendo";
            }
        }

        if (vida_atual <= 50 && !_atordou) {
            estado = "atordoado";
            _atordou = true;
            stun_timer = stun_duration;
        }
        break;
    }
    #endregion

    #region movendo
    case "movendo": {
        pode_levar_dano = true;
        if (sprite_index != spr_baiacu_walk) { sprite_index = spr_baiacu_walk; image_index = 0; }

        if (instance_exists(obj_player)) {
            var _dist = point_distance(x, y, obj_player.x, obj_player.y);
            var _dir = point_direction(x, y, obj_player.x, obj_player.y);
            if (_dist > 60) { velh = lengthdir_x(2, _dir); } else { velh = 0; estado = "ataque"; ataque_estado = choose(1, 1, 2); }
        } else {
            velh = 0;
            estado = "parado";
        }
        break;
    }
    #endregion

    #region ataque
    case "ataque": {
        pode_levar_dano = true;
        velh = 0;
        switch (ataque_estado) {
            case 1: { // Ataque de projétil
                if (sprite_index != spr_baiacu_attack_2) {
                    image_index = 0;
                    sprite_index = spr_baiacu_attack_2;
                    if (fala_timer <= 0) {
                        var _i = irandom(array_length(falas_ataque_distancia) - 1);
                        fala_atual = falas_ataque_distancia[_i];
                        fala_timer = 120;
                    }
                }
                if (image_index >= 10) { instance_create_layer(x + (75 * image_xscale), y - 12, layer, obj_boladeagua_mortal); estado = "provocando"; }
                break;
            }
            case 2: { // Ataque de empurrão
                if (sprite_index != spr_baiacu_attack_3) {
                    image_index = 0;
                    sprite_index = spr_baiacu_attack_3;
                    if (fala_timer <= 0) {
                        var _i = irandom(array_length(falas_ataque_perto) - 1);
                        fala_atual = falas_ataque_perto[_i];
                        fala_timer = 120;
                    }
                }
                if (image_index >= 3) { instance_create_layer(x + (100 * image_xscale), y - 12, layer, obj_hit_inimigos); estado = "provocando"; }
                break;
            }
        }
        break;
    }
    #endregion

    #region hit
    case "hit": {
        pode_levar_dano = false;
        velh = 0;
        if (sprite_index != spr_baiacu_hit) {
            image_index = 0;
            sprite_index = spr_baiacu_hit;
            screenshake(1);
            if (fala_timer <= 0) {
                var _i = irandom(array_length(falas_hit) - 1);
                fala_atual = falas_hit[_i];
                fala_timer = 90;
            }
        }
        if (image_index >= image_number - 1) {
            if (vida_atual <= 0) { estado = "morto"; } else { estado = "parado"; }
        }
        break;
    }
    #endregion

    #region provocando
    case "provocando": {
        pode_levar_dano = true;
        velh = 0;
        if (sprite_index != spr_baiacu_provocando) {
            sprite_index = spr_baiacu_provocando;
			if image_index == 1 or image_index ==3{
				screenshake(3)
			}  
            image_index = 0;
            if (fala_timer <= 0) {
                var _i = irandom(array_length(falas_provocacao) - 1);
                fala_atual = falas_provocacao[_i];
                fala_timer = 150;
            }
        }
        if (image_index >= image_number - 1) { estado = "parado"; }
        break;
    }
    #endregion

    #region atordoado
    case "atordoado": {
        pode_levar_dano = true;
        velh = 0;
        if (sprite_index != spr_baiacu_stun) {
            sprite_index = spr_baiacu_stun;
            image_index = 0;
            var _i = irandom(array_length(falas_atordoado) - 1);
            fala_atual = falas_atordoado[_i];
            fala_timer = 240;
        }
        stun_timer--;
        if (stun_timer <= 0) { estado = "parado"; }
        break;
    }
    #endregion

    #region morto
    case "morto": {
        pode_levar_dano = false;
        if (sprite_index != spr_baiacu_morto) {
            sprite_index = spr_baiacu_morto;
            image_index = 0;
            pontuar(20);
            var _i = irandom(array_length(falas_morte) - 1);
            fala_atual = falas_morte[_i];
            fala_timer = 300;
            // Lógica de partículas...
        }
        if (image_index > image_number - 1) {
            instance_create_layer(x, y, layer, obj_star_1);
            instance_destroy();
        }
        break;
    }
    #endregion
}