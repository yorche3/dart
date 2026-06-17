# Numbers — Dart

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Dart**, ejecutado con **dart test**.

Implementa 5 algoritmos fundamentales (suma de los primeros N naturales, factorial, Fibonacci, MCD, MCM) utilizando dos enfoques principales: **recursivo directo** e **iterativo**, más un enfoque auxiliar con **acumulador** en métodos de instancia.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`pubspec.yaml`](pubspec.yaml) | Manifiesto del proyecto Dart (dependencia `test`). |
| [`lib/numbers.dart`](lib/numbers.dart) | Punto de entrada de la biblioteca (exporta `numbers_base`). |
| [`lib/src/numbers_base.dart`](lib/src/numbers_base.dart) | 15 funciones (3 enfoques × 5 algoritmos). |
| [`test/numbers_rec_test.dart`](test/numbers_rec_test.dart) | 5 tests para el enfoque recursivo directo. |
| [`test/numbers_ite_test.dart`](test/numbers_ite_test.dart) | 5 tests para el enfoque iterativo. |
| [`test/run_tests.dart`](test/run_tests.dart) | Orquestador que ejecuta ambas suites. |
| [`example/numbers_example.dart`](example/numbers_example.dart) | Ejemplo de uso. |

**Estructura de directorios esperada:**

```text
numbers/
├── pubspec.yaml                  # Manifiesto del proyecto
├── lib/
│   ├── numbers.dart              # Export público
│   └── src/
│       └── numbers_base.dart     # 15 funciones (3 enfoques × 5 algoritmos)
├── test/
│   ├── run_tests.dart            # Orquestador de pruebas
│   ├── numbers_rec_test.dart     # 5 tests recursivos
│   └── numbers_ite_test.dart     # 5 tests iterativos
├── example/
│   └── numbers_example.dart      # Ejemplo de uso
└── README.md                     # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Dart** con `pubspec.yaml` y el framework de testing `package:test`.

Cada algoritmo se implementa de tres formas distintas:

1. **Recursivo Directo (`...Rec`)**: Métodos `static` basados directamente en la definición matemática, con llamadas recursivas.
2. **Recursivo con Acumulador (`...Acc`)**: Expone un método de instancia que delega en un helper privado interno. Los acumuladores correctos (`sumFirstNAcc`) pasan estado vía tail recursion; los otros (`factorialAcc`, `fibonacciAcc`) son envoltorios de recursión directa sin acumulador real.
3. **Iterativo (`...Iter`)**: Métodos `static` que utilizan bucles `for`/`while` para evitar el crecimiento de la pila.

**EN:** This project uses **Dart** with `pubspec.yaml` and the `package:test` testing framework.

Each algorithm is implemented in three different ways:

1. **Direct Recursive (`...Rec`)**: `static` methods based directly on the mathematical definition, with recursive calls.
2. **Accumulator Recursive (`...Acc`)**: Exposes an instance method that delegates to an internal private helper. Correct accumulators (`sumFirstNAcc`) pass state via tail recursion; others (`factorialAcc`, `fibonacciAcc`) are wrappers around direct recursion without a real accumulator.
3. **Iterative (`...Iter`)**: `static` methods using `for`/`while` loops to avoid stack growth.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `pubspec.yaml` — Manifiesto del proyecto

**ES:** Define el nombre, versión, SDK requerido y dependencias (`test` para desarrollo).

**EN:** Defines the name, version, required SDK and dependencies (`test` for development).

```yaml
name: numbers
version: 1.0.0
environment:
  sdk: ^3.12.2
dev_dependencies:
  test: ^1.25.6
```

### `lib/src/numbers_base.dart` — Implementación

**ES:** La clase `Numbers` mezcla métodos `static` (recursivos e iterativos) con métodos de instancia (acumuladores). Los acumuladores reales solo existen para `sumFirstN`; los demás son envoltorios sin acumulador.

**EN:** The `Numbers` class mixes `static` methods (recursive and iterative) with instance methods (accumulators). Real accumulators only exist for `sumFirstN`; the rest are wrappers without an accumulator.

```dart
class Numbers {
  // Métodos estáticos — recursivos e iterativos
  static int fibonacciRec(int n) { ... }
  static int fibonacciIter(int n) { ... }
  static int largestCommonDivisorIter(int a, int b) { ... }

  // Métodos de instancia — acumuladores
  int _sumFirstNHelp(int n, int sum) {   // Tail recursion (acumulador real)
    if (n <= 0) return sum;
    return _sumFirstNHelp(n - 1, sum + n);
  }
  int sumFirstNAcc(int n) => _sumFirstNHelp(n, 0);
}
```

### `test/numbers_rec_test.dart` — Pruebas recursivas

**ES:** 5 tests con `group` y `test`, cada uno con aserciones `expect`.

**EN:** 5 tests with `group` and `test`, each with `expect` assertions.

```dart
import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

void suiteRecursiveTests() {
  group('Recursive Tests', () {
    test('Fibonacci', () {
      expect(Numbers.fibonacciRec(0), 0);
      expect(Numbers.fibonacciRec(1), 1);
      expect(Numbers.fibonacciRec(6), 8);
    });
    // ...
  });
}
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Dart SDK instalado

```bash
brew install dart     # macOS / Linux
```

### Configurar dependencias (primera vez)

```bash
dart pub get
```

### Ejecutar pruebas

```bash
cd core/foundations/numbers
dart test
```

**Salida esperada / Expected output:**

```text
00:00 +10: All tests passed!
```

---

## 🧠 Algoritmos / operaciones

### 3 enfoques × 5 algoritmos = 15 funciones / 10 tests

| Algoritmo | Casos de prueba | `Rec` | `Acc` | `Iter` |
|-----------|----------------|:-----:|:-----:|:------:|
| `sumFirstN` | `(0) = 0`, `(3) = 6` | ✅ | ✅¹ | ✅ |
| `factorial` | `(0) = 1`, `(4) = 24` | ✅ | ❌² | ✅ |
| `fibonacci` | `(0) = 0`, `(1) = 1`, `(6) = 8` | ✅ | ❌² | ✅ |
| `largestCommonDivisor` | `(12, 8) = 4`, `(7, 5) = 1` | ✅ | —³ | ✅ |
| `leastCommonMultiple` | `(8, 6) = 24`, `(6, 4) = 12` | ✅ | —³ | ✅ |

> ¹ `sumFirstNAcc` sí implementa tail recursion real con acumulador.
> ² `factorialAcc` y `fibonacciAcc` son envoltorios de recursión directa sin acumulador real.
> ³ No hay implementación con acumulador para MCD y MCM.

---

## 📝 Notas de implementación / Implementation Notes

### 🔁 Sobre recursión con acumulador / On recursion with accumulator

**ES:**

- **Dart no garantiza TCO**. Aunque Dart VM y el compilador AOT pueden optimizar ciertos patrones, la tail call optimization no es parte de la especificación del lenguaje.
- Solo `sumFirstNAcc` implementa tail recursion real con un helper que acumula. Los demás métodos `...Acc` son envoltorios sin acumulador.
- Los métodos con acumulador son de instancia (no `static`), a diferencia de los recursivos e iterativos que son estáticos.

**EN:**

- **Dart does not guarantee TCO**. Although the Dart VM and AOT compiler may optimize certain patterns, tail call optimization is not part of the language specification.
- Only `sumFirstNAcc` implements real tail recursion with an accumulator helper. The other `...Acc` methods are wrappers without an accumulator.
- Accumulator methods are instance methods (not `static`), unlike recursive and iterative ones which are static.

### Sobre la implementación / On the implementation

- **ES:** `~` es el operador de división entera en Dart.
- **EN:** `~` is the integer division operator in Dart.
- **ES:** La clase `Numbers` mezcla métodos `static` y de instancia. Los tests solo acceden a los `static`.
- **EN:** The `Numbers` class mixes `static` and instance methods. Tests only access the `static` ones.
- **ES:** `dart pub get` descarga las dependencias antes de ejecutar `dart test`.
- **EN:** `dart pub get` downloads dependencies before running `dart test`.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
