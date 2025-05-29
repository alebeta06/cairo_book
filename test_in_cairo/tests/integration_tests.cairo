use snforge_std::*;
use test_in_cairo::{add, create_valid_number};

// Prueba de integración que usa create_valid_number:
// Llama a create_valid_number(50) (un valor válido) y verifica que se devuelva Ok(50).
// Si se devuelve un error, se hace panic con el mensaje "Should not have failed".
#[test]
fn test_valid_number_integration() {
    match create_valid_number(50) {
        Result::Ok(value) => { assert_eq!(value, 50); },
        Result::Err(_) => { panic(array!['Should not have failed']); },
    }
}

// Prueba de integración que verifica el manejo de errores:
// Llama a create_valid_number(200) (un valor inválido) y se espera que se devuelva un error (por
// ejemplo, 999).
// Si se devuelve Ok, se hace panic con el mensaje "Should have failed".
// Si se devuelve un error, se verifica (assert) que el valor del error sea 999.
#[test]
fn test_invalid_number_integration() {
    match create_valid_number(200) {
        Result::Ok(_) => { panic(array!['Should have failed']); },
        Result::Err(e) => { assert_eq!(e, 999); },
    }
}

// Prueba de integración que usa la función add:
// Llama a add(10, 5) y verifica que el resultado sea 15.
#[test]
fn integration_add() {
    let result = add(10, 5);
    assert_eq!(result, 15);
}
