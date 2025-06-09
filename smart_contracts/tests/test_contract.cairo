use smart_contracts::{
    IHelloStarknetDispatcher, IHelloStarknetDispatcherTrait, IHelloStarknetSafeDispatcher,
    IHelloStarknetSafeDispatcherTrait,
};
use snforge_std::{ContractClassTrait, DeclareResultTrait, declare};
use starknet::ContractAddress;

/// Función auxiliar para desplegar un contrato durante las pruebas.
/// Parámetros:
/// - name: Nombre del contrato a desplegar
/// Retorna: La dirección del contrato desplegado
fn deploy_contract(name: ByteArray) -> ContractAddress {
    // Declaramos el contrato y obtenemos su clase
    let contract = declare(name).unwrap().contract_class();
    // Desplegamos el contrato y obtenemos su dirección
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}

/// Prueba que verifica la funcionalidad básica de incrementar el balance.
/// Esta prueba:
/// 1. Despliega el contrato HelloStarknet
/// 2. Verifica que el balance inicial sea 0
/// 3. Incrementa el balance en 42
/// 4. Verifica que el balance final sea 42
#[test]
fn test_increase_balance() {
    // Desplegamos el contrato para la prueba
    let contract_address = deploy_contract("HelloStarknet");

    // Creamos un dispatcher para interactuar con el contrato
    let dispatcher = IHelloStarknetDispatcher { contract_address };

    // Verificamos el balance inicial
    let balance_before = dispatcher.get_balance();
    assert(balance_before == 0, 'Invalid balance');

    // Incrementamos el balance en 42
    dispatcher.increase_balance(42);

    // Verificamos que el balance se haya incrementado correctamente
    let balance_after = dispatcher.get_balance();
    assert(balance_after == 42, 'Invalid balance');
}

/// Prueba que verifica que no se puede incrementar el balance con un valor de 0.
/// Esta prueba utiliza el dispatcher seguro que maneja errores de forma más robusta.
/// La prueba:
/// 1. Despliega el contrato HelloStarknet
/// 2. Verifica el balance inicial
/// 3. Intenta incrementar el balance con 0 (lo cual debería fallar)
/// 4. Verifica que se lance el error correcto
#[test]
#[feature("safe_dispatcher")]
fn test_cannot_increase_balance_with_zero_value() {
    // Desplegamos el contrato para la prueba
    let contract_address = deploy_contract("HelloStarknet");

    // Creamos un dispatcher seguro para manejar errores
    let safe_dispatcher = IHelloStarknetSafeDispatcher { contract_address };

    // Verificamos el balance inicial
    let balance_before = safe_dispatcher.get_balance().unwrap();
    assert(balance_before == 0, 'Invalid balance');

    // Intentamos incrementar el balance con 0 y verificamos que falle
    match safe_dispatcher.increase_balance(0) {
        Result::Ok(_) => core::panic_with_felt252('Should have panicked'),
        Result::Err(panic_data) => {
            // Verificamos que el mensaje de error sea el correcto
            assert(*panic_data.at(0) == 'Amount cannot be 0', *panic_data.at(0));
        },
    };
}
