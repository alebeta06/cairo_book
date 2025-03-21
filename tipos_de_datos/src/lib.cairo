#[executable]
fn main() -> () {
    // ========================================================
    // Tipos Escalares y Tipo de Fieltro
    // ========================================================
    // En Cairo, si no se especifica el tipo, el valor se interpreta como un elemento de campo
    // (felt252) por defecto.
    let default_value = 3; // Tipo felt252
    println!("(Escalar/Felt) Valor predeterminado (felt252): {}", default_value);

    // ========================================================
    // Tipos Enteros y Operaciones Numéricas
    // ========================================================
    // Declaración y conversión entre tipos enteros usando 'into()'
    let a_u8: u8 = 10;
    let a_u16: u16 = a_u8.into();
    let a_u32: u32 = a_u16.into();
    let a_u64: u64 = a_u32.into();
    let a_u128: u128 = a_u64.into();
    println!(
        "(Enteros) a_u8: {}, a_u16: {}, a_u32: {}, a_u64: {}, a_u128: {}",
        a_u8,
        a_u16,
        a_u32,
        a_u64,
        a_u128,
    );

    // Operaciones matemáticas básicas
    let sum = 5_u128 + 10_u128;
    let difference = 95_u128 - 4_u128;
    let product = 4_u128 * 30_u128;
    let quotient = 64_u128 / 32_u128; // Resultado: 2
    let remainder = 43_u128 % 5_u128; // Resultado: 3
    println!("(Operaciones) Suma: 5 + 10 = {}", sum);
    println!("(Operaciones) Resta: 95 - 4 = {}", difference);
    println!("(Operaciones) Multiplicacion: 4 * 30 = {}", product);
    println!("(Operaciones) Division: 64 / 32 = {}", quotient);
    println!("(Operaciones) Modulo: 43 % 5 = {}", remainder);

    // ========================================================
    // Tipo Booleano
    // ========================================================
    let t = true;
    let f: bool = false; // Declaración explícita de tipo
    println!("(Booleanos) t = {}, f = {}", t, f);

    // ========================================================
    // Tipos de Cadenas
    // ========================================================
    // Cadenas cortas (ASCII) se definen con comillas simples.
    let short_str = 'Hello';
    println!("(Cadenas cortas) Valor: {}", short_str);
    // También se pueden definir en hexadecimal:
    let short_str_hex = 0x48656C6C6F; // Equivalente a 'Hello'
    println!("(Cadenas cortas) Valor en hexadecimal: {}", short_str_hex);

    // Cadenas de matriz de bytes (ByteArray) se definen con comillas dobles.
    let long_str: ByteArray = "This is a longer string that exceeds 31 characters";
    println!("(ByteArray) Cadena larga: {}", long_str);

    // ========================================================
    // Tipos Compuestos: Tuplas, Unidad y Arrays de Tamaño Fijo
    // ========================================================
    // Tupla: Agrupa varios valores de diferentes tipos.
    let tup: (u32, bool, felt252) = (10, true, 7);
    // Desestructuración de la tupla; solo se utiliza el valor que se necesita (por ejemplo, el
    // tercer elemento)
    let (_, _, third) = tup;
    println!("(Tupla) Tercer elemento: {}", third);

    // Tipo de unidad: Representa un valor vacío, se muestra como ().
    let unit_val = ();
    println!("(Unidad) Valor de unidad: {:?}", unit_val);

    // Array de tamaño fijo: Todos los elementos deben ser del mismo tipo.
    let fixed_arr: [u64; 5] = [1, 2, 3, 4, 5];
    println!("(Array) Array de tamano fijo: {:?}", fixed_arr);
    // Acceso a elementos por desestructuración (solo se extrae el cuarto elemento):
    let [_, _, _, fourth, _] = fixed_arr;
    println!("(Array) Cuarto elemento (por desestructuracion): {}", fourth);
    // NOTA: El operador de indexación (fixed_arr[3]) no está implementado para arrays fijos en
    // Cairo.

    // ========================================================
    // Conversión de Tipos
    // ========================================================
    // Uso de 'into()' para conversiones seguras entre enteros
    let my_u8: u8 = 10;
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let my_u128: u128 = my_u64.into();
    println!(
        "(Conversion con Into) my_u8: {}, my_u16: {}, my_u32: {}, my_u64: {}, my_u128: {}",
        my_u8,
        my_u16,
        my_u32,
        my_u64,
        my_u128,
    );

    // Uso de 'try_into()' para conversiones que pueden fallar
    let my_felt252 = 10; // Se asume como felt252 por defecto.
    // Convertir de felt252 a u128 usando try_into(), que retorna Option
    let my_u128_conv: u128 = my_felt252.try_into().unwrap();
    println!("(Conversion con TryInto) my_felt252 convertido a u128: {}", my_u128_conv);
}
