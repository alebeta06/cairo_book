#[executable]
fn main() {
    println!("Hello, world!");

    another_function(5);

    print_labeled_measurement(5, "h");

    let x = five();
    println!("The value of x is: {}", x);

    let a = plus_one(7);
    println!("The value of x is: {}", a);
}

fn another_function(x: felt252) {
    println!("The value of x is: {}", x);
}

fn print_labeled_measurement(value: u128, unit_label: ByteArray) {
    println!("The measurement is: {value}{unit_label}");
}

fn five() -> u32 {
    17
}

fn plus_one(a: u32) -> u32 {
    a + 1
}
