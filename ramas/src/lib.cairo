#[executable]
fn main() {
    // Declaramos una variable 'number' con el valor 3
    let number = 3;

    // Sentencia if-else para comprobar el valor de 'number'
    if number == 5 {
        // Si 'number' es 5, se imprime este mensaje
        println!("condition was true and number = {}", number);
    } else {
        // Si 'number' NO es 5, se imprime este mensaje
        println!("condition was false and number = {}", number);
    }

    // Declaramos otra variable 'numero' con el valor 7
    let numero = 7;

    // Sentencias if-else if-else para evaluar diferentes condiciones
    if numero == 12 {
        // Si 'numero' es 12, se imprime este mensaje
        println!("numero is 12");
    } else if numero == 7 {
        // Si 'numero' es 7, se imprime este mensaje
        println!("numero is 7");
    } else if numero - 2 == 5 {
        // Si 'numero - 2' es igual a 5, se imprime este mensaje
        println!("numero mix 2 is 5");
    } else {
        // Si ninguna de las condiciones anteriores se cumple, se ejecuta este bloque
        println!("numero not found");
    }

    // Declaramos una variable booleana 'condition' con valor 'true'
    let condition = true;

    // Asignamos a 'otro_num' el valor de 9 si 'condition' es true, o 6 si es false
    let otro_num = if condition {
        9 // Si 'condition' es true, 'otro_num' será 9
    } else {
        6 // Si 'condition' es false, 'otro_num' será 6
    };

    // Si 'otro_num' es 9, se imprime el siguiente mensaje
    if otro_num == 9 {
        println!("condition was true and number is {}", otro_num);
    }
}
//salidas por consola

//condition was false and number = 3
//numero is 7
//condition was true and number is 9

