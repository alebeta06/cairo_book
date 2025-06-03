# Closures en Cairo

Este proyecto demuestra el uso de funciones y el concepto de closures en Cairo. Actualmente, los closures están siendo introducidos en Cairo 2.9+ y aún están en desarrollo. Este ejemplo muestra cómo se implementarían los conceptos de closures usando funciones regulares, con comentarios que ilustran cómo serían con la sintaxis de closures cuando estén disponibles.

## Conceptos Clave

### ¿Qué son los Closures?

Los closures son funciones anónimas que pueden:

- Capturar variables de su entorno
- Ser pasadas como argumentos a otras funciones
- Ser retornadas por otras funciones
- Tener una sintaxis más concisa que las funciones regulares

### Diferencias Clave entre Funciones y Closures

1. **Sintaxis**:

   - Funciones: `fn nombre(parametros) -> tipo_retorno { cuerpo }`
   - Closures: `|parametros| cuerpo`

2. **Captura de Entorno**:

   - Funciones: No pueden acceder a variables fuera de su ámbito
   - Closures: Pueden "capturar" y usar variables del entorno

3. **Flexibilidad**:

   - Funciones: Más estructuradas, requieren nombres y tipos explícitos
   - Closures: Más flexibles, pueden ser anónimas y usar inferencia de tipos

4. **Tipado**:
   - Funciones: Requieren tipos explícitos para parámetros y retorno
   - Closures: Pueden inferir tipos automáticamente

## Ejemplos

### 1. Definición Básica

```cairo
// Función regular
fn double(x: u8) -> u8 {
    x * 2
}

// Equivalente en closure (cuando esté disponible)
// let double = |x| x * 2;
```

Salida:

```
El doble de 2 es 4
El doble de 4 es 8
```

### 2. Múltiples Argumentos

```cairo
// Función regular
fn sum(x: u32, y: u32, z: u32) -> u32 {
    x + y + z
}

// Equivalente en closure
// let sum = |x, y, z| x + y + z;
```

Salida:

```
Resultado: 6
```

### 3. Captura de Variables del Entorno

```cairo
// Función regular
fn multiply_by_x(x: u32, value: u32) -> u32 {
    x * (value + 3)
}

// Equivalente en closure
// let x = 8;
// let multiply_by_x = |value| x * (value + 3);
```

Salida:

```
Resultado: 32
```

### 4. Comparación de Funciones

```cairo
// Funciones regulares
fn add_one_v1(x: u32) -> u32 { x + 1 }
fn add_one_v2(x: u32) -> u32 { x + 1 }
fn add_one_v3(x: u32) -> u32 { x + 1 }
fn add_one_v4(x: u32) -> u32 { x + 1 }

// Equivalente en closure
// let add_one = |x| x + 1;
```

Salida:

```
add_one_v1(5) = 6
add_one_v2(5) = 6
add_one_v3(5) = 6
add_one_v4(5) = 6
```

### 5. Operaciones con Arrays

```cairo
// Operaciones actuales con funciones
let mut doubled = ArrayTrait::new();
// ... código para duplicar elementos ...

let mut even = ArrayTrait::new();
// ... código para filtrar pares ...

// Equivalente en closure
// let doubled = numbers.map(|x| x * 2);
// let even = numbers.filter(|x| x % 2 == 0);
```

Salida:

```
Array original: []
Array duplicado: [2, 4, 6]
Numeros pares: [4, 6]
```

## Ventajas de los Closures

1. **Concisión**: Permiten escribir código más corto y expresivo
2. **Flexibilidad**: Pueden ser creados y usados en el momento
3. **Captura de Estado**: Pueden acceder a variables del entorno
4. **Composición**: Facilita la creación de funciones de orden superior

## Limitaciones Actuales

- Los closures aún no están completamente implementados en Cairo
- La sintaxis mostrada en los comentarios es ilustrativa y basada en otros lenguajes
- Se espera que la implementación completa esté disponible en Cairo 2.9+

## Ejecución del Código

Para ejecutar los ejemplos:

```bash
scarb execute
```

## Notas Importantes

- Este código usa funciones regulares para demostrar conceptos que eventualmente se implementarán con closures
- Los comentarios en el código muestran cómo serían las implementaciones con closures
- La sintaxis de closures mostrada es ilustrativa y puede cambiar en la implementación final

## Referencias

- [Documentación de Cairo](https://docs.cairo-lang.org/)
- [Notas de la versión de Cairo 2.9+](https://github.com/starkware-libs/cairo/releases)
