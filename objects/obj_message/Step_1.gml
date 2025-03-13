switch (global.nivel_do_jogo) {
    case 2: {
        if (!instance_exists(obj_star_1)and room == rm_prototipo_level2) { // Verifica se obj_star_1 NÃO existe
            mostra_message = true;
            text1 = "Nível 1! cruza o limiar";
        }
    }
    break;
}
