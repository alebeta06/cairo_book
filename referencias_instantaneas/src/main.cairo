use lib::instantanea::run_instantanea;
use lib::referencias_mutables::run_referencias_mutables;

#[executable]
fn main() {
    // Ejecutar el código de instantanea
    run_instantanea();

    // Ejecutar el código de referencias_mutables
    run_referencias_mutables();
}
