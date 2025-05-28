use core::traits::TryInto;
use snforge_std::*; // Necesario para los atributos de prueba

// Estructura para representar un rectángulo
#[derive(Drop, Debug, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64,
}

// Implementación de métodos para Rectangle
impl RectangleImpl of RectangleTrait {
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }

    fn area(self: @Rectangle) -> u64 {
        *self.width * *self.height
    }
}

// Trait para Rectangle
trait RectangleTrait {
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
    fn area(self: @Rectangle) -> u64;
}

// Función pública para sumar dos números
pub fn add(left: u32, right: u32) -> u32 {
    left + right
}

// Ejemplo de función privada
fn internal_adder(a: u32, b: u32) -> u32 {
    a + b
}

// Función pública que usa la función privada
pub fn create_valid_number(value: u64) -> Result<u64, felt252> {
    if validate_number(value) {
        Result::Ok(value)
    } else {
        // Retornamos un número de error simple como felt252
        Result::Err(999) // Puedes cambiar 999 por cualquier valor de error que prefieras
    }
}

// Función privada para validar un número
fn validate_number(value: u64) -> bool {
    value > 0 && value <= 100
}
