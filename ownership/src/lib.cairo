#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

// Función que toma la propiedad de un valor y lo usa
fn use_point(p: Point) {
    // Aquí podemos usar p sin problemas porque implementa Copy
    // Si no tuviera Copy, no podríamos usarlo nuevamente fuera de esta función
    core::print("Usando Point en use_point: {p.x}, {p.y}\n");
}

// Función que toma propiedad y la devuelve
fn move_point(p: Point) -> Point {
    core::print("Moviendo propiedad de Point: {p.x}, {p.y}\n");
    p // Devolvemos el punto
}

#[executable]
fn main() {
    // Creando un punto
    let p1 = Point { x: 10, y: 20 };

    // Llamando a una función con propiedad (p1 se copia)
    use_point(p1);

    // Moviendo propiedad a otra función y recuperando el valor
    let p2 = move_point(p1);

    // p1 sigue siendo válido porque Point implementa Copy
    core::print("p1 sigue siendo valido: {p1.x}, {p1.y}\n");
    // Sin Copy, esto daría un error porque p1 ya habría sido movido
}
