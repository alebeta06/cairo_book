use core::dict::Felt252Dict;

#[executable]
pub fn valores() {
    // Crear un diccionario de balances:
    // Las claves son de tipo felt252 y los valores de tipo u64.
    // Se inicializa el diccionario vacío usando Default::default().
    let mut balances: Felt252Dict<u64> = Default::default();

    // Insertar valores en el diccionario.
    // La clave 1 se asocia a 100, la clave 2 a 200 y la clave 3 a 300.
    balances.insert(1, 100);
    balances.insert(2, 200);
    balances.insert(3, 300);

    // Obtener el valor asociado a la clave 1.
    let alex_balance: u64 = balances.get(1);
    // Verificar que el balance de la clave 1 sea 100.
    assert!(alex_balance == 100, "El balance de Alex no es 100");
    println!("El balance de Alex es: {}", alex_balance);

    // Actualizar el valor asociado a la clave 1 a 150.
    balances.insert(1, 150);
    let updated_balance: u64 = balances.get(1);
    println!("El balance actualizado de Alex es: {}", updated_balance);

    // Simular la eliminación de la clave 2 asignándole el valor 0.
    // Dado que no se puede eliminar una entrada, se reescribe el valor a 0.
    balances.insert(2, 0);
    let mary_balance: u64 = balances.get(2);
    println!("El balance de Mary (despues de 'eliminar') es: {}", mary_balance);
}
