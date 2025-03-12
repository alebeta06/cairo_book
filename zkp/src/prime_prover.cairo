/// Función que verifica si un número es primo.
/// Recibe un número de tipo u128 y retorna true si es primo, false en caso contrario.
fn is_prime(n: u128) -> bool {
    // Imprime el número que se va a verificar.
    println!("Verificando si {} es primo", n);

    // Si el número es menor o igual a 1, no es primo.
    if n <= 1 {
        println!("{} no es primo porque es menor o igual a 1", n);
        return false;
    }

    // El número 2 es primo.
    if n == 2 {
        println!("{} es primo (caso especial: 2)", n);
        return true;
    }

    // Si el número es par y no es 2, no es primo.
    if n % 2 == 0 {
        println!("{} es par y no es 2, por lo tanto no es primo", n);
        return false;
    }

    // Inicializamos el divisor 'i' en 3 (primer número impar para probar).
    let mut i = 3;
    // Inicializamos la variable 'prime' en true. Se cambiará a false si se encuentra algún
    // divisor.
    let mut prime = true;

    // Iniciamos un bucle para probar divisores impares hasta la raíz cuadrada de n.
    loop {
        // Si i*i es mayor que n, ya no hay divisores posibles en el rango.
        if i * i > n {
            println!(
                "No se encontro divisor menor o igual a la raiz cuadrada de {}. Entonces, {} es primo.",
                n,
                n,
            );
            break;
        }
        // Imprime el divisor actual que se está probando.
        println!("Probando divisor: {}", i);

        // Si n es divisible por i, entonces n no es primo.
        if n % i == 0 {
            println!("Encontrado divisor {}: {} es divisible entre {}. No es primo.", i, n, i);
            prime = false;
            break;
        }
        // Incrementa i en 2 para pasar al siguiente número impar.
        i += 2;
    };

    // Retorna el resultado de la verificación (true si es primo, false si no lo es).
    prime
}

/// Función principal, punto de entrada del programa.
/// Esta función recibe un número (input) de tipo u128 y retorna un booleano:
/// - true: si el número es primo.
/// - false: si el número no es primo.
///
/// Para este ejemplo, se espera que al pasar el número 17, el programa demuestre que 17 es primo.
#[executable]
pub fn n_primo(input: u128) -> bool {
    // Imprime el número de entrada.
    println!("Numero de entrada: {}", input);

    // Verifica que la entrada no sea demasiado grande; en este caso, mayor a 1,000,000.
    if input > 1000000 {
        // Si es mayor, se detiene la ejecución con un pánico y se muestra un mensaje de error.
        panic!("Entrada demasiado grande, debe ser <= 1,000,000");
    }

    // Llama a la función is_prime para determinar si el número es primo y almacena el resultado.
    let resultado = is_prime(input);

    // Imprime el resultado final.
    println!("Resultado: {} es primo? {}", input, resultado);

    // Retorna el resultado para que pueda ser utilizado en la prueba de conocimiento cero.
    resultado
}
