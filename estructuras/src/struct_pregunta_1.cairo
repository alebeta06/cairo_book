//Pregunta 1
//Determinar si el programa pasará la prueba del compilador.
//Si pasa la prueba, escribir el resultado esperado del programa si se ejecutara.

//La estructura Point tiene dos campos: x y y.
//Al derivar Copy, se permite que sus instancias se copien en lugar de moverse.
#[derive(Copy, Drop)]
struct Point {
    x: u32,
    y: u32,
}

#[executable]
pub fn pregunta1() {
    //Se crea `a` como Point { x: 1, y: 2 }.
    let mut a = Point { x: 1, y: 2 };
    //Se incrementa a.x en 1, quedando a como Point { x: 2, y: 2 }
    a.x += 1;
    //Se crea b usando la sintaxis de actualización: Point { y: 1, ..a }.
    //Esto copia a.x (que es 2) y asigna y con el valor 1, de modo que b es Point { x: 2, y: 1 }
    let b = Point { y: 1, ..a };
    //Luego se incrementa nuevamente a.x en 1 (ahora a.x es 3), pero b no se ve afectado porque se
    //hizo una copia de a en el momento de su creación.
    a.x += 1;
    //Finalmente, se imprime b.x, cuyo valor es 2.
    println!("{}", b.x);
}
