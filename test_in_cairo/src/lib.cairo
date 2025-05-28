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

// Módulo de pruebas
#[cfg(test)]
mod tests {
    use core::traits::TryInto;
    use snforge_std::*;
    use super::*;

    // Prueba básica de suma
    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }

    // Prueba de función privada
    #[test]
    fn test_internal_adder() {
        let result = internal_adder(3, 3);
        assert_eq!(result, 6);
    }

    // Prueba de struct y trait
    #[test]
    fn test_rectangle() {
        let big = Rectangle { width: 10, height: 10 };
        let small = Rectangle { width: 5, height: 5 };
        assert!(big.can_hold(@small));
        assert!(!small.can_hold(@big));
    }

    // Prueba de Rectangle
    #[test]
    fn test_rectangle_area() {
        let rectangle = Rectangle { width: 5, height: 5 };
        let area = rectangle.area();
        assert_eq!(area, 25);
    }

    // Prueba que debe fallar
    #[test]
    fn test_invalid_number() {
        match create_valid_number(200) {
            Result::Ok(_) => { panic(array!['Should have failed']); },
            Result::Err(e) => {
                // Convertimos el felt252 a array para panic
                panic(array![e]);
            },
        }
    }

    // Prueba costosa, sin #[ignore]
    #[test]
    fn expensive_test() {
        let mut sum: u64 = 0;
        let mut i: u64 = 0;
        loop {
            if i >= 1000 {
                break;
            }
            sum += i;
            i += 1;
        }
        assert_eq!(sum, 499500);
    }
}
