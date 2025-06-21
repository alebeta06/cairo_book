// ===================================================================
// IMPLEMENTACIÓN DE POSEIDON HASH EN CAIRO (COMPILABLE SIMPLIFICADO)
// ===================================================================
// Poseidon es una función hash criptográfica diseñada específicamente
// para ser eficiente en campos finitos y circuitos aritméticos.

use core::array::ArrayTrait;
use core::option::OptionTrait;
use core::traits::Into;

// ===================================================================
// FUNCIONES AUXILIARES PARA CONSTANTES
// ===================================================================

fn get_round_constants() -> Array<felt252> {
    let mut arr = ArrayTrait::new();
    arr.append(0x1a0b9d6c);
    arr.append(0x2b1c8e7d);
    arr.append(0x3c2d9f8e);
    arr.append(0x4d3e0a9f);
    arr.append(0x5e4f1b0a);
    arr.append(0x6f5a2c1b);
    arr.append(0x7a6b3d2c);
    arr.append(0x8b7c4e3d);
    arr.append(0x9c8d5f4e);
    arr.append(0x0d9e6a5f);
    arr.append(0x1e0f7b6a);
    arr.append(0x2f1a8c7b);
    arr.append(0x3a2b9d8c);
    arr.append(0x4b3c0e9d);
    arr.append(0x5c4d1f0e);
    arr.append(0x6d5e2a1f);
    arr.append(0x7e6f3b2a);
    arr.append(0x8f7a4c3b);
    arr.append(0x9a8b5d4c);
    arr.append(0x0b9c6e5d);
    arr.append(0x1c0d7f6e);
    arr.append(0x2d1e8a7f);
    arr.append(0x3e2f9b8a);
    arr.append(0x4f3a0c9b);
    arr
}

// Parámetros de configuración
const T: usize = 4; // Tamaño del estado
const R_F: usize = 8; // Número de rondas completas
const R_P: usize = 22; // Número de rondas parciales
const TOTAL_ROUNDS: usize = R_F + R_P;

// ===================================================================
// FUNCIÓN S-BOX (SUSTITUCIÓN)
// ===================================================================

fn sbox(x: felt252) -> felt252 {
    let x2 = x * x;
    let x4 = x2 * x2;
    x4 * x
}

fn full_sbox(state: Array<felt252>) -> Array<felt252> {
    let mut result = ArrayTrait::new();
    let mut i = 0;
    let len = ArrayTrait::len(@state);
    loop {
        if i >= len {
            break;
        }
        result.append(sbox(*ArrayTrait::at(@state, i)));
        i += 1;
    }
    result
}

fn partial_sbox(state: Array<felt252>) -> Array<felt252> {
    let mut result = ArrayTrait::new();
    let mut i = 0;
    let len = ArrayTrait::len(@state);
    loop {
        if i >= len {
            break;
        }
        if i == 0 {
            result.append(sbox(*ArrayTrait::at(@state, i)));
        } else {
            result.append(*ArrayTrait::at(@state, i));
        }
        i += 1;
    }
    result
}

// ===================================================================
// FUNCIÓN DE MEZCLA (MIXING)
// ===================================================================

fn mix_layer(state: Array<felt252>) -> Array<felt252> {
    let mut result = ArrayTrait::new();
    let mut i = 0;
    loop {
        if i >= T {
            break;
        }
        let mut sum = 0;
        let mut j = 0;
        loop {
            if j >= T {
                break;
            }
            let multiplier = if i == j {
                2
            } else {
                1
            };
            sum = sum + multiplier * *ArrayTrait::at(@state, j);
            j += 1;
        }
        result.append(sum);
        i += 1;
    }
    result
}

fn add_round_constants(
    state: Array<felt252>, round: usize, round_constants: Array<felt252>,
) -> Array<felt252> {
    let mut result = ArrayTrait::new();
    let mut i = 0;
    let len = ArrayTrait::len(@state);
    loop {
        if i >= len {
            break;
        }
        let idx = round * T + i;
        let constant = if i < T && idx < ArrayTrait::len(@round_constants) {
            *ArrayTrait::at(@round_constants, idx)
        } else {
            0
        };
        result.append(*ArrayTrait::at(@state, i) + constant);
        i += 1;
    }
    result
}

// ===================================================================
// FUNCIÓN PRINCIPAL DE POSEIDON
// ===================================================================

pub fn poseidon_hash(inputs: Array<felt252>) -> Box<@core::felt252> {
    let round_constants = get_round_constants();
    let mut state = ArrayTrait::new();
    let mut i = 0;
    loop {
        if i >= T {
            break;
        }
        let value = if i < ArrayTrait::len(@inputs) {
            *ArrayTrait::at(@inputs, i)
        } else {
            0
        };
        state.append(value);
        i += 1;
    }
    let mut round = 0;
    loop {
        if round >= R_F / 2 {
            break;
        }
        state = add_round_constants(state, round, round_constants.clone());
        state = full_sbox(state);
        state = mix_layer(state);
        round += 1;
    }
    loop {
        if round >= R_F / 2 + R_P {
            break;
        }
        state = add_round_constants(state, round, round_constants.clone());
        state = partial_sbox(state);
        state = mix_layer(state);
        round += 1;
    }
    loop {
        if round >= TOTAL_ROUNDS {
            break;
        }
        state = add_round_constants(state, round, round_constants.clone());
        state = full_sbox(state);
        state = mix_layer(state);
        round += 1;
    }
    OptionTrait::unwrap(ArrayTrait::get(@state, 0))
}

pub fn poseidon_hash_many(elements: Array<felt252>) -> Box<@core::felt252> {
    poseidon_hash(elements)
}

pub fn poseidon_hash_two(a: felt252, b: felt252) -> Box<@core::felt252> {
    let mut arr = ArrayTrait::new();
    arr.append(a);
    arr.append(b);
    poseidon_hash(arr)
}

pub fn poseidon_hash_three(a: felt252, b: felt252, c: felt252) -> Box<@core::felt252> {
    let mut arr = ArrayTrait::new();
    arr.append(a);
    arr.append(b);
    arr.append(c);
    poseidon_hash(arr)
}

pub fn poseidon_hash_one(a: felt252) -> Box<@core::felt252> {
    let mut arr = ArrayTrait::new();
    arr.append(a);
    poseidon_hash(arr)
}
