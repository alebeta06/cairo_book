// src/method_syntax.cairo

// -------------------------------------------------------------
// 1) Definición de la estructura Rectangle
// -------------------------------------------------------------
// #[derive(Copy, Drop)] permite que Rectangle sea
// - Copy: se pueda copiar (no mover) al pasarlo a funciones
// - Drop: se pueda descartar al salir de alcance
#[derive(Copy, Drop)]
struct Rectangle {
    width: u64, // ancho
    height: u64 // alto
}

// -------------------------------------------------------------
// 2) Bloque impl con #[generate_trait]
//    Define métodos y funciones asociadas a Rectangle
// -------------------------------------------------------------
#[generate_trait]
impl RectangleImpl of RectangleTrait {
    // ---------------------------------------------------------
    // a) Método area: calcula el área de un rectángulo
    //
    //    fn area(self: @Rectangle) -> u64
    //
    //    - self: @Rectangle
    //        El símbolo `@` delante de un valor crea una *snapshot*
    //        (instantánea) de esa instancia. No modifica el original.
    //    - retorna u64: el producto ancho × alto.
    // ---------------------------------------------------------
    fn area(self: @Rectangle) -> u64 {
        // `*self.width` y `*self.height`:
        // El `*` aquí es el *desnap operator*: desreferencia
        // la snapshot y obtiene el valor puro de cada campo.
        (*self.width) * (*self.height)
    }

    // ---------------------------------------------------------
    // b) Método scale: escala (modifica) el rectángulo
    //
    //    fn scale(ref self: Rectangle, factor: u64)
    //
    //    - ref self: Rectangle
    //        Recibe una referencia mutable a la instancia original.
    //    - factor: u64
    //        Factor por el que multiplicar ancho y alto.
    //
    //    Dentro del método:
    //    - `self.width *= factor;` equivale a
    //         self.width = self.width * factor;
    //      El operador `*=` es el *compound assignment*:
    //      multiplica y reasigna en un solo paso.
    // ---------------------------------------------------------
    fn scale(ref self: Rectangle, factor: u64) {
        self.width *= factor; // ancho = ancho * factor
        self.height *= factor; // alto  = alto  * factor
    }

    // ---------------------------------------------------------
    // c) Método can_hold: comprueba si self contiene otro rect.
    //
    //    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool
    //
    //    - self, other: @Rectangle
    //        Ambas son snapshots; no modifican ni consumen instancias.
    //    - retorna bool: true si self.width > other.width
    //                      y self.height > other.height.
    // ---------------------------------------------------------
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        (*self.width > *other.width) && (*self.height > *other.height)
    }

    // ---------------------------------------------------------
    // d) Funciones asociadas (constructores y utilidades)
    //
    //    new(width, height): crea un Rectangle
    //    square(size): crea un cuadrado (width=height=size)
    //    avg(lhs, rhs): promedia dos rectángulos
    // ---------------------------------------------------------
    fn new(width: u64, height: u64) -> Rectangle {
        Rectangle { width, height }
    }

    fn square(size: u64) -> Rectangle {
        Rectangle { width: size, height: size }
    }

    fn avg(lhs: @Rectangle, rhs: @Rectangle) -> Rectangle {
        Rectangle {
            width: ((*lhs.width + *rhs.width) / 2), height: ((*lhs.height + *rhs.height) / 2),
        }
    }
}

// -------------------------------------------------------------
// 3) Función ejecutable main()
//    Aquí probamos todos los métodos y funciones.
// -------------------------------------------------------------
#[executable]
pub fn syntax_geometria() {
    println!("--- Ejemplo detallado de Method Syntax ---");

    // Creamos rect1 y calculamos su área con el método .area()
    let rect1 = Rectangle { width: 30, height: 50 };
    let area1 = rect1.area();
    println!("Area de rect1 (30x50): {}", area1);

    // Creamos rect2 y lo escalamos in-place con .scale()
    let mut rect2 = Rectangle { width: 10, height: 20 };
    println!("Antes de scale: rect2 = ({} x {})", rect2.width, rect2.height);
    rect2.scale(2);
    println!("Despues de scale(2): rect2 = ({} x {})", rect2.width, rect2.height);

    // Probamos can_hold: rect1 puede contener a rect2, pero no a rect3
    let rect3 = Rectangle { width: 60, height: 45 };
    println!("rect1 puede contener a rect2? {}", rect1.can_hold(@rect2));
    println!("rect1 puede contener a rect3? {}", rect1.can_hold(@rect3));

    // Usamos funciones asociadas new, square y avg
    let r_new = RectangleTrait::new(5, 8);
    println!("new(5,8): ({} x {})", r_new.width, r_new.height);

    let r_sq = RectangleTrait::square(7);
    println!("square(7): ({} x {})", r_sq.width, r_sq.height);

    let r_avg = RectangleTrait::avg(@rect1, @rect3);
    println!("avg(rect1, rect3): ({} x {})", r_avg.width, r_avg.height);

    println!("--- Fin del ejemplo ---");
}
//Salida esperada:

//~/cairo_book/estructuras$ scarb execute --executable-name syntax_geometria
//--- Ejemplo de Method Syntax en Cairo ---
//Area de rect1 (30x50): 1500
//Tamano original de rect2: (10 x 20)
//Tamano de rect2 tras scale(2): (20 x 40)
//rect1 puede contener a rect2? true
//rect1 puede contener a rect3? false
//Rectangulo creado con new(5,8): (5 x 8)
//Rectangulo cuadrado con square(7): (7 x 7)
//Promedio entre rect1 y rect3: (45 x 47)
//--- Fin del ejemplo ---


