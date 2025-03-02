#[executable]
fn main() {
    println!("Hello, world!");
    another_function(5);
    print_labeled_measurement(5, "h");
}

fn another_function(x: felt252) {
    println!("The value of x is: {}", x);
}

fn print_labeled_measurement(value: u128, unit_label: ByteArray) {
    println!("The measurement is: {value}{unit_label}");
}
