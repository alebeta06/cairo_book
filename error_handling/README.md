# Manejo de Errores en Cairo

Este proyecto demuestra dos tipos de manejo de errores en Cairo:

1. Errores Irrecuperables (usando `panic!`)
2. Errores Recuperables (usando `Result`)

## Estructura del Proyecto

```
error_handling/
├── src/
│   ├── errores_irrecuperables.cairo    # Ejemplo de errores irrecuperables
│   └── recuperables_result.cairo       # Ejemplo de errores recuperables
├── Scarb.toml
└── README.md
```

## 1. Errores Irrecuperables (`errores_irrecuperables.cairo`)

Los errores irrecuperables son situaciones donde el programa no puede continuar su ejecución. En Cairo, esto se maneja usando `panic!`.

### Características principales:

- Uso de `panic!` para detener la ejecución del programa
- Ejemplos de situaciones que causan panic
- Manejo de condiciones que no deberían ocurrir

### Para ejecutar el ejemplo:

```bash
scarb execute --executable-name irrecuperables
```

## 2. Errores Recuperables (`recuperables_result.cairo`)

Los errores recuperables son situaciones donde el programa puede manejar el error y continuar su ejecución. En Cairo, esto se implementa usando el tipo `Result<T, E>`.

### Características principales:

- Uso de `Result<T, E>` para manejar operaciones que pueden fallar
- Implementación de `parse_u8` que convierte `felt252` a `u8`
- Uso de `unwrap()`, `expect()`, `is_ok()`, `is_err()`
- Propagación de errores con el operador `?`
- Tests unitarios para verificar el comportamiento

### Ejemplo de uso:

```cairo
// Conversión de felt252 a u8
fn parse_u8(s: felt252) -> Result<u8, felt252> {
    match s.try_into() {
        Option::Some(value) => Result::Ok(value),
        Option::None => Result::Err(1),
    }
}
```

### Para ejecutar el ejemplo:

```bash
# Ejecutar el programa principal
scarb execute --executable-name result_examples

# Ejecutar los tests
scarb test
```

### Salida esperada del programa principal:

```
Valid number test: true
Invalid number test: false
Final result: SUCCESS (1)
```

### Tests implementados:

1. `test_valid_conversion`: Verifica la conversión exitosa de un número válido
2. `test_invalid_conversion`: Verifica que números inválidos causen panic
3. `test_error_propagation`: Verifica la propagación correcta de errores

## Comandos Útiles

```bash
# Compilar el proyecto
scarb build

# Ejecutar los tests
scarb test

# Ejecutar el ejemplo de errores irrecuperables
scarb execute --executable-name irrecuperables

# Ejecutar el ejemplo de errores recuperables
scarb execute --executable-name result_examples
```

## Dependencias

El proyecto utiliza las siguientes dependencias (definidas en `Scarb.toml`):

- `cairo_execute = "2.11.2+nightly-2025-03-12"`
- `cairo_test = "2.11.2"` (para tests)

## Notas Adicionales

- Los errores irrecuperables (`panic!`) son útiles cuando el programa no puede continuar de manera segura
- Los errores recuperables (`Result`) son preferibles cuando el error puede ser manejado por el código
- El operador `?` es una forma concisa de propagar errores en funciones que retornan `Result`
- Los tests son cruciales para verificar el comportamiento correcto del manejo de errores
