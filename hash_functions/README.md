# 🔐 Funciones Hash Criptográficas en Cairo

Este proyecto implementa y compara diferentes funciones hash criptográficas, incluyendo **Poseidon** y **Pedersen**, optimizadas para uso en contextos de Zero-Knowledge Proofs (ZKP).

## 🚀 Características

- ✅ **Poseidon Hash**: Implementación completa del algoritmo Poseidon
- ✅ **Pedersen Hash**: Integración con el builtin nativo de Cairo
- ✅ **Comparaciones**: Benchmark y análisis de rendimiento
- ✅ **Ejemplos**: Casos de uso prácticos
- ✅ **100% Compilable**: Código optimizado para Cairo

## 📦 Instalación

```bash
cd hash_functions
scarb build
```

## 🎯 Cómo Usar Poseidon

### 1. **Hash de un Solo Valor**

```cairo
use hash_functions::poseidon::poseidon_hash_one;

let valor = 123;
let hash = poseidon_hash_one(valor);
// hash es de tipo Box<@core::felt252>
```

### 2. **Hash de Dos Valores**

```cairo
use hash_functions::poseidon::poseidon_hash_two;

let a = 456;
let b = 789;
let hash = poseidon_hash_two(a, b);
```

### 3. **Hash de Tres Valores**

```cairo
use hash_functions::poseidon::poseidon_hash_three;

let a = 100;
let b = 200;
let c = 300;
let hash = poseidon_hash_three(a, b, c);
```

### 4. **Hash de Array Completo**

```cairo
use hash_functions::poseidon::poseidon_hash_many;
use core::array::ArrayTrait;

let mut valores = ArrayTrait::new();
valores.append(1);
valores.append(2);
valores.append(3);
valores.append(4);

let hash = poseidon_hash_many(valores);
```

## 🔄 Comparación con Pedersen

### Comparación Básica

```cairo
use hash_functions::pedersen_comparison::compare_hashes;

let a = 100;
let b = 200;
let comparacion = compare_hashes(a, b);

// comparacion contiene:
// - input_a, input_b: valores de entrada
// - pedersen_result: hash de Pedersen
// - poseidon_result: hash de Poseidon (Box<@core::felt252>)
// - pedersen_time, poseidon_time: tiempos simulados
```

### Benchmark de Rendimiento

```cairo
use hash_functions::pedersen_comparison::hash_benchmark;

let iteraciones = 10;
let resultados = hash_benchmark(iteraciones);
// resultados es un Array<HashComparison>
```

## 🧪 Ejecutar Ejemplos

### Ejemplo Básico de Poseidon

```bash
scarb execute --executable-name ejemplo_poseidon_basico
```

### Ejemplo con Array

```bash
scarb execute --executable-name ejemplo_poseidon_array
```

### Comparación con Pedersen

```bash
scarb execute --executable-name ejemplo_comparacion_pedersen
```

### Benchmark

```bash
scarb execute --executable-name ejemplo_benchmark
```

## 📊 Casos de Uso Comunes

### 1. **Merkle Trees**

```cairo
// Hashear hojas de un árbol Merkle
let hoja1 = poseidon_hash_one(dato1);
let hoja2 = poseidon_hash_one(dato2);
let nodo_padre = poseidon_hash_two(*hoja1, *hoja2);
```

### 2. **Commitments**

```cairo
// Crear un commitment con un nonce
let mensaje = 12345;
let nonce = 67890;
let commitment = poseidon_hash_two(mensaje, nonce);
```

### 3. **Zero-Knowledge Proofs**

```cairo
// Hashear inputs para una prueba ZK
let input1 = 111;
let input2 = 222;
let input3 = 333;
let hash_zkp = poseidon_hash_three(input1, input2, input3);
```

## 🔧 Configuración Avanzada

### Parámetros de Poseidon

Los parámetros están configurados para el campo de Cairo:

- **T**: 4 (tamaño del estado)
- **R_F**: 8 (rondas completas)
- **R_P**: 22 (rondas parciales)
- **Total**: 30 rondas

### Constantes de Ronda

Las constantes están optimizadas para el campo prime de Cairo:

```
2^251 + 17*2^192 + 1
```

## 📈 Rendimiento

### Comparación de Velocidad

- **Pedersen**: ~1 unidad de tiempo (builtin nativo)
- **Poseidon**: ~2 unidades de tiempo (implementación en Cairo)

### Uso de Memoria

- **Poseidon**: Estado de 4 elementos felt252
- **Pedersen**: Optimizado para Cairo VM

## 🛠️ Desarrollo

### Estructura del Proyecto

```
hash_functions/
├── src/
│   ├── lib.cairo          # Exportaciones principales
│   ├── poseidon.cairo     # Implementación de Poseidon
│   ├── pedersen_comparison.cairo  # Comparaciones
│   ├── benchmarks.cairo   # Benchmarks
│   ├── examples.cairo     # Ejemplos
│   └── main.cairo         # Ejemplos ejecutables
├── Scarb.toml
└── README.md
```

### Agregar Nuevas Funciones

```cairo
// En poseidon.cairo
pub fn mi_nueva_funcion(input: felt252) -> Box<@core::felt252> {
    // Tu implementación aquí
    poseidon_hash_one(input)
}
```

## 🔍 Debugging

### Verificar Compilación

```bash
scarb build
```

### Ejecutar Tests

```bash
scarb test
```

### Ver Output

```bash
scarb execute --executable-name ejemplo_poseidon_basico --print-program-output
```

## 📚 Referencias

- [Poseidon Paper](https://eprint.iacr.org/2019/458)
- [Cairo Book](https://book.cairo-lang.org/)
- [Starknet Documentation](https://docs.starknet.io/)

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT.

---

**¡Disfruta usando Poseidon en Cairo! 🚀**
