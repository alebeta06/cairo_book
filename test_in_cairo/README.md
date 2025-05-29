# Test in Cairo

Este proyecto es una demostración práctica de cómo implementar y ejecutar pruebas en Cairo, el lenguaje de programación para StarkNet. El proyecto incluye ejemplos de diferentes tipos de pruebas, estructuras de datos y manejo de errores.

## Estructura del Proyecto

```
test_in_cairo/
├── src/
│   └── lib.cairo         # Implementación principal del contrato
├── tests/
│   ├── common_tests.cairo    # Pruebas unitarias básicas
│   ├── integration_tests.cairo # Pruebas de integración
│   └── lib.cairo         # Configuración de pruebas
├── Scarb.toml            # Configuración del proyecto
├── Scarb.lock           # Archivo de bloqueo de dependencias
└── snfoundry.toml       # Configuración de Foundry para pruebas
```

## Funcionalidades Implementadas

### 1. Estructura Rectangle

- Implementación de una estructura `Rectangle` con métodos para:
  - `can_hold`: Verifica si un rectángulo puede contener a otro
  - `area`: Calcula el área del rectángulo

### 2. Funciones de Utilidad

- `add`: Función simple para sumar dos números
- `create_valid_number`: Función que valida números entre 1 y 100
- `validate_number`: Función interna para validación de números

## Pruebas Implementadas

### Pruebas Unitarias (common_tests.cairo)

1. `test_add`: Verifica la función de suma básica
2. `test_rectangle`: Prueba la funcionalidad de comparación de rectángulos
3. `test_invalid_number`: Verifica el manejo de números inválidos

### Pruebas de Integración (integration_tests.cairo)

1. `test_valid_number_integration`: Prueba la creación de números válidos
2. `test_invalid_number_integration`: Verifica el manejo de errores con números inválidos
3. `integration_add`: Prueba de integración de la función de suma

## Cómo Ejecutar las Pruebas

1. Asegúrate de tener Cairo y Scarb instalados en tu sistema
2. Desde el directorio raíz del proyecto, ejecuta:
   ```bash
   scarb test
   ```

## Salida Esperada

Al ejecutar las pruebas, deberías ver una salida similar a esta:

```
running 6 tests
test test_in_cairo::tests::common_tests::test_add ... ok
test test_in_cairo::tests::common_tests::test_rectangle ... ok
test test_in_cairo::tests::common_tests::test_invalid_number ... ok
test test_in_cairo::tests::integration_tests::test_valid_number_integration ... ok
test test_in_cairo::tests::integration_tests::test_invalid_number_integration ... ok
test test_in_cairo::tests::integration_tests::integration_add ... ok

test result: ok. 6 passed; 0 failed; 0 ignored; 0 filtered out
```

## Dependencias

El proyecto utiliza las siguientes dependencias principales:

- `snforge_std`: Framework de pruebas para Cairo
- Otras dependencias están especificadas en `Scarb.toml`

## Notas Adicionales

- El proyecto demuestra diferentes patrones de prueba en Cairo
- Incluye ejemplos de manejo de errores usando el tipo `Result`
- Muestra cómo implementar y probar estructuras de datos personalizadas
- Incluye ejemplos de pruebas unitarias y de integración

## Contribución

Siéntete libre de contribuir al proyecto mediante pull requests o reportando issues.
