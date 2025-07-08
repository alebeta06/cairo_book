# Pragma Oracle Starknet - Proyecto de Smart Contract

Este proyecto documenta el proceso completo para desplegar e interactuar con un smart contract en Starknet testnet (Sepolia) que consume precios del Pragma Oracle, usando una wallet de Braavos ya configurada.

---

## 1. Requisitos previos

- Tener una wallet de Braavos configurada y con fondos en Sepolia testnet.
- Tener instalado:
  - [Scarb](https://docs.swmansion.com/scarb/)
  - [Starknet Foundry (sncast, snforge)](https://foundry-rs.github.io/starknet-foundry/)

---

## 2. Estructura del proyecto

```
pragma_oracle/
├── src/
│   ├── lib.cairo
│   └── price_feeds.cairo
├── Scarb.toml
├── snfoundry.toml
└── README.md
```

---

## 3. Configuración de Scarb.toml

```toml
[package]
name = "pragma_oracle"
version = "0.1.0"
edition = "2024_07"

[dependencies]
starknet = "2.11.4"
pragma_lib = { git = "https://github.com/astraly-labs/pragma-lib" }

[dev-dependencies]
snforge_std = "0.38.0"
assert_macros = "2.11.4"

[[target.starknet-contract]]
sierra = true
```

---

## 4. Configuración de snfoundry.toml

```toml
[sncast.default]
url = "https://starknet-sepolia.public.blastapi.io"
account = "braavos"
```

---

## 5. Compilar el contrato

```sh
scarb build
```

---

## 6. Declarar el contrato en Sepolia

```sh
sncast declare --contract-name PriceFeeds --fee-token eth --version v2
```

**Salida esperada:**

```
command: declare
class_hash: 0x1566e73c316cd7300bb7671389072c38ad09e3d2d9212d05dd4b1669a66dd10
transaction_hash: 0xff61fb35437e23396c0e0924159d4d653d599c9655186631476ab9e824ee82
```

---

## 7. Deploy del contrato

Dirección del Pragma Oracle en Sepolia:

```
0x36031daa264c24520b11d93af622c848b2499b66b41d611bac95e13cfca131a
```

Comando de deploy:

```sh
sncast deploy --class-hash 0x1566e73c316cd7300bb7671389072c38ad09e3d2d9212d05dd4b1669a66dd10 \
  --constructor-calldata 0x36031daa264c24520b11d93af622c848b2499b66b41d611bac95e13cfca131a \
  --fee-token eth --version v1
```

**Salida esperada:**

```
command: deploy
contract_address: 0x19e5391f4d534cec50d126ac9db20de71436d75035533ce3dc56c7bafa500e5
transaction_hash: 0x487a99a201ad90b3d04e426d9daf11088f9f314c0951565d4fc440e14555761
```

---

## 8. Consultar precios desde el contrato

### ETH

```sh
sncast call --contract-address 0x19e5391f4d534cec50d126ac9db20de71436d75035533ce3dc56c7bafa500e5 --function get_eth_price
```

**Salida:**

```
response: [253860000000]
```

### BTC

```sh
sncast call --contract-address 0x19e5391f4d534cec50d126ac9db20de71436d75035533ce3dc56c7bafa500e5 --function get_btc_price
```

**Salida:**

```
response: [870122500000]
```

---

## 9. Visualización en el explorador

Puedes consultar el contrato y hacer queries desde el explorador de Starkscan:

- [Contrato en Starkscan](https://sepolia.starkscan.co/contract/0x19e5391f4d534cec50d126ac9db20de71436d75035533ce3dc56c7bafa500e5)

### Ejemplo de consulta en Starkscan

![image](https://github.com/user-attachments/assets/58fde905-6c77-401f-b445-297c5a45b3b4)

---

## 10. Comparación de precios

### Precio en el explorador (Starkscan):

![image](https://github.com/user-attachments/assets/fce4d1ac-a9e2-4065-8f28-2b7db2a1afd4)

### Precio de mercado (Coinmarketcap, Binance, etc):

![image](https://github.com/user-attachments/assets/5ca98ad1-cc14-4b65-bfa1-b5430df27f53)


---

## 11. Nota sobre la diferencia de precios

> **IMPORTANTE:**
> Los precios retornados por el contrato (tanto por terminal como por el explorador) pueden diferir de los precios de mercado actuales. Esto se debe a:
>
> - El oráculo puede retornar precios en centavos (cents) y no en dólares.
> - El decimal factor suele ser 8 (divide el valor retornado por 10^8 para obtener el precio en USD).
> - Puede haber desfase temporal, agregación de fuentes o diferencias de mercado.
> - El feed de Pragma Oracle puede estar usando un promedio de exchanges y no el último precio spot.

---

## 12. Recursos útiles

- [Pragma Oracle Docs](https://docs.pragma.build/starknet/quickstart)
- [Starkscan Explorer](https://sepolia.starkscan.co/)
- [Cairo Book](https://book.cairo-lang.org/)
- [Starknet Foundry Docs](https://foundry-rs.github.io/starknet-foundry/)

---
