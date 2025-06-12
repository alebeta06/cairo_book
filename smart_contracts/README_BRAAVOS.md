# 🚀 Guía de Deployment con Braavos Wallet

Esta guía te explica cómo desplegar tu contrato `HelloStarknet` usando tu wallet de Braavos con Starknet Foundry.

## 📋 Prerrequisitos

1. **Starknet Foundry instalado**: `curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh`
2. **Scarb instalado**: `curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh`
3. **Braavos Wallet**: Tener una cuenta en Braavos con fondos de prueba

## 🔧 Configuración de Braavos

### 1. Obtener tu Private Key de Braavos

1. Abre tu wallet de Braavos
2. Ve a **Settings** (Configuración)
3. Busca **"Privacy & Security"** o **"Privacidad y Seguridad"**
4. Haz clic en **"Export Private Key"** o **"Exportar Clave Privada"**
5. Ingresa tu contraseña
6. Copia tu private key (empieza con `0x`)

### 2. Importar la cuenta en Starknet Foundry

```bash
# Importar cuenta de Braavos
sncast account import --name braavos --address <TU_DIRECCION_BRAAVOS> --private-key <TU_PRIVATE_KEY> --type braavos
```

**Ejemplo:**

```bash
sncast account import --name braavos --address 0x03ebde8ec10deffe677cb203a5bc0e42b82e1e4a61e0156e6f9b70060704ac25 --private-key 0x07e46eed695f2b475487a2b19271614c20cacba2e3728172d9025f722d357b50 --type braavos
```

**Salida esperada:**

```
command: account import
add_profile: --add-profile flag was not set. No profile added to snfoundry.toml
```

**Nota:** El mensaje `add_profile: --add-profile flag was not set. No profile added to snfoundry.toml` es normal y esperado.

### 3. Verificar que la cuenta se importó

```bash
# Listar cuentas disponibles
sncast account list
```

**Salida esperada:**

```
Available accounts (at /home/alebeta/.starknet_accounts/starknet_open_zeppelin_accounts.json):
- braavos:
  network: alpha-sepolia
  public key: 0x51e36413bb4e7e15e836c1c927645286fb41b4b63e9e9e4aabb9745cef150c5
  address: 0x3ebde8ec10deffe677cb203a5bc0e42b82e1e4a61e0156e6f9b70060704ac25
  class hash: 0x3957f9f5a1cbfe918cedc2015c85200ca51a5f7506ecb6de98a5207b759bf8a
  deployed: true
  legacy: false
  type: Braavos
```

### 4. Obtener Fondos de Prueba

1. Asegúrate de estar conectado a **Sepolia testnet** en Braavos
2. Visita: https://sepolia.starknet.io/faucet
3. Envía ETH a tu dirección de Braavos

## 🚀 Proceso de Deployment

### Paso 1: Compilar el Proyecto

```bash
# Compilar el proyecto
scarb build
```

**Salida esperada:**

```
Compiling smart_contracts v0.1.0 (/home/alebeta/cairo_book/smart_contracts/Scarb.toml)
warn: Usage of deprecated feature `"corelib-internal-use"` with no `#[feature("corelib-internal-use")]` attribute. Note: "Use `starknet` directly"
 --> /home/alebeta/cairo_book/smart_contracts/src/lib.cairo:16:15
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
              ^^^^^^^^

Finished `release` profile target(s) in 20 seconds
```

### Paso 2: Declarar el Contrato

```bash
# Declarar el contrato en la red (versión v2 con ETH)
sncast declare --contract-name HelloStarknet --max-fee 0x1000000000000 --fee-token eth --version v2
```

**Salida esperada:**

```
Compiling smart_contracts v0.1.0 (/home/alebeta/cairo_book/smart_contracts/Scarb.toml)
warn: Usage of deprecated feature `"corelib-internal-use"` with no `#[feature("corelib-internal-use")]` attribute. Note: "Use `starknet` directly"
 --> /home/alebeta/cairo_book/smart_contracts/src/lib.cairo:16:15
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
              ^^^^^^^^

Finished `release` profile target(s) in 19 seconds
command: declare
class_hash: 0x2f1ebaba81ba2c1d7ed51a231bcd13ce8d642ff39bccf3753b3df29be3c9ccb
transaction_hash: 0x3eb385f7ef3c208ed84926296084a3dedbaf0a3e34f00234bfe4a16bc8abb39

To see declaration details, visit:
class: https://sepolia.starkscan.co/class/0x2f1ebaba81ba2c1d7ed51a231bcd13ce8d642ff39bccf3753b3df29be3c9ccb
transaction: https://sepolia.starkscan.co/tx/0x3eb385f7ef3c208ed84926296084a3dedbaf0a3e34f00234bfe4a16bc8abb39
```

**Nota**:

- Braavos te pedirá que firmes la transacción en tu wallet
- Usamos `--fee-token eth --version v2` porque v3 requiere STRK tokens
- El comando compilará automáticamente el contrato
- **Guarda el class_hash** para el siguiente paso

### Paso 3: Desplegar el Contrato

```bash
# Desplegar usando el class hash obtenido
sncast deploy --class-hash 0x2f1ebaba81ba2c1d7ed51a231bcd13ce8d642ff39bccf3753b3df29be3c9ccb --max-fee 0x1000000000000 --fee-token eth
```

**Salida esperada:**

```
command: deploy
contract_address: 0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914
transaction_hash: 0x481774695417695e59d75765f0095d527d809ed88ffa1892bb0332b9d642c64

To see deployment details, visit:
contract: https://sepolia.starkscan.co/contract/0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914
transaction: https://sepolia.starkscan.co/tx/0x481774695417695e59d75765f0095d527d809ed88ffa1892bb0332b9d642c64
```

**Nota**: Braavos te pedirá que firmes la transacción en tu wallet.

## 🔧 Interacción con el Contrato

### Obtener Balance (Read-only)

```bash
# Obtener el balance actual
sncast call --contract-address 0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914 --function get_balance
```

**Salida esperada:**

```
command: call
response: [0x0]
```

### Incrementar Balance (Modifica estado)

```bash
# Incrementar el balance
sncast invoke --contract-address 0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914 --function increase_balance --calldata 42 --max-fee 0x1000000000000 --fee-token eth
```

**Salida esperada:**

```
command: invoke
transaction_hash: 0x5131cc8250fac692c87b85807445f69a647d8c5758c52316a5dcefa82347b9d

To see invocation details, visit:
transaction: https://sepolia.starkscan.co/tx/0x5131cc8250fac692c87b85807445f69a647d8c5758c52316a5dcefa82347b9d
```

**Nota**: Las transacciones que modifican estado requieren firma en Braavos.

## 📊 Comandos Útiles

### Verificar Configuración

```bash
# Verificar que Braavos esté configurado
sncast account list

# Verificar conexión a la red
sncast chain-id
```

### Información de Transacciones

```bash
# Ver información del bloque actual
sncast block latest

# Ver transacciones pendientes
sncast tx-status <TRANSACTION_HASH>
```

## 🔍 Exploradores de Bloques

Después del deployment, puedes ver tu contrato en:

- **StarkScan**: https://sepolia.starkscan.co/

## 🎉 ¡Éxito! Tu Contrato Está Desplegado

### ✅ **Información del Deployment:**

- **Contract Address**: `0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914`
- **Transaction Hash**: `0x481774695417695e59d75765f0095d527d809ed88ffa1892bb0332b9d642c64`
- **Ver en StarkScan**: https://sepolia.starkscan.co/contract/0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914

### 📋 **Resumen de lo que lograste:**

1. ✅ **Importaste tu cuenta de Braavos**
2. ✅ **Declaraste el contrato** (class hash: `0x2f1ebaba81ba2c1d7ed51a231bcd13ce8d642ff39bccf3753b3df29be3c9ccb`)
3. ✅ **Desplegaste el contrato** (address: `0x2b07bdd78adb2bf9027c0efe0972187422e59412080a4cab560d6956b3f3914`)
4. ✅ **Interactuaste con el contrato** (obtuviste balance e incrementaste en 42)

**¡Felicidades! Tu contrato `HelloStarknet` está ahora vivo en la red de Sepolia.**

## 🐛 Solución de Problemas

### Error: "Account not found"

```bash
# Importar cuenta de Braavos
sncast account import --name braavos --address <TU_DIRECCION_BRAAVOS> --private-key <TU_PRIVATE_KEY> --type braavos
```

### Error: "Failed to parse value to felt"

- Asegúrate de usar la private key **con** el prefijo `0x`
- Ejemplo: `0x07e46eed695f2b475487a2b19271614c20cacba2e3728172d9025f722d357b50`

### Error: "Max fee exceeds balance"

- Reduce el valor de `--max-fee`
- Ejemplo: `--max-fee 0x1000000000000` (en lugar de `0x100000000000000`)

### Error: "Insufficient funds"

- Verifica que tu wallet de Braavos tenga ETH
- Visita: https://sepolia.starknet.io/faucet

### Error: "Transaction rejected"

- Verifica que estés en la red correcta (Sepolia) en Braavos
- Asegúrate de firmar la transacción en tu wallet

### Error: "HTTP status server error (502 Bad Gateway)"

- Es un error temporal de red
- Intenta el comando de nuevo
- Si persiste, cambia el RPC en `snfoundry.toml`

## 💡 Ventajas de usar Braavos

1. **Seguridad**: Tus claves privadas están en tu wallet
2. **Interfaz familiar**: Usas la misma wallet que conoces
3. **Fácil gestión**: No necesitas manejar archivos de cuentas
4. **Confirmación visual**: Ves cada transacción antes de firmar

## 🎯 Flujo de Trabajo Típico

1. **Compilar**: `scarb build`
2. **Declarar**: `sncast declare --contract-name HelloStarknet --max-fee 0x1000000000000 --fee-token eth --version v2`
3. **Firmar en Braavos**: Confirmar la transacción
4. **Desplegar**: `sncast deploy --class-hash <CLASS_HASH> --max-fee 0x1000000000000 --fee-token eth`
5. **Firmar en Braavos**: Confirmar la transacción
6. **Interactuar**: `sncast call/invoke` según necesites

## 🎉 ¡Listo!

Con esta configuración, puedes usar tu wallet de Braavos para desplegar e interactuar con contratos de forma segura y conveniente.
