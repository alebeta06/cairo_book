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
    //Se crea una instancia mutable de `Point` llamada `p` con x = 1 y y = 2
    let mut p = Point { x: 1, y: 2 };
    //Se asignan los valores de p.x y p.y a las variables locales x e y, respectivamente
    //Como `Point` implementa el rasgo Copy, se copia el valor (no se crea una referencia)
    let mut x = p.x;
    let mut y = p.y;
    //Se incrementa la variable local x en 1 (ahora x = 2) y la variable local y en 1 (ahora y = 3)
    x += 1;
    y += 1;

    //Estas modificaciones solo afectan a las variables locales x e y,
    //no a la instancia original p.
    //Por lo tanto, al imprimir p.x y p.y, se mostrará "1 2" ya que p sigue siendo Point { x: 1, y:
    //2 }
    println!("{} {}", p.x, p.y);
}
