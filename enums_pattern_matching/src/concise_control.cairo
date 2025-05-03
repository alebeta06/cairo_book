#[derive(Drop, Copy, Clone)]
enum Moneda {
    Centavo,
    CincoCentavos,
    DiezCentavos,
    VeinticincoCentavos,
}

// Función que devuelve el valor en centavos
fn valor_en_centavos(moneda: Moneda) -> u8 {
    match moneda {
        Moneda::Centavo => 1,
        Moneda::CincoCentavos => 5,
        Moneda::DiezCentavos => 10,
        Moneda::VeinticincoCentavos => 25,
    }
}

// Punto de entrada del programa
#[executable]
pub fn control_conciso() {
    // === if let ===
    let moneda_favorita = Some(Moneda::VeinticincoCentavos);

    // Solo imprimimos si tenemos una moneda
    if let Some(moneda) = moneda_favorita {
        let valor = valor_en_centavos(moneda);
        println!("Tu moneda favorita vale: {} centavos", valor);
    } else {
        println!("No tienes moneda favorita");
    }

    // === while let ===
    let mut monedas = array![
        Moneda::Centavo, Moneda::DiezCentavos, Moneda::VeinticincoCentavos, Moneda::CincoCentavos,
    ];

    let mut total: u8 = 0;

    // Sacamos monedas del array mientras haya
    while let Some(moneda) = monedas.pop_front() {
        total += valor_en_centavos(moneda);
    }

    println!("Valor total de monedas: {} centavos", total);
}
