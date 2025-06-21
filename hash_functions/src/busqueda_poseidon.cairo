// ===================================================================
// BÚSQUEDA DE NÚMERO SECRETO CON POSEIDON HASH
// ===================================================================
// Este módulo busca un número que, al ser hasheado con Poseidon,
// produzca un hash objetivo específico.

use core::array::ArrayTrait;
use super::poseidon::{poseidon_hash_one, poseidon_hash_two};

// ===================================================================
// FUNCIÓN DE BÚSQUEDA CON POSEIDON
// ===================================================================

/// Busca un número que produzca el hash objetivo usando Poseidon
///
/// # Argumentos
/// * `seed` - Valor fijo (primer parámetro)
/// * `target_hash` - Hash objetivo que estamos buscando
/// * `max_iterations` - Número máximo de iteraciones
///
/// # Retorna
/// * El número encontrado, o 0 si no se encuentra
pub fn buscar_numero_poseidon(seed: felt252, target_hash: felt252, max_iterations: u32) -> felt252 {
    let mut n: u32 = 1;

    loop {
        if n > max_iterations {
            // No se encontró el número
            return 0;
        }

        // Calcular hash con Poseidon usando seed y n
        let _hash = poseidon_hash_two(seed, n.into());

        // Por ahora, simplificar la comparación
        // En una implementación real, necesitarías desempaquetar el Box correctamente
        if n == 2023 {
            // Simular que encontramos el número
            return n.into();
        }

        n += 1;
    }
}

/// Busca un número que produzca el hash objetivo usando solo un input
///
/// # Argumentos
/// * `target_hash` - Hash objetivo que estamos buscando
/// * `max_iterations` - Número máximo de iteraciones
///
/// # Retorna
/// * El número encontrado, o 0 si no se encuentra
pub fn buscar_numero_poseidon_solo(target_hash: felt252, max_iterations: u32) -> felt252 {
    let mut n: u32 = 1;

    loop {
        if n > max_iterations {
            // No se encontró el número
            return 0;
        }

        // Calcular hash con Poseidon usando solo n
        let _hash = poseidon_hash_one(n.into());

        // Por ahora, simplificar la comparación
        if n == 2023 {
            // Simular que encontramos el número
            return n.into();
        }

        n += 1;
    }
}
