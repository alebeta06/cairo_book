// Función principal que calcula el número de Fibonacci en la posición 16
#[executable]
fn main() -> u32 {
    let result = fib(16);
    result
}

// Función que calcula el número de Fibonacci en la posición n
// La secuencia de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
fn fib(mut n: u32) -> u32 {
    // Inicializamos los dos primeros números de la secuencia
    let mut a: u32 = 0; // Primer número
    let mut b: u32 = 1; // Segundo número

    // Iteramos n veces para calcular el número de Fibonacci
    while n != 0 {
        n = n - 1; // Decrementamos el contador
        let temp = b; // Guardamos el valor actual de b
        b = a + b; // Calculamos el siguiente número sumando los dos anteriores
        a = temp; // Movemos el valor anterior de b a a
    }
    a // Retornamos el número de Fibonacci en la posición n
}

// Módulo de pruebas
#[cfg(test)]
mod tests {
    use super::fib;

    // Prueba que verifica que fib(16) retorna 987
    #[test]
    fn it_works() {
        assert(fib(16) == 987, 'it works!');
    }
}
