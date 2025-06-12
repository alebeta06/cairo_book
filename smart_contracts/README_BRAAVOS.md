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

**Nota:** El mensaje `add_profile: --add-profile flag was not set. No profile added to snfoundry.toml` es normal y esperado.

### 3. Verificar que la cuenta se importó

```bash
# Listar cuentas disponibles
sncast account list
```

Deberías ver tu cuenta `braavos` en la lista.

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

### Paso 2: Declarar el Contrato

```bash
# Declarar el contrato en la red (versión v2 con ETH)
sncast declare --contract-name HelloStarknet --max-fee 0x1000000000000 --fee-token eth --version v2
```

**Nota**:

- Braavos te pedirá que firmes la transacción en tu wallet
- Usamos `--fee-token eth --version v2` porque v3 requiere STRK tokens
- El comando compilará automáticamente el contrato

### Paso 3: Desplegar el Contrato

```bash
# Desplegar usando el class hash obtenido
sncast deploy --class-hash <CLASS_HASH> --max-fee 0x1000000000000 --fee-token eth
```

**Nota**: Braavos te pedirá que firmes la transacción en tu wallet.

## 🔧 Interacción con el Contrato

### Obtener Balance (Read-only)

```bash
# Obtener el balance actual
sncast call --contract-address <CONTRACT_ADDRESS> --function get_balance
```

### Incrementar Balance (Modifica estado)

```bash
# Incrementar el balance
sncast invoke --contract-address <CONTRACT_ADDRESS> --function increase_balance --calldata 42 --max-fee 0x100000000000000
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

## 🐛 Solución de Problemas

### Error: "Insufficient funds"

- Verifica que tu wallet de Braavos tenga ETH
- Visita: https://sepolia.starknet.io/faucet

### Error: "Transaction rejected"

- Verifica que estés en la red correcta (Sepolia) en Braavos
- Asegúrate de firmar la transacción en tu wallet

### Error: "Max fee too low"

- Aumenta el valor de `--max-fee`
- Ejemplo: `--max-fee 0x200000000000000`

## 💡 Ventajas de usar Braavos

1. **Seguridad**: Tus claves privadas están en tu wallet
2. **Interfaz familiar**: Usas la misma wallet que conoces
3. **Fácil gestión**: No necesitas manejar archivos de cuentas
4. **Confirmación visual**: Ves cada transacción antes de firmar

## 🎯 Flujo de Trabajo Típico

1. **Compilar**: `scarb build`
2. **Declarar**: `sncast declare --contract-name HelloStarknet`
3. **Firmar en Braavos**: Confirmar la transacción
4. **Desplegar**: `sncast deploy --class-hash <CLASS_HASH>`
5. **Firmar en Braavos**: Confirmar la transacción
6. **Interactuar**: `sncast call/invoke` según necesites

## 🎉 ¡Listo!

Con esta configuración, puedes usar tu wallet de Braavos para desplegar e interactuar con contratos de forma segura y conveniente.
