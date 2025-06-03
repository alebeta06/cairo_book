// Ejemplo de cierres (closures) en Cairo
// --------------------------------------
// Los cierres son funciones anónimas que pueden capturar variables de su entorno.
// Son útiles para pasar comportamientos como parámetros y personalizar funciones.

use debug::PrintTrait;

// Ejemplo 1: Definición básica de un cierre y uso de inferencia de tipos
fn example_basic_closure() {
    // Definimos un cierre que duplica el valor recibido.
    let double = |value| value * 2;
    // El tipo de 'value' se infiere en la primera llamada (u8 en este caso).
    println!("Double of 2 is {}", double(2_u8));
    println!("Double of 4 is {}", double(4_u8));
    // Si intentamos usar otro tipo, dará error de tipos.
    // println!("Double of 6 is {}", double(6_u16)); // Descomenta para ver el error
}

// Ejemplo 2: Cierre con múltiples argumentos y anotaciones de tipo
fn example_closure_with_types() {
    // Aquí especificamos los tipos de los argumentos y el valor de retorno.
    let sum = |x: u32, y: u32, z: u16| {
        x + y + z.into()
    };
    println!("Result: {}", sum(1, 2, 3));
}

// Ejemplo 3: Captura de variables del entorno
fn example_capture_env() {
    let x = 8;
    // El cierre puede usar 'x' aunque no sea un argumento.
    let my_closure = |value| {
        x * (value + 3)
    };
    println!("my_closure(1) = {}", my_closure(1));
}

// Ejemplo 4: Comparación entre función y cierre
fn add_one_v1(x: u32) -> u32 { x + 1 }

fn example_function_vs_closure() {
    // Cierre con tipos explícitos
    let add_one_v2 = |x: u32| -> u32 { x + 1 };
    // Cierre con tipos inferidos y cuerpo en bloque
    let add_one_v3 = |x| { x + 1 };
    // Cierre con tipos inferidos y cuerpo de una sola expresión
    let add_one_v4 = |x| x + 1;
    println!("add_one_v1(5) = {}", add_one_v1(5));
    println!("add_one_v2(5) = {}", add_one_v2(5));
    println!("add_one_v3(5) = {}", add_one_v3(5));
    println!("add_one_v4(5) = {}", add_one_v4(5));
}

// Ejemplo 5: Uso de cierres en map y filter sobre arrays
trait ArrayExtTrait<T> {
    fn map<F, Output>(self: Array<T>, f: F) -> Array<Output>;
}

#[generate_trait]
impl ArrayExt of ArrayExtTrait {
    #[inline(never)]
    fn map<T, +Drop<T>, F, +Drop<F>, impl func: core::ops::Fn<F, (T,)>, +Drop<func::Output>>(
        self: Array<T>, f: F,
    ) -> Array<func::Output> {
        let mut output: Array<func::Output> = array![];
        for elem in self {
            output.append(f(elem));
        }
        output
    }
}

trait ArrayFilterExtTrait<T> {
    fn filter<F>(self: Array<T>, f: F) -> Array<T>;
}

#[generate_trait]
impl ArrayFilterExt of ArrayFilterExtTrait {
    #[inline(never)]
    fn filter<
        T,
        +Copy<T>,
        +Drop<T>,
        F,
        +Drop<F>,
        impl func: core::ops::Fn<F, (T,)>[Output: bool],
        +Drop<func::Output>,
    >(
        self: Array<T>, f: F,
    ) -> Array<T> {
        let mut output: Array<T> = array![];
        for elem in self {
            if f(elem) {
                output.append(elem);
            }
        }
        output
    }
}

fn example_map_and_filter() {
    let double = array![1, 2, 3].map(|item: u32| item * 2);
    let another = array![1, 2, 3].map(|item: u32| {
        let x: u64 = item.into();
        x * x
    });
    let even = array![3, 4, 5, 6].filter(|item: u32| item % 2 == 0);
    println!("double: {:?}", double);
    println!("another: {:?}", another);
    println!("even: {:?}", even);
}

// Función principal para ejecutar todos los ejemplos
fn main() {
    println!("--- Ejemplo 1: Closure basico ---");
    example_basic_closure();
    println!("\n--- Ejemplo 2: Closure con tipos ---");
    example_closure_with_types();
    println!("\n--- Ejemplo 3: Captura de entorno ---");
    example_capture_env();
    println!("\n--- Ejemplo 4: Funcion vs Closure ---");
    example_function_vs_closure();
    println!("\n--- Ejemplo 5: map y filter con closures ---");
    example_map_and_filter();
}

// Explicación general:
// - Los cierres permiten definir funciones anónimas que pueden capturar variables del entorno.
// - Son útiles para personalizar el comportamiento de funciones y trabajar con colecciones.
// - La inferencia de tipos hace que sean flexibles, pero hay que tener cuidado con los tipos usados.
// - Se pueden usar como argumentos de funciones como map y filter para aplicar lógica personalizada.
