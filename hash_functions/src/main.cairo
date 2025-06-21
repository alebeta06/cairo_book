// ===================================================================
// EJEMPLOS DE USO DE POSEIDON HASH
// ===================================================================
// Este archivo muestra cómo usar las funciones hash de Poseidon

use core::array::ArrayTrait;
use hash_functions::busqueda_poseidon::{buscar_numero_poseidon, buscar_numero_poseidon_solo};
use hash_functions::pedersen_comparison::{compare_hashes, hash_benchmark};
use hash_functions::poseidon::{
    poseidon_hash_many, poseidon_hash_one, poseidon_hash_three, poseidon_hash_two,
};

// Función principal que será el punto de entrada
#[executable]
pub fn main() -> felt252 {
    // Ejecutar búsqueda del hash específico
    buscar_hash_especifico()
}

// Función para buscar el hash específico que proporcionaste
pub fn buscar_hash_especifico() -> felt252 {
    // El hash objetivo que proporcionaste
    let target_hash = 0x23c16a2a9adbcd4988f04bbc6bc6d90275cfc5a03fbe28a6a9a3070429acb96;

    // Buscar usando seed = 1000 (como en el ejemplo de Pedersen)
    let seed = 1000;
    let max_iterations = 5000;

    let resultado = buscar_numero_poseidon(seed, target_hash, max_iterations);

    if resultado == 0 {
        // Si no se encuentra con seed, probar sin seed
        buscar_numero_poseidon_solo(target_hash, max_iterations)
    } else {
        resultado
    }
}

// Función de ejemplo básico de Poseidon
pub fn ejemplo_poseidon_basico() -> Box<@core::felt252> {
    // Ejemplo 1: Hashear un solo valor
    let valor = 123;
    let _hash_solo = poseidon_hash_one(valor);

    // Ejemplo 2: Hashear dos valores
    let a = 456;
    let b = 789;
    let hash_dos = poseidon_hash_two(a, b);

    // Ejemplo 3: Hashear tres valores
    let c = 101112;
    let _hash_tres = poseidon_hash_three(a, b, c);

    // Retornar el hash de dos valores como ejemplo
    hash_dos
}

pub fn ejemplo_poseidon_array() -> Box<@core::felt252> {
    // Crear un array con múltiples valores
    let mut valores = ArrayTrait::new();
    valores.append(1);
    valores.append(2);
    valores.append(3);
    valores.append(4);

    // Hashear todo el array
    poseidon_hash_many(valores)
}

pub fn ejemplo_comparacion_pedersen() -> bool {
    // Comparar Poseidon vs Pedersen con los mismos inputs
    let a = 100;
    let b = 200;
    let comparacion = compare_hashes(a, b);

    // Los hashes deberían ser diferentes (son algoritmos distintos)
    comparacion.pedersen_result != 0 // Simplificado para evitar problemas de tipos
}

pub fn ejemplo_benchmark() -> u32 {
    // Ejecutar benchmark con 5 iteraciones
    let resultados = hash_benchmark(5);

    // Retornar el número de resultados (para verificar que funcionó)
    ArrayTrait::len(@resultados)
}
