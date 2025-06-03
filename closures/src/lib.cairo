// Funciones en Cairo
// ----------------
// Este ejemplo demuestra el uso de funciones en Cairo.
// Nota: Los closures estan siendo introducidos en Cairo 2.9+ pero aun estan en desarrollo.
// Cuando esten disponibles, los closures permitiran una sintaxis mas concisa y flexible.
use core::debug::PrintTrait;
use core::array::ArrayTrait;

// Ejemplo 1: Definicion basica de funcion
// En un closure seria:
// let double = |x: u8| -> u8 { x * 2 };
// o mas conciso:
// let double = |x| x * 2;  // inferencia de tipos
fn double(x: u8) -> u8 {
    x * 2
}

fn example_basic_function() {
    println!("El doble de 2 es {}", double(2));
    println!("El doble de 4 es {}", double(4));
}

// Ejemplo 2: Funcion con multiples argumentos
// En un closure seria:
// let sum = |x: u32, y: u32, z: u32| -> u32 { x + y + z };
// o mas conciso:
// let sum = |x, y, z| x + y + z;  // inferencia de tipos
fn sum(x: u32, y: u32, z: u32) -> u32 {
    x + y + z
}

fn example_function_with_types() {
    println!("Resultado: {}", sum(1, 2, 3));
}

// Ejemplo 3: Uso de variables externas (captura de entorno)
// En un closure seria:
// let x = 8;
// let multiply_by_x = |value| x * (value + 3);  // x es capturado del entorno
// La ventaja es que no necesitamos pasar x como parametro
fn multiply_by_x(x: u32, value: u32) -> u32 {
    x * (value + 3)
}

fn example_capture_environment() {
    let x: u32 = 8;
    println!("Resultado: {}", multiply_by_x(x, 1));
}

// Ejemplo 4: Comparacion de funciones
// En closures, todas estas funciones serian equivalentes a:
// let add_one = |x| x + 1;
// Y podriamos usarlas directamente en operaciones como:
// let result = numbers.map(|x| x + 1);
fn add_one_v1(x: u32) -> u32 {
    x + 1
}

fn add_one_v2(x: u32) -> u32 {
    x + 1
}

fn add_one_v3(x: u32) -> u32 {
    x + 1
}

fn add_one_v4(x: u32) -> u32 {
    x + 1
}

fn example_function_comparison() {
    println!("add_one_v1(5) = {}", add_one_v1(5));
    println!("add_one_v2(5) = {}", add_one_v2(5));
    println!("add_one_v3(5) = {}", add_one_v3(5));
    println!("add_one_v4(5) = {}", add_one_v4(5));
}

// Ejemplo 5: Operaciones con arrays
// Con closures, estas operaciones serian mucho mas concisas:
// let doubled = numbers.map(|x| x * 2);
// let even = numbers.filter(|x| x % 2 == 0);
// Y podriamos encadenarlas:
// let result = numbers
//     .filter(|x| x % 2 == 0)
//     .map(|x| x * 2);
fn example_array_operations() {
    let mut arr1 = ArrayTrait::new();
    arr1.append(1_u32);
    arr1.append(2_u32);
    arr1.append(3_u32);

    let mut arr2 = ArrayTrait::new();
    arr2.append(3_u32);
    arr2.append(4_u32);
    arr2.append(5_u32);
    arr2.append(6_u32);

    // Duplicar cada elemento
    // Con closure: arr1.map(|x| x * 2)
    let mut doubled = ArrayTrait::new();
    let mut i: u32 = 0;
    loop {
        match arr1.pop_front() {
            Option::Some(x) => {
                doubled.append(x * 2);
                i += 1;
            },
            Option::None => { break; }
        };
        if i >= 3 {
            break;
        }
    };

    // Filtrar numeros pares
    // Con closure: arr2.filter(|x| x % 2 == 0)
    let mut even = ArrayTrait::new();
    let mut i: u32 = 0;
    loop {
        match arr2.pop_front() {
            Option::Some(x) => {
                if x % 2 == 0 {
                    even.append(x);
                }
                i += 1;
            },
            Option::None => { break; }
        };
        if i >= 4 {
            break;
        }
    };

    println!("Array original: {:?}", arr1);
    println!("Array duplicado: {:?}", doubled);
    println!("Numeros pares: {:?}", even);
}

#[executable]
fn main() {
    println!("--- Ejemplo 1: Definicion basica de funcion ---");
    example_basic_function();
    println!("\n--- Ejemplo 2: Funcion con tipos ---");
    example_function_with_types();
    println!("\n--- Ejemplo 3: Uso de variables externas ---");
    example_capture_environment();
    println!("\n--- Ejemplo 4: Comparacion de funciones ---");
    example_function_comparison();
    println!("\n--- Ejemplo 5: Operaciones con arrays ---");
    example_array_operations();
}

