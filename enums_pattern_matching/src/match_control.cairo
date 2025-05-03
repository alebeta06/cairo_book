// Declaramos un enum llamado Moneda para representar distintas denominaciones
// Derivamos Drop, Copy y Clone para poder copiar y pasar los valores fácilmente
#[derive(Drop, Copy, Clone)]
enum Moneda {
    Centavo, // Representa 1 centavo
    CincoCentavos, // Representa 5 centavos
    DiezCentavos, // Representa 10 centavos
    VeinticincoCentavos // Representa 25 centavos
}
// Función que recibe una Moneda y devuelve su valor en centavos como tipo u8
fn valor_en_centavos(moneda: Moneda) -> u8 {
    match moneda {
        Moneda::Centavo => 1,
        Moneda::CincoCentavos => 5,
        Moneda::DiezCentavos => 10,
        Moneda::VeinticincoCentavos => 25,
    }
}
// Definimos los días de la semana con un enum llamado Dia
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

// Función que indica si una moneda es aceptada dependiendo del día de la semana
fn aceptar_moneda(dia: Dia, moneda: Moneda) -> bool {
    match (dia, moneda) {
        // De lunes a viernes se aceptan todas las monedas
        (Dia::Lunes, _) => true,
        (Dia::Martes, _) => true,
        (Dia::Miercoles, _) => true,
        (Dia::Jueves, _) => true,
        (Dia::Viernes, _) => true,
        // El sábado y domingo solo se aceptan monedas de 10 y 25 centavos
        (Dia::Sabado, Moneda::DiezCentavos) => true,
        (Dia::Sabado, Moneda::VeinticincoCentavos) => true,
        (Dia::Domingo, Moneda::DiezCentavos) => true,
        (Dia::Domingo, Moneda::VeinticincoCentavos) => true,
        // Cualquier otro caso devuelve false
        _ => false,
    }
}

// Esta es la función ejecutable principal
#[executable]
pub fn control_de_flujo() {
    let moneda = Moneda::DiezCentavos; // Creamos una moneda de 10 centavos
    let valor = valor_en_centavos(moneda); // Obtenemos su valor
    println!("Valor de la moneda: {} centavos", valor); // Mostramos el valor

    // Verificamos si se acepta el lunes
    let aceptada_lunes = aceptar_moneda(Dia::Lunes, moneda);
    println!("Aceptada el lunes? {}", aceptada_lunes);

    // Verificamos si se acepta el domingo
    let aceptada_domingo = aceptar_moneda(Dia::Domingo, moneda);
    println!("Aceptada el domingo? {}", aceptada_domingo);

    // Probamos con una moneda de 1 centavo el domingo
    let moneda2 = Moneda::Centavo;
    let aceptada_domingo2 = aceptar_moneda(Dia::Domingo, moneda2);
    println!("Moneda de 1 centavo aceptada el domingo? {}", aceptada_domingo2);
}
//Salida por consola

//~/cairo_book/enums_pattern_matching$ scarb execute --executable-name control_de_flujo

//Valor de la moneda: 10 centavos
//Aceptada el lunes? true
//Aceptada el domingo? true
//Moneda de 1 centavo aceptada el domingo? false


