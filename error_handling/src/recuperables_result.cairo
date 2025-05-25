use core::result::ResultTrait;
use core::traits::TryInto;

// Función que intenta convertir un felt252 a u8
// Retorna Result<u8, felt252> donde:
// - Ok(u8) si la conversión es exitosa
// - Err(felt252) si la conversión falla (número fuera de rango)
fn parse_u8(s: felt252) -> Result<u8, felt252> {
    match s.try_into() {
        Option::Some(value) => Result::Ok(value),
        Option::None => Result::Err(1) // Usando 1 como código de error
    }
}

// Función que demuestra el uso de unwrap() y expect()
// Esta función está comentada en main() para evitar panic
fn demonstrate_unwrap_and_expect(input: felt252) {
    // Usando unwrap - causará panic si hay error
    let _ = parse_u8(input).unwrap();

    // Usando expect - causará panic con mensaje personalizado si hay error
    let _ = parse_u8(input).expect(2); // Usando 2 como mensaje de error personalizado
}

// Función que demuestra el uso de is_ok() e is_err()
fn check_result_status(input: felt252) -> bool {
    let result = parse_u8(input);
    result.is_ok()
}

// Función que demuestra el uso del operador ? para propagar errores
fn process_number(input: felt252) -> Result<u8, felt252> {
    // El operador ? propagará el error si existe, o desempaquetará el valor si es Ok
    let number: u8 = parse_u8(input)?;

    // Si llegamos aquí, sabemos que number es válido
    let result = number + 1;
    Result::Ok(result)
}

#[executable]
// Función principal que ejecuta todos los ejemplos
pub fn result_examples() {
    // Ejemplo 1: Número válido (5)
    let valid_number: felt252 = 5;
    let is_valid = check_result_status(valid_number);
    println!("Valid number test: {}", is_valid);

    // Ejemplo 2: Número inválido (256)
    let invalid_number: felt252 = 256;
    let is_invalid = check_result_status(invalid_number);
    println!("Invalid number test: {}", is_invalid);

    // Mostramos el resultado final
    if is_valid && !is_invalid {
        println!("Final result: SUCCESS (1)");
    } else {
        println!("Final result: FAILURE (0)");
    }
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
