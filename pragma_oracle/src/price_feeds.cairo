// Importa los traits y tipos necesarios de la librería de Pragma
use pragma_lib::abi::{IPragmaABIDispatcher, IPragmaABIDispatcherTrait};
use pragma_lib::types::{DataType, PragmaPricesResponse};
use starknet::ContractAddress;
use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

// IDs de los activos (felt252) para los pares de precios soportados
const ETH_USD: felt252 = 19514442401534788; // "ETH/USD"
const STRK_USD: felt252 = 19940520252744708; // "STRK/USD"
const BTC_USD: felt252 = 18669995996566340; // "BTC/USD"

// Definición de la interfaz del contrato para exponer funciones de consulta de precios
#[starknet::interface]
pub trait IPriceFeeds<TContractState> {
    // Devuelve el precio de ETH/USD
    fn get_eth_price(self: @TContractState) -> u128;
    // Devuelve el precio de STRK/USD
    fn get_strk_price(self: @TContractState) -> u128;
    // Devuelve el precio de BTC/USD
    fn get_btc_price(self: @TContractState) -> u128;
}

// Definición del contrato principal
#[starknet::contract]
pub mod PriceFeeds {
    use super::*;

    // Estructura de almacenamiento del contrato
    #[storage]
    pub struct Storage {
        // Dirección del contrato de Pragma Oracle
        pragma_contract: ContractAddress,
    }

    // Constructor del contrato: guarda la dirección del contrato de Pragma Oracle
    #[constructor]
    pub fn constructor(ref self: ContractState, pragma_contract: ContractAddress) {
        self.pragma_contract.write(pragma_contract);
    }

    // Implementación de la interfaz: expone las funciones públicas para consultar precios
    #[abi(embed_v0)]
    impl PriceFeedsImpl of super::IPriceFeeds<ContractState> {
        // Consulta el precio de ETH/USD
        fn get_eth_price(self: @ContractState) -> u128 {
            get_asset_price(self, ETH_USD)
        }
        // Consulta el precio de STRK/USD
        fn get_strk_price(self: @ContractState) -> u128 {
            get_asset_price(self, STRK_USD)
        }
        // Consulta el precio de BTC/USD
        fn get_btc_price(self: @ContractState) -> u128 {
            get_asset_price(self, BTC_USD)
        }
    }

    // Función interna que consulta el precio de un activo dado su asset_id
    fn get_asset_price(self: @ContractState, asset_id: felt252) -> u128 {
        // Crea un dispatcher para interactuar con el contrato de Pragma Oracle
        let oracle_dispatcher = IPragmaABIDispatcher {
            contract_address: self.pragma_contract.read(),
        };
        // Llama a la función get_data_median del oracle para obtener el precio spot
        let output: PragmaPricesResponse = oracle_dispatcher
            .get_data_median(DataType::SpotEntry(asset_id));
        // Devuelve solo el campo 'price' de la respuesta
        output.price
    }
}
