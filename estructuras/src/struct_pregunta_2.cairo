//Pregunta 2
//Determinar si el programa pasará la prueba del compilador.
//Si pasa la prueba, escribir el resultado esperado del programa si se ejecutara.

#[derive(Copy, Drop)]
struct Point {
    x: u32,
    y: u32,
}

#[executable]
pub fn pregunta2() {
    let mut p = Point { x: 1, y: 2 };
    let mut x = p.x;
    let mut y = p.y;
    x += 1;
    y += 1;
    println!("{} {}", p.x, p.y);
}
