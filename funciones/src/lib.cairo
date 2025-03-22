#[executable]
fn main() {
    // Imprime "Hello, world!" en la consola.
    println!("Hello, world!");

    // Llama a 'another_function' pasando el valor 5 (se interpreta como felt252)
    another_function(5);

    // Llama a 'print_labeled_measurement' pasando el valor 5 y la cadena "h"
    print_labeled_measurement(5, "h");

    // Llama a la función 'five', la cual retorna un u32 (en este caso, 17), y almacena el
    // resultado en 'x'.
    let x = five();
    println!("The value of x is: {}", x);

    // Llama a 'plus_one' pasando 7, lo que suma 1 y retorna 8; almacena el resultado en 'a'.
    let a = plus_one(7);
    println!("The value of x is: {}", a);
}

// Declaración de funciones
// Función que imprime el valor recibido; el parámetro 'x' es de tipo felt252.
fn another_function(x: felt252) {
    println!("The value of x is: {}", x);
}

// Función que imprime un valor junto con una etiqueta. El 'value' es un u128 y 'unit_label' es un
// ByteArray.
// Se utiliza la interpolación para combinar el valor y la etiqueta en la impresión.
fn print_labeled_measurement(value: u128, unit_label: ByteArray) {
    println!("The measurement is: {value}{unit_label}");
}

// Función que retorna un valor u32 fijo. En este caso, retorna 17.
fn five() -> u32 {
    17
}

// Función que toma un valor u32, le suma 1 y retorna el resultado.
fn plus_one(a: u32) -> u32 {
    a + 1
}
