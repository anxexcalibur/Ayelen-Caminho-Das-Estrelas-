/// @description Configura a cena ao entrar na Room

// Executa apenas uma vez no frame inicial em que a sala carrega
if (room == rm_catcine_2) {
    if (instance_exists(obj_player)) instance_destroy(obj_player);
    if (instance_exists(obj_camera)) instance_destroy(obj_camera);
}