use core::traits::TryInto;
use snforge_std::*;
use test_in_cairo::{add, create_valid_number};

// Prueba de integración que usa create_valid_number
#[test]
fn test_valid_number_integration() {
    match create_valid_number(50) {
        Result::Ok(value) => { assert_eq!(value, 50); },
        Result::Err(_) => { panic(array!['Should not have failed']); },
    }
}

// Prueba de integración que verifica el manejo de errores
#[test]
fn test_invalid_number_integration() {
    match create_valid_number(200) {
        Result::Ok(_) => { panic(array!['Should have failed']); },
        Result::Err(e) => { panic(array![e]); },
    }
}

// Prueba de integración que usa la función add
#[test]
fn integration_add() {
    let result = add(10, 5);
    assert_eq!(result, 15);
}
