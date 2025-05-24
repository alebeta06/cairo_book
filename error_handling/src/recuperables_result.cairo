use debug::PrintTrait;
use option::OptionTrait;
use result::ResultTrait;
use traits::TryInto;

// Función que intenta convertir un felt252 a u8
// Retorna Result<u8, felt252> donde:
// - Ok(u8) si la conversión es exitosa
// - Err(felt252) si la conversión falla (número fuera de rango)
fn parse_u8(s: felt252) -> Result<u8, felt252> {
    match s.try_into() {
        Option::Some(value) => Result::Ok(value),
        Option::None => Result::Err('Invalid integer: number out of u8 range'),
    }
}

// Función que demuestra el uso de unwrap() y expect()
// unwrap() causará panic con mensaje por defecto
// expect() causará panic con mensaje personalizado
fn demonstrate_unwrap_and_expect(input: felt252) {
    println!("Testing unwrap and expect with input: {}", input);

    // Usando unwrap - causará panic si hay error
    let unwrapped = parse_u8(input).unwrap();
    println!("Unwrap successful! Value: {}", unwrapped);

    // Usando expect - causará panic con mensaje personalizado si hay error
    let expected = parse_u8(input).expect('Custom error message for expect');
    println!("Expect successful! Value: {}", expected);
}

// Función que demuestra el uso de is_ok() e is_err()
fn check_result_status(input: felt252) {
    println!("\nChecking result status for input: {}", input);

    let result = parse_u8(input);

    // Verificando si el resultado es Ok
    if result.is_ok() {
        println!("Result is Ok!");
    }

    // Verificando si el resultado es Err
    if result.is_err() {
        println!("Result is Err!");
    }
}

// Función que demuestra el uso del operador ? para propagar errores
fn process_number(input: felt252) -> Result<u8, felt252> {
    // El operador ? propagará el error si existe, o desempaquetará el valor si es Ok
    let number: u8 = parse_u8(input)?;

    // Si llegamos aquí, sabemos que number es válido
    let result = number + 1;
    println!("Processed number successfully: {}", result);

    Result::Ok(result)
}

// Función principal que ejecuta todos los ejemplos
fn main() {
    // Ejemplo 1: Número válido
    println!("=== Testing with valid number (5) ===");
    let valid_number: felt252 = 5;
    check_result_status(valid_number);

    match process_number(valid_number) {
        Result::Ok(value) => println!("Final result: {}", value),
        Result::Err(e) => println!("Error occurred: {}", e),
    }

    // Ejemplo 2: Número inválido (fuera de rango)
    println!("\n=== Testing with invalid number (256) ===");
    let invalid_number: felt252 = 256;
    check_result_status(invalid_number);

    match process_number(invalid_number) {
        Result::Ok(value) => println!("Final result: {}", value),
        Result::Err(e) => println!("Error occurred: {}", e),
    }

    // Ejemplo 3: Demostrando unwrap y expect (esto causará panic)
    println!("\n=== Testing unwrap and expect (will panic) ===");
    // Comentado para evitar que el programa entre en panic
// demonstrate_unwrap_and_expect(256);
}

// Tests para verificar el comportamiento
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_valid_conversion() {
        let number: felt252 = 5;
        let result = parse_u8(number);
        assert(result.is_ok(), 'Should be Ok');
        assert(result.unwrap() == 5, 'Should be 5');
    }

    #[test]
    #[should_panic]
    fn test_invalid_conversion() {
        let number: felt252 = 256;
        let _ = parse_u8(number).unwrap(); // Esto causará panic
    }

    #[test]
    fn test_error_propagation() {
        let number: felt252 = 300;
        let result = process_number(number);
        assert(result.is_err(), 'Should be Err');
    }
}
