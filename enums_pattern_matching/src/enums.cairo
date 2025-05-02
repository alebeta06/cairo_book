// Derivamos el rasgo `Drop` para que las instancias de Direction se destruyan automáticamente al
// salir del alcance
#[derive(Drop)]
enum Direction {
    North,
    East,
    South,
    West,
}

// Otra enumeración llamada Message con distintas variantes
#[derive(Drop)]
enum Message {
    Quit, // Variante sin datos
    Echo: felt252, // Variante con un único valor felt252 (cadena corta o número)
    Move: (u128, u128) // Variante que contiene una tupla de dos enteros u128
}

// Definimos un trait llamado Processing, que tiene un método `process`
// Este método será implementado más abajo para la enum Message
trait Processing {
    fn process(self: Message);
}

// Implementamos el trait Processing para Message
impl ProcessingImpl of Processing {
    fn process(self: Message) {
        // Hacemos pattern matching según la variante de Message
        match self {
            // Si es Quit, se imprime un mensaje simple
            Message::Quit => { println!("Saliendo del programa"); },
            // Si es Echo, accedemos al valor contenido y lo mostramos
            Message::Echo(value) => { println!("Eco: {}", value); },
            // Si es Move, accedemos a la tupla (x, y) y la imprimimos
            Message::Move((
                x, y,
            )) => { println!("Moviendo a las coordenadas: x = {}, y = {}", x, y); },
        }
    }
}

// Esta es la función principal del programa (etiquetada como ejecutable por Scarb)
#[executable]
pub fn enumeraciones() {
    // Creamos una variable `dir` con la variante `North` de Direction
    let dir = Direction::North;

    // Usamos pattern matching para imprimir el valor según la dirección
    match dir {
        Direction::North => println!("Direccion: Norte"),
        Direction::East => println!("Direccion: Este"),
        Direction::South => println!("Direccion: Sur"),
        Direction::West => println!("Direccion: Oeste"),
    }

    // Creamos una variable `msg1` con la variante `Quit` de Message
    let msg1 = Message::Quit;
    msg1.process(); // Se ejecuta el método `process`, que imprime "Saliendo del programa"

    // Creamos `msg2` con la variante `Echo` y le pasamos un valor felt252 (cadena corta)
    let msg2 = Message::Echo('Hola'); // felt252 = literal corto compatible
    msg2.process(); // Imprime "Eco: Hola"

    // Creamos `msg3` con la variante `Move`, pasando una tupla de coordenadas
    let msg3 = Message::Move((10_u128, 20_u128));
    msg3.process(); // Imprime "Moviendo a las coordenadas: x = 10, y = 20"
}
