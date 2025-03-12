/// Comprueba si un número es par.
///
/// # Argumentos
///
/// * `n` - El número a comprobar.
///
/// # Devuelve
///
/// * `true` si el número es par.
/// * `false` si el número es impar.
fn is_even(n: u32) -> bool {
    // Un número es par si el resto de dividirlo por 2 es 0.
    n % 2 == 0
}

// Punto de entrada ejecutable
#[executable]
pub fn numero_par(input: u32) -> bool {
    // Llama a la función is_even para determinar si el número es par.
    is_even(input)
}
