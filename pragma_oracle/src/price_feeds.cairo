use pragma_lib::abi::{IPragmaABIDispatcher, IPragmaABIDispatcherTrait};
use pragma_lib::types::{DataType, PragmaPricesResponse};
use starknet::ContractAddress;
use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

// Asset IDs (felt252) para los pares
const ETH_USD: felt252 = 19514442401534788; // "ETH/USD"
const STRK_USD: felt252 = 19940520252744708; // "STRK/USD"
const BTC_USD: felt252 = 18669995996566340; // "BTC/USD"

#[starknet::interface]
pub trait IPriceFeeds<TContractState> {
    fn get_eth_price(self: @TContractState) -> u128;
    fn get_strk_price(self: @TContractState) -> u128;
    fn get_btc_price(self: @TContractState) -> u128;
}

#[starknet::contract]
pub mod PriceFeeds {
    use super::*;

    #[storage]
    pub struct Storage {
        pragma_contract: ContractAddress,
    }

    #[constructor]
    pub fn constructor(ref self: ContractState, pragma_contract: ContractAddress) {
        self.pragma_contract.write(pragma_contract);
    }

    #[abi(embed_v0)]
    impl PriceFeedsImpl of super::IPriceFeeds<ContractState> {
        fn get_eth_price(self: @ContractState) -> u128 {
            get_asset_price(self, ETH_USD)
        }
        fn get_strk_price(self: @ContractState) -> u128 {
            get_asset_price(self, STRK_USD)
        }
        fn get_btc_price(self: @ContractState) -> u128 {
            get_asset_price(self, BTC_USD)
        }
    }

    fn get_asset_price(self: @ContractState, asset_id: felt252) -> u128 {
        let oracle_dispatcher = IPragmaABIDispatcher {
            contract_address: self.pragma_contract.read(),
        };
        let output: PragmaPricesResponse = oracle_dispatcher
            .get_data_median(DataType::SpotEntry(asset_id));
        output.price
    }
}
