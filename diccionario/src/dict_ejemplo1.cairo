// Importamos el módulo Felt252Dict, que proporciona un diccionario (mapa clave-valor).
use core::dict::Felt252Dict;

#[executable] // Indicamos que esta función se puede ejecutar como un programa independiente.
pub fn balance_usuarios() {
    // Creamos un diccionario llamado `balances` donde las claves son tipo `felt252`
    // y los valores son de tipo `u64`. `Default::default()` inicializa el diccionario vacío.
    let mut balances: Felt252Dict<u64> = Default::default();

    // Insertamos valores en el diccionario:
    // 'Alex' tiene un saldo de 100 y 'Maria' tiene un saldo de 200.
    balances.insert('Alex', 100);
    balances.insert('Maria', 200);

    // Obtenemos el saldo de Alex usando `get()`, que devuelve el valor asociado a la clave.
    let alex_balance = balances.get('Alex');

    // Verificamos que el saldo de Alex sea 100. Si no lo es, se lanzará un error con el mensaje
    // "Balance is not 100".
    assert!(alex_balance == 100, "Balance is not 100");

    // Obtenemos el saldo de Maria de la misma manera.
    let maria_balance = balances.get('Maria');

    // Verificamos que el saldo de Maria sea 200.
    assert!(maria_balance == 200, "Balance is not 200");

    // Imprimimos los saldos de Alex y Maria.
    println!("Alex's balance is: {alex_balance}");
    println!("Maria's balance is: {maria_balance}");
}
////scarb execute --executable-name balance_usuarios

//salida por consola
//Alex's balance is: 100
//Maria's balance is: 200


