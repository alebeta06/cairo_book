#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128,
}

// Función que usa un Point. Debido a que Point implementa Copy,
// el valor no se mueve, por lo que se puede usar sin problemas.
fn use_point(p: Point) {
    println!("Usando Point en use_point: {} y {}", p.x, p.y);
}

// Función que "mueve" un Point y lo retorna (en realidad se copia, ya que Point es Copy).
fn move_point(p: Point) -> Point {
    println!("Moviendo propiedad de Point: {} y {}", p.x, p.y);
    p
}

#[executable]
fn main() -> () {
    // Creamos un punto p1 con valores 10 y 20.
    let p1 = Point { x: 10, y: 20 };

    // Llamamos a use_point, que imprime el valor de p1.
    use_point(p1);

    // Llamamos a move_point, que copia el valor de p1 y lo retorna.
    // Si no usamos el resultado, se mostrará una advertencia.
    let _p2 = move_point(p1);

    // Imprimimos el valor de p1 para confirmar que sigue siendo válido.
    println!("p1 sigue siendo valido: {} y {}", p1.x, p1.y);
}
