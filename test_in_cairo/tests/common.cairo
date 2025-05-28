// Suma dos números
pub fn add(left: u32, right: u32) -> u32 {
    left + right
}

// Ejemplo de función privada
fn internal_adder(a: u32, b: u32) -> u32 {
    a + b
}

// Estructura y trait para ejemplo de pruebas con structs
#[derive(Drop, Debug, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64,
}

trait RectangleTrait {
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
}

impl RectangleImpl of RectangleTrait {
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }
}

// Módulo de pruebas unitarias
#[cfg(test)]
mod tests {
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
}
