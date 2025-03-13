# Generando una Prueba de Conocimiento Cero en Cairo

Este proyecto es un ejemplo práctico para demostrar cómo generar y verificar una prueba de conocimiento cero (ZKP) utilizando el lenguaje de programación Cairo y el probador Stwo a través de Scarb. El ejercicio se centra en comprobar la primalidad de un número (en este caso, el número 17) mediante un algoritmo simple.

## Descripción del Ejercicio

El archivo `prime_prover.cairo` implementa dos funciones principales:

- `is_prime`: Comprueba si un número es primo utilizando un algoritmo de división por tanteo. Se evalúan casos especiales (números menores o iguales a 1, el 2 y números pares) y se prueba con divisores impares hasta la raíz cuadrada del número.
- `n_primo`: Es la función de entrada marcada con `#[executable]`. Toma un número de tipo `u128` como entrada, verifica que no exceda un límite arbitrario (1,000,000) y llama a `is_prime` para determinar si el número es primo. Además, se imprimen mensajes en consola en cada paso para facilitar el seguimiento del proceso.

## Comandos Utilizados y Salidas

### 1. Ejecución del Programa

Para ejecutar el programa y comprobar la primalidad del número 17, se utilizó el siguiente comando:

```bash
scarb execute --executable-name n_primo --print-program-output --arguments 17
```

**Salida en consola:**

```
Numero de entrada: 17
Verificando si 17 es primo
Probando divisor: 3
No se encontro divisor menor o igual a la raiz cuadrada de 17. Entonces, 17 es primo.
Resultado: 17 es primo? true
Program output:
0
1
Saving output to: target/execute/zkp/execution1
```

- **Explicación:**
  - Se muestra el número de entrada (17) y el proceso de verificación, incluyendo la prueba con el divisor 3.
  - Se confirma que 17 es primo (resultado `true`).
  - La salida "0" indica que la ejecución fue exitosa y "1" representa el valor booleano `true`.

### 2. Generación de la Prueba de Conocimiento Cero

Para generar la prueba se usó el comando:

```bash
scarb prove --execution-id 1
```

**Salida en consola:**

```
Proving zkp
warn: soundness of proof is not yet guaranteed by Stwo, use at your own risk
Saving proof to: target/execute/zkp/execution1/proof/proof.json
```

- **Explicación:**
  - El probador intenta generar una prueba que certifica que la ejecución se realizó correctamente.
  - Se guarda el archivo `proof.json` en la ruta indicada.

### 3. Verificación de la Prueba

Para verificar la prueba generada, se ejecutó:

```bash
scarb verify --execution-id 1
```

**Salida en consola:**

```
Verifying zkp
Verified proof successfully
```

- **Explicación:**
  - El verificador confirma que la prueba es válida, asegurando que la comprobación de la primalidad se realizó de forma correcta sin necesidad de revelar la entrada.

## Ejercicio Adicional: Verificación de Números Pares

El archivo `par_prover.cairo` implementa una verificación simple para determinar si un número es par.

### 1. Ejecución del Programa

Para ejecutar el programa y verificar si el número 8 es par, se utilizó el siguiente comando:

```bash
scarb execute --executable-name numero_par --print-program-output --arguments 8
```

**Salida en consola:**

```
Program output:
0
1
Saving output to: target/execute/zkp/execution1
```

- **Explicación:**
  - La salida "0" indica que la ejecución fue exitosa y "1" representa que el número es par.

### 2. Generación de la Prueba

```bash
scarb prove --execution-id 1
```

**Salida en consola:**

```
Proving zkp
warn: soundness of proof is not yet guaranteed by Stwo, use at your own risk
thread 'main' panicked at /cargo/git/checkouts/stwo-cairo-ef02e8e85a2fe399/c0f36e2/stwo_cairo_prover/crates/prover/src/components/range_check_builtin_bits_128/prover.rs:16:9:
assertion failed: log_size >= LOG_N_LANES
note: run with RUST_BACKTRACE=1 environment variable to display a backtrace
```

- **Explicación:**
  - Se intentó generar una prueba ZKP para verificar que la ejecución fue correcta.
  - Sin embargo, ocurrió un error interno relacionado con `LOG_N_LANES`, lo que sugiere una posible incompatibilidad o configuración incorrecta en el probador.

## Conclusión

Este ejercicio demuestra cómo:

- Configurar un proyecto en Cairo y definir objetivos ejecutables en Scarb.
- Implementar una función para comprobar la primalidad de un número y verificar si un número es par.
- Ejecutar el programa y visualizar el proceso paso a paso mediante mensajes en consola.
- Generar y verificar pruebas de conocimiento cero usando Scarb y el probador Stwo.

¡Experimenta cambiando la entrada o ajustando el algoritmo para profundizar en el uso de pruebas de conocimiento cero en Cairo!

