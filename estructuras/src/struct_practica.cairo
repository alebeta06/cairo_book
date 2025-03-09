// Definición de la estructura User
// Esta estructura almacena información de un usuario y tiene cuatro campos:
// - active: indica si el usuario está activo.
// - username: almacena el nombre de usuario (ByteArray).
// - email: almacena el correo electrónico (ByteArray).
// - sign_in_count: número de veces que el usuario ha iniciado sesión.
#[derive(Drop)]
struct User {
    active: bool,
    username: ByteArray,
    email: ByteArray,
    sign_in_count: u64,
}

// La función main() es el punto de entrada del programa y está marcada como ejecutable.
#[executable]
pub fn usuario() {
    // ================================================================
    // Creación de instancias de la estructura User
    // ================================================================

    // Creamos una instancia de User (user1) usando la sintaxis completa de inicialización.
    let user1 = User {
        active: true,
        username: "someusername123", // Asignamos un nombre de usuario.
        email: "someone@example.com", // Asignamos un correo electrónico.
        sign_in_count: 1,
    };

    // Imprimimos los datos de user1 para verificar su contenido.
    println!(
        "User1 -> active: {}, username: {}, email: {}, sign_in_count: {}",
        user1.active,
        user1.username,
        user1.email,
        user1.sign_in_count,
    );

    // Creamos otra instancia (user2) especificando los campos en un orden diferente.
    let user2 = User {
        sign_in_count: 1, username: "anotheruser456", active: true, email: "another@example.com",
    };

    println!(
        "User2 -> active: {}, username: {}, email: {}, sign_in_count: {}",
        user2.active,
        user2.username,
        user2.email,
        user2.sign_in_count,
    );

    // ================================================================
    // Actualización de una instancia mutable
    // ================================================================
    // Creamos una instancia mutable (user3) para demostrar que podemos modificar campos.
    let mut user3 = User {
        active: true, username: "mutableuser", email: "initial@example.com", sign_in_count: 1,
    };

    println!("User3 inicial -> email: {}", user3.email);

    // Actualizamos el campo 'email' de user3.
    user3.email = "updated@example.com";

    println!("User3 actualizado -> email: {}", user3.email);

    // ================================================================
    // Uso de la abreviatura Field Init en la función build_user_short
    // ================================================================
    // Llamamos a build_user_short para crear una nueva instancia sin repetir nombres de campo.
    let built_user = build_user_short("short@example.com", "shortuser");

    println!(
        "Built User (usando build_user_short) -> active: {}, username: {}, email: {}, sign_in_count: {}",
        built_user.active,
        built_user.username,
        built_user.email,
        built_user.sign_in_count,
    );

    // ================================================================
    // Creación de una nueva instancia a partir de otra usando la sintaxis de actualización de
    // estructura.
    // ================================================================
    // Utilizamos la sintaxis '..' para crear una nueva instancia (user4) basada en user3,
    // cambiando solo el valor de 'email'.
    // Nota: Como los campos de tipo ByteArray se mueven, user3 ya no se podrá utilizar después.
    let user4 = User { email: "new@example.com", ..user3 };

    println!(
        "User4 (actualizacion de user3) -> active: {}, username: {}, email: {}, sign_in_count: {}",
        user4.active,
        user4.username,
        user4.email,
        user4.sign_in_count,
    );
}

// Función build_user_short que crea una instancia de User utilizando la abreviatura Field Init.
// Dado que los parámetros 'email' y 'username' tienen el mismo nombre que los campos, podemos usar
// la forma abreviada.
fn build_user_short(email: ByteArray, username: ByteArray) -> User {
    User { active: true, username, email, sign_in_count: 1 }
}
