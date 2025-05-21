# Tipos, Rasgos y Genéricos en Cairo

Este proyecto demuestra el uso de tipos, rasgos (traits) y genéricos en el lenguaje de programación Cairo. El proyecto contiene dos ejemplos principales que ilustran estos conceptos fundamentales.

## Estructura del Proyecto

```
tipos_rasgos_genericos/
├── src/
│   ├── datos_genericos.cairo    # Implementación de tipos genéricos
│   ├── trait_in_cairo.cairo     # Implementación de traits
│   ├── main.cairo               # Punto de entrada principal
│   └── lib.cairo                # Definición de módulos
└── Scarb.toml                   # Configuración del proyecto
```

## Componentes

### 1. Datos Genéricos (`datos_genericos.cairo`)

Este archivo demuestra el uso de tipos genéricos en Cairo a través de una implementación de una estructura `Wallet` que puede trabajar con diferentes tipos de datos para el balance.

#### Características:

- Implementación de una estructura genérica `Wallet<T>`
- Definición del trait `WalletTrait<T>` para funcionalidad común
- Implementaciones específicas para `Wallet<u32>` y `Wallet<bool>`
- Función para encontrar la wallet con mayor balance
- Demostración de uso con diferentes tipos de datos (u32 y bool)

#### Salida de Consola:

```
Wallet 1:
Wallet Info
Owner: 123
Balance: 100

Wallet 2:
Wallet Info
Owner: 456
Balance: 200

Wallet con mayor balance:
Wallet Info
Owner: 456
Balance: 200

Wallet 3 (boolean):
Wallet Info
Owner: 789
Balance: true

Wallet 4 (boolean):
Wallet Info
Owner: 101
Balance: false
```

### 2. Traits en Cairo (`trait_in_cairo.cairo`)

Este archivo ilustra el uso de traits (rasgos) en Cairo mediante la implementación de un sistema de resúmenes para diferentes tipos de contenido.

#### Características:

- Definición del trait `Summary`
- Implementación para `NewsArticle` y `Tweet`
- Métodos para generar resúmenes y obtener información del autor

#### Salida de Consola:

```
=== Demostracion de Traits en Cairo ===

Articulo de Noticias:
Resumen: Cairo El lenguaje del futuro por Cairo Developer (Mundo)
Autor: Autor: Cairo Developer

Tweet:
Resumen: CairoFan: Aprendiendo Cairo! #ZeroKnowledge
Autor: @CairoFan
```

### Archivos de Configuración

#### `main.cairo`

Punto de entrada principal que ejecuta ambos ejemplos:

```cairo
fn main() {
    generic_data()
    trait_cairo()
}
```

#### `lib.cairo`

Define los módulos del proyecto:

```cairo
mod datos_genericos;
mod trait_in_cairo;
```

#### `Scarb.toml`

Configuración del proyecto con dos targets ejecutables:

```toml
[[target.executable]]
name = "generic_data"
function = "tipos_rasgos_genericos::datos_genericos::generic_data"

[[target.executable]]
name = "trait_cairo"
function = "tipos_rasgos_genericos::trait_in_cairo::trait_cairo"
```

## Ejecución

Para ejecutar los ejemplos, puedes usar los siguientes comandos:

1. Para ejecutar el ejemplo de tipos genéricos:

```bash
scarb execute --executable-name generic_data
```

2. Para ejecutar el ejemplo de traits:

```bash
scarb execute --executable-name trait_cairo
```

3. Para ejecutar ambos ejemplos:

```bash
scarb execute
```

## Requisitos

- Cairo 2.11.2 o superior
- Scarb (gestor de paquetes de Cairo)

## Dependencias

El proyecto utiliza las siguientes dependencias:

- `cairo_execute = "2.11.2+nightly-2025-03-12"`
- `cairo_test = "2.11.2"` (para desarrollo)

## Notas

- El proyecto tiene deshabilitado el cálculo de gas (`enable-gas = false`) para simplificar la ejecución de los ejemplos.
- Los ejemplos están diseñados para ser educativos y demostrar conceptos fundamentales de Cairo.
- Cada ejemplo puede ejecutarse de forma independiente o todos juntos a través del archivo `main.cairo`.
