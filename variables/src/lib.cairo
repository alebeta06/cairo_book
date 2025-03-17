#[executable]
fn main() {
    // Ejemplo 1: Variable inmutable
    // Las variables son inmutables por defecto; la siguiente asignación no estaría permitida.
    let x = 5;
    println!("(Inmutable) El valor de x es: {}", x);
    // La línea siguiente generaría error, por lo que se deja comentada:
    // x = 6;

    // Ejemplo 2: Variable mutable
    // Declaramos la variable como mutable para poder cambiar su valor.
    let mut y = 10;
    println!("(Mutable) Valor inicial de y: {}", y);
    y = 20; // Se reasigna el valor de y
    println!("(Mutable) Nuevo valor de y: {}", y);

    // Ejemplo 3: Sombreado (Shadowing)
    // Se puede redeclarar una variable con el mismo nombre para transformar su valor.
    let z = 30;
    println!("(Shadowing) Valor inicial de z: {}", z);
    let z = z + 5; // Se crea una nueva variable z que sombrea a la anterior
    println!("(Shadowing) Valor de z despues de sumar 5: {}", z);
    {
        // En este bloque interno se vuelve a sombrear z
        let z = z * 2;
        println!("(Shadowing - bloque interno) Valor de z en el ambito interno: {}", z);
    }
    println!("(Shadowing) Valor final de z en el ambito externo: {}", z);

    // Ejemplo 4: Constantes
    // Las constantes se declaran globalmente y no pueden cambiar. Se utilizan para valores fijos.
    println!("(Constante) La constante ONE_HOUR_IN_SECONDS es: {}", ONE_HOUR_IN_SECONDS);

    // Ejemplo 5: Conversión de tipos usando sombreado
    // Se puede redeclarar la variable para cambiar su tipo, lo que no es posible usando 'mut'.
    let a: u64 = 2;
    println!("(Conversion) El valor de a (u64) es: {}", a);
    // Redeclaramos 'a' para convertir su tipo a felt252 (conversión simulada con 'into()').
    let a: u64 = a.try_into().unwrap();
    println!("(Conversion) El valor de a (felt252) es: {}", a);
}

// Declaración de una constante global. Las constantes se definen con 'const' y siempre son
// inmutables.
const ONE_HOUR_IN_SECONDS: u32 = 3600;
//salida por consola

//(Inmutable) El valor de x es: 5
//(Mutable) Valor inicial de y: 10
//(Mutable) Nuevo valor de y: 20
//(Shadowing) Valor inicial de z: 30
//(Shadowing) Valor de z despues de sumar 5: 35
//(Shadowing - bloque interno) Valor de z en el ambito interno: 70
//(Shadowing) Valor final de z en el ambito externo: 35
//(Constante) La constante ONE_HOUR_IN_SECONDS es: 3600
//(Conversion) El valor de a (u64) es: 2
//(Conversion) El valor de a (felt252) es: 2

