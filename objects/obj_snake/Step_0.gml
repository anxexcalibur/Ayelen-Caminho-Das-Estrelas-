/// @description Máquina de Estados e Comportamento da Cobra

event_inherited();

// Atualiza o timer de cooldown do ataque
if (timer_cooldown > 0) timer_cooldown--;

// --- LÓGICA DE DIREÇÃO (UNIVERSAL) ---
// Agora a cobra SEMPRE olha para o jogador, em qualquer estado.
if (instance_exists(obj_player)) {
    var dir = sign(obj_player.x - x);
    if (dir != 0) image_xscale = dir;
}

// --- MÁQUINA DE ESTADOS ---
switch (estado)
{
    // -----------------------------
    // ESTADO: PARADO
    // -----------------------------
    case "parado":
        pode_levar_dano = true;
        sprite_index = spr_snake;

        if (instance_exists(obj_player)) {
            var _dist = distance_to_object(obj_player);

            if (_dist < alcance_visao && timer_cooldown <= 0) {
                estado = "atacando";
                image_index = 0;
                atirou_neste_ciclo = false;
            }
        }
        break;

    // -----------------------------
    // ESTADO: ATACANDO
    // -----------------------------
    case "atacando":
        pode_levar_dano = true;
        sprite_index = spr_snake_shoot;

        var _frame_do_disparo = 2; // ajuste conforme sua animação

        if (image_index >= _frame_do_disparo && !atirou_neste_ciclo) {
            // Calcula o ponto de spawn do projétil
            var _offset_x = 20;
            var _spawn_x = x + (_offset_x * image_xscale);
            var _spawn_y = y - 12; // ajusta para sair da boca

            // Cria o projétil
            var _proj = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_projetil2);
            _proj.direcao = image_xscale;
            _proj.velocidade = 8;

            // Efeito visual opcional (ajuda a depurar)
            effect_create_above(ef_smoke, _spawn_x, _spawn_y, 1, c_lime);

            atirou_neste_ciclo = true;
        }

        if (image_index >= image_number - 1) {
            timer_cooldown = cooldown_ataque;
            estado = "parado";
        }
        break;

    // -----------------------------
    // ESTADO: HIT (DANO)
    // -----------------------------
    case "hit":
        pode_levar_dano = false;

        if (sprite_index != spr_snake_hit) {
            sprite_index = spr_snake_hit;
            image_index = 0;
        }

        // Mantém a direção fixada no momento do impacto
        if (instance_exists(obj_player)) {
            var dir_hit = sign(obj_player.x - x);
            if (dir_hit != 0) image_xscale = dir_hit;
        }

        if (image_index >= image_number - 1) {
            if (vida_atual <= 0) {
                estado = "morto";
                image_index = 0;
            } else {
                estado = "parado";
            }
        }
        break;

    // -----------------------------
    // ESTADO: MORTO
    // -----------------------------
    case "morto":
        pode_levar_dano = false;

        if (sprite_index != spr_snake_dead) {
            sprite_index = spr_snake_dead;
            image_index = 0;
        }

        // Mantém a orientação final do player
        if (instance_exists(obj_player)) {
            var dir_dead = sign(obj_player.x - x);
            if (dir_dead != 0) image_xscale = dir_dead;
        }

        // Trava no último frame e remove
        if (image_index >= image_number - 1) {
            image_speed = 0;
            image_index = image_number - 1;
            instance_destroy();
        }
        break;
}
