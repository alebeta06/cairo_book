// Benchmarks dummy para hash functions

#[derive(Drop)]
struct BenchmarkResult {
    pub name: felt252,
    pub time: u32,
}

pub fn benchmark_poseidon() -> BenchmarkResult {
    BenchmarkResult { name: 'poseidon', time: 1 }
}

pub fn benchmark_pedersen() -> BenchmarkResult {
    BenchmarkResult { name: 'pedersen', time: 1 }
}
