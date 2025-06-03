// Funciones en Cairo
// ----------------
// Este ejemplo demuestra el uso de funciones en Cairo.
// Nota: Los closures estan siendo introducidos en Cairo 2.9+ pero aun estan en desarrollo.
use core::debug::PrintTrait;
use core::array::ArrayTrait;

// Ejemplo 1: Definicion basica de funcion
fn double(x: u8) -> u8 {
    x * 2
}

fn example_basic_function() {
    println!("El doble de 2 es {}", double(2));
    println!("El doble de 4 es {}", double(4));
}

// Ejemplo 2: Funcion con multiples argumentos
fn sum(x: u32, y: u32, z: u32) -> u32 {
    x + y + z
}

fn example_function_with_types() {
    println!("Resultado: {}", sum(1, 2, 3));
}

// Ejemplo 3: Uso de variables externas
fn multiply_by_x(x: u32, value: u32) -> u32 {
    x * (value + 3)
}

fn example_capture_environment() {
    let x: u32 = 8;
    println!("Resultado: {}", multiply_by_x(x, 1));
}

// Ejemplo 4: Comparacion de funciones
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

