/// Interfaz que representa el contrato `HelloContract`.
/// Esta interfaz permite modificar y recuperar el balance del contrato.
#[starknet::interface]
pub trait IHelloStarknet<TContractState> {
    /// Incrementa el balance del contrato.
    fn increase_balance(ref self: TContractState, amount: felt252);
    /// Recupera el balance del contrato.
    fn get_balance(self: @TContractState) -> felt252;
}

/// Contrato simple para gestionar el balance.
/// Este contrato permite incrementar y consultar un balance almacenado.
#[starknet::contract]
mod HelloStarknet {
    // Importamos las funciones necesarias para acceder al almacenamiento del contrato
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

    /// Estructura que define el almacenamiento del contrato.
    /// Contiene una variable `balance` de tipo felt252 para almacenar el balance actual.
    #[storage]
    struct Storage {
        balance: felt252,
    }

    /// Implementación de la interfaz del contrato.
    /// Define las funciones que pueden ser llamadas desde el exterior.
    #[abi(embed_v0)]
    impl HelloStarknetImpl of super::IHelloStarknet<ContractState> {
        /// Función para incrementar el balance del contrato.
        /// Parámetros:
        /// - self: Referencia al estado del contrato
        /// - amount: Cantidad a incrementar (debe ser mayor que 0)
        fn increase_balance(ref self: ContractState, amount: felt252) {
            // Verificamos que la cantidad no sea 0 para evitar incrementos inválidos
            assert(amount != 0, 'Amount cannot be 0');
            // Leemos el balance actual, le sumamos la cantidad y escribimos el nuevo valor
            self.balance.write(self.balance.read() + amount);
        }

        /// Función para obtener el balance actual del contrato.
        /// Retorna el valor almacenado en la variable balance.
        fn get_balance(self: @ContractState) -> felt252 {
            self.balance.read()
        }
    }
}
