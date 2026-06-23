/// @description Aplica dano ao tocar na água mortal
if (other.object_index != obj_piranha) {
    other.estado = "morto";
}