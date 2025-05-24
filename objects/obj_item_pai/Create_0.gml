function verificar_item_coletado() {
    ini_open("_itens.sav");  // Arquivo onde salva os itens coletados

    var id_item = string(x) + "_" + string(y);  // Identificador único pelo x e y

    var coletado = ini_read_real("coletados", id_item, 0);

    ini_close();

    if (coletado == 1) {
        instance_destroy();  // Item já coletado → destruir
    }
}

verificar_item_coletado();
