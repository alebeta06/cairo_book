// ===================================================================
// BÚSQUEDA DEL NÚMERO SECRETO USANDO HASH PEDERSEN
// ===================================================================
// Este programa busca un número que, al ser hasheado con Pedersen
// junto con un seed, produzca un hash objetivo específico.

// Importamos la función pedersen del módulo core de Cairo
// Esta función toma dos parámetros felt252 y retorna un hash felt252
use core::pedersen::pedersen;

// Función principal del programa
fn main() {
    // ===================================================================
    // CONFIGURACIÓN INICIAL - Los datos que tenemos
    // ===================================================================

    // SEED: Valor fijo que usaremos como primer parámetro de pedersen
    // Este valor nos fue dado en el problema
    let seed = 1000;

    // TARGET_HASH: El hash objetivo que estamos buscando
    // Sabemos que existe un número que, combinado con seed=1000,
    // produce exactamente este hash cuando se pasa por pedersen
    let target_hash = 0x23c16a2a9adbcd4988f04bbc6bc6d90275cfc5a03fbe28a6a9a3070429acb96;

    // ===================================================================
    // CONFIGURACIÓN DE LA BÚSQUEDA
    // ===================================================================

    // CONTADOR: Variable que iremos incrementando para probar cada número
    // Empezamos desde 1 y vamos subiendo hasta encontrar la respuesta
    // Usamos u16 (0 a 65535) que es suficiente para nuestro caso
    // 'mut' significa que podemos modificar esta variable
    let mut n: u16 = 1;

    // ===================================================================
    // ALGORITMO DE BÚSQUEDA BRUTA (BRUTE FORCE)
    // ===================================================================

    // BUCLE INFINITO: Seguimos hasta encontrar la respuesta o hasta el límite
    loop {
        // CÁLCULO DEL HASH: Para el número actual 'n'
        // pedersen(seed, n) = pedersen(1000, n)
        // .into() convierte u16 a felt252 (tipo requerido por pedersen)
        let hash = pedersen(seed, n.into());

        // VERIFICACIÓN: ¿Es este el hash que buscamos?
        if hash == target_hash {
            // ¡ÉXITO! Encontramos el número secreto
            // Este 'n' es la respuesta al problema
            println!("El numero secreto es: {}", n);

            // Salimos del programa exitosamente
            return;
        }

        // LÍMITE DE SEGURIDAD: Evitamos búsqueda infinita
        // Si llegamos a 5000 sin encontrar nada, algo está mal
        if n == 5000 {
            println!("No se encontro ningun numero valido.");
            // Salimos del programa con mensaje de error
            return;
        }

        // INCREMENTO: Probamos el siguiente número
        // n = 1, luego n = 2, luego n = 3, etc.
        n += 1;
    }
    // ===================================================================
// EXPLICACIÓN DEL ALGORITMO:
// ===================================================================
// 1. Probamos: pedersen(1000, 1) == target_hash? NO
// 2. Probamos: pedersen(1000, 2) == target_hash? NO
// 3. Probamos: pedersen(1000, 3) == target_hash? NO
// ...
// 2023. Probamos: pedersen(1000, 2023) == target_hash? ¡SÍ!
//
// Resultado: El número secreto es 2023
// ===================================================================
}
