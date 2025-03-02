#[executable]
fn main() {
    println!("Hello, world!");
    another_function(5);
}

fn another_function(x: felt252) {
    println!("The value of x is: {}", x);
}
