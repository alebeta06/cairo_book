#[executable]
#[derive(Drop)]
struct User {
    active: bool,
    username: ByteArray,
    email: ByteArray,
    sign_in_count: u64,
}

fn main() {
    let user1 = User {
        active: true, username: "someusername123", email: "someone@example.com", sign_in_count: 1,
    };
    let user2 = User {
        sign_in_count: 1, username: "someusername123", active: true, email: "someone@example.com",
    };

    //Si la instancia es mutable podemos cambiar un valor utilizando la notación de puntos y
    //asignándolo a un campo en particular
    let mut user1 = User {
        active: true, username: "someusername123", email: "someone@example.com", sign_in_count: 1,
    };
    user1.email = "anotheremail@example.com";
}
