// -------------------------------------------------------------
// Definición de la estructura Rectangle con dos campos:
// width  — ancho del rectángulo
// height — alto del rectángulo
// Derivamos Copy y Drop para que los valores sean copiables
// y descartables sin problemas al salir de alcance.
// -------------------------------------------------------------
#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

// -------------------------------------------------------------
// Usamos #[generate_trait] para que el compilador genere
// automáticamente el trait RectangleTrait por nosotros.
// Dentro de este bloque impl definimos todos los métodos
// y funciones asociadas a Rectangle.
// -------------------------------------------------------------
#[generate_trait]
impl RectangleImpl of RectangleTrait {
    // ---------------------------------------------------------
    // Método area: calcula el área del rectángulo
    // - self: @Rectangle   → recibe una instantánea (snapshot)
    //                       de la instancia, no la modifica
    // - retorna u64        → ancho * alto
    // ---------------------------------------------------------
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }

    // ---------------------------------------------------------
    // Método scale: escala el rectángulo por un factor
    // - ref self: Rectangle → recibe una referencia mutable
    //                         a la instancia original
    // - factor: u64         → factor de escala
    // Modifica width y height in-place.
    // ---------------------------------------------------------
    fn scale(ref self: Rectangle, factor: u64) {
        self.width *= factor;
        self.height *= factor;
    }

    // ---------------------------------------------------------
    // Método can_hold: comprueba si self puede contener
    // otro rectángulo completo dentro de sí.
    // - self: @Rectangle   → snapshot de la instancia actual
    // - other: @Rectangle  → snapshot del rectángulo a comparar
    // Retorna true si both width y height de self son mayores
    // que los de other.
    // ---------------------------------------------------------
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        (*self.width > *other.width) && (*self.height > *other.height)
    }

    // ---------------------------------------------------------
    // Función asociada new: constructor de Rectangle
    // - width, height: u64 → dimensiones deseadas
    // Retorna una nueva instancia de Rectangle.
    // ---------------------------------------------------------
    fn new(width: u64, height: u64) -> Rectangle {
        Rectangle { width, height }
    }

    // ---------------------------------------------------------
    // Función asociada square: crea un Rectangle cuadrado
    // - size: u64 → longitud del lado
    // Retorna Rectangle { width = size, height = size }
    // ---------------------------------------------------------
    fn square(size: u64) -> Rectangle {
        Rectangle { width: size, height: size }
    }

    // ---------------------------------------------------------
    // Función asociada avg: promedia dos rectángulos
    // - lhs, rhs: @Rectangle → snapshots de los dos rectángulos
    // Retorna un Rectangle cuyas dimensiones son el promedio
    // de las dimensiones de lhs y rhs.
    // ---------------------------------------------------------
    fn avg(lhs: @Rectangle, rhs: @Rectangle) -> Rectangle {
        Rectangle {
            width: ((*lhs.width + *rhs.width) / 2),
            height: ((*lhs.height + *rhs.height) / 2),
        }
    }
}

// -------------------------------------------------------------
// Punto de entrada ejecutable
// Aquí probamos todos los métodos y funciones asociadas.
// -------------------------------------------------------------
#[executable]
fn main() {
    println!("--- Ejemplo de Method Syntax en Cairo ---");

    // 1) Creamos un rectángulo de 30×50 y calculamos su área
    let rect1 = Rectangle { width: 30, height: 50 };
    let area1 = rect1.area();  // llamada al método area()
    println!("Área de rect1 (30×50): {}", area1);

    // 2) Escalamos rect1 por un factor de 2
    let mut rect2 = Rectangle { width: 10, height: 20 };
    println!("Tamaño original de rect2: ({} × {})", rect2.width, rect2.height);
    rect2.scale(2);  // llamada al método scale()
    println!("Tamaño de rect2 tras scale(2): ({} × {})", rect2.width, rect2.height);

    // 3) Comprobamos si rect1 puede contener a rect2 y a un rectángulo mayor
    let rect3 = Rectangle { width: 60, height: 45 };
    println!(
        "¿rect1 puede contener a rect2? {}",
        rect1.can_hold(@rect2)
    );
    println!(
        "¿rect1 puede contener a rect3? {}",
        rect1.can_hold(@rect3)
    );

    // 4) Usamos las funciones asociadas new, square y avg
    let r_new = RectangleTrait::new(5, 8);
    println!("Rectángulo creado con new(5,8): ({} × {})", r_new.width, r_new.height);

    let r_sq = RectangleTrait::square(7);
    println!("Rectángulo cuadrado con square(7): ({} × {})", r_sq.width, r_sq.height);

    let r_avg = RectangleTrait::avg(@rect1, @rect3);
    println!(
        "Promedio entre rect1 y rect3: ({} × {})",
        r_avg.width, r_avg.height
    );

    println!("--- Fin del ejemplo ---");
}
