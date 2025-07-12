#[starknet::contract]
mod price_feeds {
    use starknet::contract_address::contract_address_const;

    // Interfaz Chainlink Aggregator
    #[starknet::interface]
    trait IStarknetAggregator<TContractState> {
        fn latest_round_data(self: @TContractState) -> (u128, u128, u128, u128, u128);
        fn decimals(self: @TContractState) -> u8;
    }

    #[starknet::interface]
    pub trait IChainlinkFeeds<TContractState> {
        fn get_eth_price(self: @TContractState) -> u128;
        fn get_btc_price(self: @TContractState) -> u128;
        fn get_strk_price(self: @TContractState) -> u128;
        fn get_link_price(self: @TContractState) -> u128;
    }

    #[storage]
    struct Storage {}
    #[abi(embed_v0)]
    impl ChainlinkFeedsImpl of IChainlinkFeeds<ContractState> {
        fn get_eth_price(self: @ContractState) -> u128 {
            let feed = contract_address_const::<
                0x08ed94479864161b612f4d77555e3a71089b2bfcae2d544e09b617113932611,
            >();
            let aggregator = IStarknetAggregatorDispatcher { contract_address: feed };
            let (_, answer, _, _, _) = aggregator.latest_round_data();
            answer
        }
        fn get_btc_price(self: @ContractState) -> u128 {
            let feed = contract_address_const::<
                0x0258b8f498b767c200577227e3e9f009c9b0fe7f6a3c8c2c24efd588c54747a,
            >();
            let aggregator = IStarknetAggregatorDispatcher { contract_address: feed };
            let (_, answer, _, _, _) = aggregator.latest_round_data();
            answer
        }
        fn get_strk_price(self: @ContractState) -> u128 {
            let feed = contract_address_const::<
                0x0a5db422ee7c28beead49303646e44ef9cbb8364eeba4d8af9ac06a3b556937,
            >();
            let aggregator = IStarknetAggregatorDispatcher { contract_address: feed };
            let (_, answer, _, _, _) = aggregator.latest_round_data();
            answer
        }
        fn get_link_price(self: @ContractState) -> u128 {
            let feed = contract_address_const::<
                0x044e29893a7bd694e8335919ce1daaf99128e0295daad7852e59b0791cc3468e,
            >();
            let aggregator = IStarknetAggregatorDispatcher { contract_address: feed };
            let (_, answer, _, _, _) = aggregator.latest_round_data();
            answer
        }
    }
}
