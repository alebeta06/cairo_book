// Definimos una enumeración para representar diferentes monedas
#[derive(Drop, Copy, Clone)]
enum Moneda {
    Centavo, // Representa 1 centavo
    CincoCentavos, // Representa 5 centavos
    DiezCentavos, // Representa 10 centavos
    VeinticincoCentavos // Representa 25 centavos
}

// Función que devuelve el valor en centavos de una moneda
fn valor_en_centavos(moneda: Moneda) -> u8 {
    match moneda {
        Moneda::Centavo => 1,
        Moneda::CincoCentavos => 5,
        Moneda::DiezCentavos => 10,
        Moneda::VeinticincoCentavos => 25,
    }
}

// Definimos una enumeración para representar los días de la semana
#[derive(Drop)]
enum Dia {
    Lunes,
    Martes,
    Miercoles,
    Jueves,
    Viernes,
    Sabado,
    Domingo,
}

// Función que determina si una moneda es aceptada en una máquina expendedora
// dependiendo del día de la semana
fn aceptar_moneda(dia: Dia, moneda: Moneda) -> bool {
    match (dia, moneda) {
        // Acepta todas las monedas de lunes a viernes
        (Dia::Lunes, _) => true,
        (Dia::Martes, _) => true,
        (Dia::Miercoles, _) => true,
        (Dia::Jueves, _) => true,
        (Dia::Viernes, _) => true,
        // Solo acepta DiezCentavos y VeinticincoCentavos los fines de semana
        (Dia::Sabado, Moneda::DiezCentavos) => true,
        (Dia::Sabado, Moneda::VeinticincoCentavos) => true,
        (Dia::Domingo, Moneda::DiezCentavos) => true,
        (Dia::Domingo, Moneda::VeinticincoCentavos) => true,
        // No acepta otras monedas los fines de semana
        _ => false,
    }
}

// Función principal del programa
#[executable]
pub fn control_de_flujo() {
    // Creamos una moneda de 10 centavos
    let moneda = Moneda::DiezCentavos;
    // Obtenemos su valor en centavos
    let valor = valor_en_centavos(moneda);
    // Imprimimos el valor
    println!("Valor de la moneda: {} centavos", valor);

    // Verificamos si la moneda es aceptada el lunes
    let aceptada_lunes = aceptar_moneda(Dia::Lunes, moneda);
    println!("Aceptada el lunes? {}", aceptada_lunes);

    // Verificamos si la moneda es aceptada el domingo
    let aceptada_domingo = aceptar_moneda(Dia::Domingo, moneda);
    println!("Aceptada el domingo? {}", aceptada_domingo);

    // Creamos una moneda de 1 centavo
    let moneda2 = Moneda::Centavo;
    // Verificamos si la moneda de 1 centavo es aceptada el domingo
    let aceptada_domingo2 = aceptar_moneda(Dia::Domingo, moneda2);
    println!("Moneda de 1 centavo aceptada el domingo? {}", aceptada_domingo2);
}
