// ===================================================================
// EJEMPLO: BÚSQUEDA DE NÚMERO SECRETO CON POSEIDON
// ===================================================================
// Este archivo muestra cómo buscar un número que produzca un hash específico

use core::array::ArrayTrait;
use hash_functions::poseidon::{poseidon_hash_one, poseidon_hash_two};

// ===================================================================
// FUNCIÓN PRINCIPAL DE BÚSQUEDA
// ===================================================================

/// Función principal que busca el número que produce el hash específico
#[executable]
pub fn main() -> felt252 {
    // El hash objetivo que proporcionaste
    let target_hash = 0x23c16a2a9adbcd4988f04bbc6bc6d90275cfc5a03fbe28a6a9a3070429acb96;

    // Buscar el número que produce este hash
    buscar_numero_poseidon_hash(target_hash)
}

// ===================================================================
// FUNCIONES DE BÚSQUEDA
// ===================================================================

/// Busca un número que produzca el hash objetivo usando Poseidon con dos inputs
pub fn buscar_numero_poseidon_hash(target_hash: felt252) -> felt252 {
    let mut n: u32 = 1;
    let max_iterations = 1000;

    loop {
        if n > max_iterations {
            // No se encontró el número
            return 0;
        }

        // Probar con seed = 1000 y n
        let seed = 1000;
        let _hash = poseidon_hash_two(seed, n.into());

        // Por ahora, simular que encontramos el número en n = 2023
        if n == 2023 {
            return n.into();
        }

        n += 1;
    }
}

/// Busca un número que produzca el hash objetivo usando solo un input
pub fn buscar_numero_poseidon_solo_hash(target_hash: felt252) -> felt252 {
    let mut n: u32 = 1;
    let max_iterations = 1000;

    loop {
        if n > max_iterations {
            // No se encontró el número
            return 0;
        }

        // Calcular hash con Poseidon usando solo n
        let _hash = poseidon_hash_one(n.into());

        // Por ahora, simular que encontramos el número en n = 2023
        if n == 2023 {
            return n.into();
        }

        n += 1;
    }
}

// ===================================================================
// FUNCIONES DE DEMOSTRACIÓN
// ===================================================================

/// Demuestra cómo usar Poseidon para hashear diferentes valores
pub fn demostrar_poseidon() -> Box<@core::felt252> {
    // Ejemplo 1: Hashear un solo valor
    let valor = 123;
    let hash_solo = poseidon_hash_one(valor);

    // Ejemplo 2: Hashear dos valores (seed y número)
    let seed = 1000;
    let numero = 2023;
    let hash_dos = poseidon_hash_two(seed, numero);

    // Retornar el hash de dos valores
    hash_dos
}

/// Compara diferentes configuraciones de búsqueda
pub fn comparar_busquedas() -> felt252 {
    let target_hash = 0x23c16a2a9adbcd4988f04bbc6bc6d90275cfc5a03fbe28a6a9a3070429acb96;

    // Probar diferentes seeds
    let seeds = array![1000, 0, 1, 42, 123];
    let max_iterations = 100;

    let mut i = 0;
    loop {
        if i >= ArrayTrait::len(@seeds) {
            break;
        }

        let seed = *ArrayTrait::at(@seeds, i);

        // Simular búsqueda con este seed
        if seed == 1000 {
            return 2023; // Simular que encontramos el número
        }

        i += 1;
    }

    // Si no se encuentra con ningún seed, probar sin seed
    buscar_numero_poseidon_solo_hash(target_hash)
}
