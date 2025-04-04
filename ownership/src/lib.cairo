#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

// Función que recibe un Point y lo utiliza. Como Point implementa Copy,
// el valor no se mueve y sigue estando disponible en el ámbito original.
fn use_point(p: Point) {
    // Imprime los valores de p.x y p.y.
    println!("Usando Point en use_point: {} y {}", p.x, p.y);
}

// Función que toma un Point y lo devuelve, simulando el movimiento de propiedad.
// Como Point implementa Copy, se copia el valor.
fn move_point(p: Point) -> Point {
    // Imprime el valor antes de devolverlo.
    println!("Moviendo propiedad de Point: {} y {}", p.x, p.y);
    p
}

#[executable]
fn main() {
    // Creamos un punto p1 con valores 10 y 20.
    let p1 = Point { x: 10, y: 20 };

    // Llamamos a use_point pasándole p1. Como Point es Copy, p1 sigue siendo válido.
    use_point(p1);

    // Llamamos a move_point pasándole p1; el valor se copia (no se pierde p1).
    let p2 = move_point(p1);

    // Imprimimos el valor de p1 para demostrar que sigue siendo válido.
    println!("p1 sigue siendo valido: {} y {}", p1.x, p1.y);
}
