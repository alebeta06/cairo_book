#[executable]
fn main() {
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i);
        i += 1;
    };
    //el valor se devolverá fuera del bucle para que puedas usarlo, lo debolvera 20
    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };
    //usamos while para repetir el programa tres veces,
    //contando regresivamente cada vez después de imprimir el valor de number y luego
    //después del bucle, imprimimos un mensaje y salimos.
    println!("The result is {}", result);

    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    };

    println!("LIFTOFF!!!");

    //usamos for para iterar sobre un rango de números
    //seguridad y concisión de for
    let a = [10, 20, 30, 40, 50].span();

    for element in a {
        println!("the value is: {element}");
    }
}
