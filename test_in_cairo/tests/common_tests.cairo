use snforge_std::*;
use test_in_cairo::{Rectangle, RectangleTrait, add, create_valid_number};

#[test]
fn test_add() {
    let result = add(2, 2);
    assert_eq!(result, 4);
}

#[test]
fn test_rectangle() {
    let big = Rectangle { width: 10, height: 10 };
    let small = Rectangle { width: 5, height: 5 };
    assert!(big.can_hold(@small));
    assert!(!small.can_hold(@big));
}

#[test]
fn test_invalid_number() {
    match create_valid_number(200) {
        Result::Ok(_) => { panic(array!['Should have failed']); },
        Result::Err(e) => { assert_eq!(e, 999); },
    }
}
