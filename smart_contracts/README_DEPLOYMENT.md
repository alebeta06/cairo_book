# 🚀 Guía de Deployment - HelloStarknet Contract

> **💡 Para usar con Braavos Wallet**: Si prefieres usar tu wallet de Braavos, consulta el archivo `README_BRAAVOS.md` que contiene una guía simplificada específica para Braavos.

Esta guía te explica cómo desplegar tu contrato `HelloStarknet` en una red de prueba usando Starknet Foundry.

## 📋 Prerrequisitos

1. **Starknet Foundry instalado**: `curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh`
2. **Scarb instalado**: `curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh`
3. **Fondos de prueba**: Necesitarás ETH en tu cuenta para pagar las transacciones

## 🔧 Configuración

### 1. Configurar la Cuenta

```bash
# Ejecutar el script de configuración de cuenta
./setup_account.sh
```

Este script:

- Crea una nueva cuenta llamada "default"
- La guarda en `~/.starknet_accounts/`
- Te muestra la dirección de tu cuenta

### 2. Obtener Fondos de Prueba

Visita el faucet de Sepolia y envía ETH a tu dirección de cuenta:

- **Sepolia**: https://sepolia.starknet.io/faucet

## 🚀 Proceso de Deployment

### Paso 1: Compilar el Proyecto

```bash
# Compilar el proyecto
scarb build
```

### Paso 2: Declarar el Contrato

```bash
# Declarar el contrato en la red
sncast declare --contract-name HelloStarknet --max-fee 0x100000000000000
```

### Paso 3: Desplegar el Contrato

```bash
# Desplegar usando el class hash obtenido
sncast deploy --class-hash <CLASS_HASH> --max-fee 0x100000000000000
```

## 🎯 Deployment Automatizado

Para automatizar todo el proceso, usa el script de deployment:

```bash
# Ejecutar deployment completo
./deploy.sh
```

Este script:

1. ✅ Compila el proyecto
2. ✅ Declara el contrato
3. ✅ Despliega el contrato
4. ✅ Guarda la información en `deployment_info.txt`
5. ✅ Muestra enlaces al explorador

## 🔧 Interacción con el Contrato

### Usando el Script de Interacción

```bash
# Obtener el balance actual
./interact.sh balance

# Incrementar el balance
./interact.sh increase 42
```

### Usando Comandos Directos

```bash
# Obtener balance
sncast call --contract-address <CONTRACT_ADDRESS> --function get_balance

# Incrementar balance
sncast invoke --contract-address <CONTRACT_ADDRESS> --function increase_balance --calldata 42 --max-fee 0x100000000000000
```

## 📊 Comandos Útiles de Starknet Foundry

### Gestión de Cuentas

```bash
# Listar cuentas
sncast account list

# Verificar balance de cuenta
sncast account balance --account default

# Cambiar cuenta activa
sncast account switch --account default
```

### Información de Red

```bash
# Verificar conexión a la red
sncast chain-id

# Obtener información del bloque actual
sncast block latest
```

### Gestión de Contratos

```bash
# Declarar contrato
sncast declare --contract-name <NOMBRE_CONTRATO>

# Desplegar contrato
sncast deploy --class-hash <CLASS_HASH>

# Llamar función (read-only)
sncast call --contract-address <ADDRESS> --function <FUNCION>

# Invocar función (modifica estado)
sncast invoke --contract-address <ADDRESS> --function <FUNCION> --calldata <DATOS>
```

## 🔍 Exploradores de Bloques

Después del deployment, puedes ver tu contrato en:

- **StarkScan**: https://sepolia.starkscan.co/

## 🐛 Solución de Problemas

### Error: "Account not found"

```bash
# Crear nueva cuenta
sncast account create --name default
```

### Error: "Insufficient funds"

- Visita el faucet de Sepolia: https://sepolia.starknet.io/faucet
- Espera a que se confirme la transacción

### Error: "Contract not found"

- Verifica que el contrato esté compilado correctamente
- Asegúrate de usar el nombre correcto del contrato

### Error: "Max fee too low"

- Aumenta el valor de `--max-fee`
- Ejemplo: `--max-fee 0x200000000000000`

## 📝 Archivos Importantes

- `snfoundry.toml`: Configuración de redes y cuentas
- `deployment_info.txt`: Información del deployment (generado automáticamente)
- `~/.starknet_accounts/`: Directorio con las cuentas

## 🔗 Enlaces Útiles

- [Starknet Foundry Docs](https://foundry-rs.github.io/starknet-foundry/)
- [Cairo Book](https://book.cairo-lang.org/)
- [Starknet Docs](https://docs.starknet.io/)
- [Scarb Docs](https://docs.swmansion.com/scarb/)

## 🎉 ¡Listo!

Una vez completado el deployment, tu contrato `HelloStarknet` estará disponible en la red de prueba Sepolia y podrás interactuar con él usando los comandos y scripts proporcionados.
