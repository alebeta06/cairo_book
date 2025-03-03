#[executable]
fn main() {
    let number = 3;

    if number == 5 {
        println!("condition was true and number = {}", number);
    } else {
        println!("condition was false and number = {}", number);
    }

    let numero = 7;

    if numero == 12 {
        println!("numero is 12");
    } else if numero == 7 {
        println!("numero is 7");
    } else if numero - 2 == 5 {
        println!("numero mix 2 is 5");
    } else {
        println!("numero not found");
    }

    let condition = true;
    let otro_num = if condition {
        9
    } else {
        6
    };

    if otro_num == 9 {
        println!("condition was true and number is {}", otro_num);
    }
}
