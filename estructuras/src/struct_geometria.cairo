// Primero definimos una estructura llamada Rectangle.
// Esta estructura tendrá dos campos: width (ancho) y height (alto), ambos de tipo u64.
struct Rectangle {
    width: u64,
    height: u64,
}

// También definimos otra estructura llamada Square (cuadrado),
// que solo necesita un lado para definir su forma.
struct Square {
    side_length: u64,
}

// Usamos el trait Into para poder convertir un Square en un Rectangle automáticamente.
// Esto es útil si queremos tratar un cuadrado como un rectángulo donde ancho = alto.
use core::traits::Into;

// Implementamos la conversión de Square hacia Rectangle.
// Esto nos permitirá convertir un cuadrado en rectángulo cuando lo necesitemos.
impl SquareIntoRectangle of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle {
            width: self.side_length,
            height: self.side_length,
        }
    }
}

#[executable]
// Definimos la función geometrico(), que será el punto de entrada de nuestro programa.
pub fn geometrico() {
    // Imprimimos un separador para hacer más claro en consola lo que ocurre.
    println!("--- Cálculo de áreas usando estructuras ---");

    // Creamos un rectángulo de 30 de ancho por 10 de alto.
    let rectangle = Rectangle { width: 30, height: 10 };

    // Calculamos el área de este rectángulo llamando a la función area().
    let area_rectangle = area(rectangle);

    // Mostramos en consola el área del rectángulo.
    println!("Área del rectángulo (30x10) es: {}", area_rectangle);

    // Ahora creamos un cuadrado de lado 20.
    let square = Square { side_length: 20 };

    // Convertimos el cuadrado en un rectángulo usando .into().
    let rectangle_from_square = square.into();

    // Calculamos el área de este "rectángulo" que originalmente era un cuadrado.
    let area_square_as_rectangle = area(rectangle_from_square);

    // Mostramos en consola el área del cuadrado convertido.
    println!("Área del cuadrado (lado 20) convertido en rectángulo es: {}", area_square_as_rectangle);

    println!("--- Fin del programa ---");
}

// Esta función toma un rectángulo (Rectangle) y devuelve su área (ancho * alto).
fn area(rectangle: Rectangle) -> u64 {
    rectangle.width * rectangle.height
}
