// ===================================================================
// FUNCIONES HASH CRIPTOGRÁFICAS EN CAIRO
// ===================================================================
// Este módulo implementa y compara diferentes funciones hash criptográficas
// incluyendo Poseidon y Pedersen para uso en contextos de ZKP.

mod benchmarks;
mod busqueda_poseidon;
mod ejemplo_busqueda;
mod examples;
mod pedersen_comparison;
mod poseidon;
pub use benchmarks::{benchmark_pedersen, benchmark_poseidon};
pub use busqueda_poseidon::{buscar_numero_poseidon, buscar_numero_poseidon_solo};
pub use examples::{merkle_tree_example, zkp_example};
pub use pedersen_comparison::{compare_hashes, hash_benchmark};

// Re-exportar las funciones principales para fácil acceso
pub use poseidon::{poseidon_hash, poseidon_hash_many};
