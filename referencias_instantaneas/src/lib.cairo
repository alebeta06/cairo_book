#[executable]
fn main() {
    // Se crea una matriz vacía de tipo Array<u128> usando la macro array!
    let mut arr1: Array<u128> = array![];

    // Se toma una "instantánea" de la matriz en este momento.
    // La sintaxis `@arr1` crea una referencia inmutable (snapshot) del estado actual de la matriz.
    let first_snapshot = @arr1;

    // Se modifica la matriz original agregando el valor 1 al final.
    arr1.append(1);

    // Se calcula la longitud de la matriz utilizando la instantánea tomada antes de la
    // modificación.
    // Esto devuelve la cantidad de elementos que tenía la matriz en ese momento.
    let first_length = calculate_length(first_snapshot);

    // Se calcula la longitud actual de la matriz (después de haber agregado el 1).
    let second_length = calculate_length(@arr1);

    // Se imprime la longitud que tenía la matriz en el momento de la instantánea.
    println!("La longitud de la matriz en el momento de la instantanea es {}", first_length);

    // Se imprime la longitud actual de la matriz.
    println!("La longitud actual de la matriz es {}", second_length);
}

// Función que recibe una instantánea de una matriz de u128 y devuelve su longitud (número de
// elementos)
fn calculate_length(arr: @Array<u128>) -> usize {
    arr.len()
}
