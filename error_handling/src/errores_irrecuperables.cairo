use core::option::OptionTrait; // para el Option
use core::panic_with_felt252; // para el panic_with

// Ejemplo 1: Panic básico usando un array
fn ejemplo_panic_basico() {
    println!("=== Ejemplo 1: Panic basico con array ===");
    println!("Intentando ejecutar codigo que causara panic...");

    // Creamos un array con un codigo de error
    let error_code = array![42]; //El programa se detiene aquí

    // Esto causará que el programa se detenga
    panic(error_code);

    // Esta línea nunca se ejecutará
    println!("Esta linea nunca se alcanzara");
}

// Ejemplo 2: Usando panic_with_felt252 para un panic más simple
fn ejemplo_panic_felt252() {
    println!("\n=== Ejemplo 2: Panic con felt252 ===");
    println!("Intentando ejecutar codigo que causara panic con felt252...");

    // Esta es una forma más idiomática de causar panic
    panic_with_felt252(42); // Forma mas simple de causar panic

    // Esta línea nunca se ejecutará
    println!("Esta linea nunca se alcanzara");
}

// Ejemplo 3: Usando la macro panic! para mensajes más largos
fn ejemplo_panic_macro() {
    println!("\n=== Ejemplo 3: Panic con macro ===");
    println!("Intentando ejecutar codigo que causara panic con macro...");

    // La macro panic! permite mensajes más largos que 31 caracteres
    panic!("Este es un mensaje de error mas largo que 31 caracteres y es mas descriptivo");

    // Esta línea nunca se ejecutará
    println!("Esta linea nunca se alcanzara");
}

// Ejemplo 4: Función que nunca entrará en panic (nopanic)
fn funcion_segura() -> felt252 {
    println!("\n=== Ejemplo 4: Funcion con nopanic ===");
    println!("Ejecutando funcion que nunca entrara en panic...");

    // Esta función siempre retornará 42 y nunca entrará en panic
    42
}

// Ejemplo 5: Usando el atributo panic_with
#[panic_with('El valor no puede ser cero', envolver_si_no_cero)]
fn verificar_si_no_cero(valor: u128) -> Option<u128> {
    println!("\n=== Ejemplo 5: Uso de panic_with ===");
    println!("Verificando si el valor es cero...");

    if valor == 0 {
        Option::None
    } else {
        Option::Some(valor)
    }
}

// Función principal que ejecuta todos los ejemplos
#[executable]
pub fn irrecuperables() {
    // Los primeros 3 ejemplos estan comentados porque causarian panic
    // ejemplo_panic_basico();
    // ejemplo_panic_felt252();
    // ejemplo_panic_macro();

    // Ejemplo 4: Funcion segura nopanic
    let resultado = funcion_segura();
    println!("Resultado de funcion segura: {}", resultado);

    // Ejemplo 5: Uso de panic_with
    // Descomentar para ver el ejemplo con panic
    // envolver_si_no_cero(0); // Esto causará panic

    // Este ejemplo no causará panic
    let valor = verificar_si_no_cero(42);
    match valor {
        Option::Some(v) => println!("Valor recibido: {}", v),
        Option::None => println!("El valor es cero"),
    };
}

// Función de prueba para demostrar que nopanic funciona
fn test_nopanic() {
    // Esta función puede ser llamada desde una función nopanic
    // porque se garantiza que nunca entrará en panic
    let _ = funcion_segura();
    // La siguiente línea causaría un error de compilación si estuviera descomentada
// porque assert puede causar panic
// assert(1 == 1, 'error');
}
