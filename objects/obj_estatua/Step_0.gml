/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scr_exclamacao()
// No Evento Step de obj_statue:
// Verifica se obj_player está colidindo com a estátua E a tecla 'F' foi pressionada
if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("F"))) // [1, 2, 4]
{
    // Alterna o estado de box_open
    box_open =!box_open;
}