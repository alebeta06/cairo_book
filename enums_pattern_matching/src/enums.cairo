#[derive(Drop)]
enum Direction {
    North,
    East,
    South,
    West,
}

#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}

trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => { println!("Saliendo del programa"); },
            Message::Echo(value) => { println!("Eco: {}", value); },
            Message::Move((
                x, y,
            )) => { println!("Moviendo a las coordenadas: x = {}, y = {}", x, y); },
        }
    }
}

#[executable]
pub fn enumeraciones() {
    let dir = Direction::North;

    match dir {
        Direction::North => println!("Direccion: Norte"),
        Direction::East => println!("Direccion: Este"),
        Direction::South => println!("Direccion: Sur"),
        Direction::West => println!("Direccion: Oeste"),
    }

    let msg1 = Message::Quit;
    msg1.process();

    let msg2 = Message::Echo('Hola'); // Literal corto, tipo felt252
    msg2.process();

    let msg3 = Message::Move((10_u128, 20_u128));
    msg3.process();
}
