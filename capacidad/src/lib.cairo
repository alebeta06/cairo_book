fn main() {
    // enteros positivos
    let a: u8 = 255;
    println!("la capacidad maxima de u8 es: {}", a);
    //2^8 - 1 = 255

    let b: u16 = 65535;
    println!("la capacidad maxima de u16 es: {}", b);
    //2^16 - 1 = 65535

    let c: u32 = 4294967295;
    println!("la capacidad maxima de u32 es: {}", c);
    //2^32 - 1 = 4294967295

    let d: u64 = 18446744073709551615;
    println!("la capacidad maxima de u64 es: {}", d);
    //2^64 - 1 = 18446744073709551615

    let e: u128 = 340282366920938463463374607431768211455;
    println!("la capacidad maxima de u128 es: {}", e);
    //2^128 - 1 = 340282366920938463463374607431768211455

    let f: u256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    println!("la capacidad maxima de u256 es: {}", f);
    //2^256 - 1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935

    // enteros negativos
    let g: i8 = -128;
    println!("la capacidad minima de i8 es: {}", g);
    //(-2)^7 = 128

    let g: i8 = 127;
    println!("la capacidad maxima de i8 es: {}", g);
    //2^7 - 1 = 127

    let h: i16 = -32768;
    println!("la capacidad minima de i16 es: {}", h);
    //(-2)^15 = 32768

    let h: i16 = 32767;
    println!("la capacidad maxima de i16 es: {}", h);
    //2^15 - 1 = 32767

    let i: i32 = -2147483648;
    println!("la capacidad minima de i32 es: {}", i);
    //(-2)^31 = 2147483648

    let i: i32 = 2147483647;
    println!("la capacidad maxima de i32 es: {}", i);
    //2^31 - 1 = 2147483647

    let j: i64 = -9223372036854775808;
    println!("la capacidad minima de i64 es: {}", j);
    //(-2)^63 = 9223372036854775808

    let j: i64 = 9223372036854775807;
    println!("la capacidad maxima de i64 es: {}", j);
    //2^63 - 1 = 9223372036854775807

    let k: i128 = -170141183460469231731687303715884105728;
    println!("la capacidad minima de i128 es: {}", k);
    //(-2)^127 = 170141183460469231731687303715884105728

    let k: i128 = 170141183460469231731687303715884105727;
    println!("la capacidad maxima de i128 es: {}", k);
    //2^127 - 1 = 170141183460469231731687303715884105727

    let l: felt252 = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    println!("la capacidad maxima de felt252 es: {}", l);
}

