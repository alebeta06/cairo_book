//Pregunta 1
//Determinar si el programa pasará la prueba del compilador.
//Si pasa la prueba, escribir el resultado esperado del programa si se ejecutara.

#[derive(Copy, Drop)]
struct Point {
    x: u32,
    y: u32,
}

#[executable]
pub fn pregunta1() {
    let mut a = Point { x: 1, y: 2 };
    a.x += 1;
    let b = Point { y: 1, ..a };
    a.x += 1;
    println!("{}", b.x);
}
