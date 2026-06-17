# Calculator — Dart

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Dart**, ejecutado con **dart test**.

Implementa 5 operaciones aritméticas (`addition`, `subtraction`, `multiplication`, `division`, `modulus`) usando únicamente `+` y `-` como operaciones primitivas.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`pubspec.yaml`](pubspec.yaml) | Manifiesto del proyecto Dart (dependencia `test`). |
| [`lib/calculator.dart`](lib/calculator.dart) | Punto de entrada de la biblioteca (exporta `calculator_base`). |
| [`lib/src/calculator_base.dart`](lib/src/calculator_base.dart) | Implementación de las 5 operaciones aritméticas. |
| [`test/calculator_test.dart`](test/calculator_test.dart) | 5 tests con `package:test`. |
| [`example/calculator_example.dart`](example/calculator_example.dart) | Ejemplo de uso. |

**Estructura de directorios esperada:**

```text
calculator/
├── pubspec.yaml                 # Manifiesto del proyecto
├── lib/
│   ├── calculator.dart          # Export público
│   └── src/
│       └── calculator_base.dart # 5 operaciones aritméticas
├── test/
│   └── calculator_test.dart     # 5 tests
├── example/
│   └── calculator_example.dart  # Ejemplo de uso
└── README.md                    # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Dart** con `pubspec.yaml` y el framework de testing `package:test`.

Características:
- **5 operaciones**: `addition`, `subtraction`, `multiplication`, `division`, `modulus`.
- **Implementación minimalista**: `multiplication`, `division` y `modulus` se construyen usando solo `+` y `-` como operaciones primitivas.
- **Framework de tests**: `package:test` — `dart test` ejecuta todos los tests en `test/`.
- **Métodos estáticos**: `Calculator` es una clase con métodos `static`.

**EN:** This project uses **Dart** with `pubspec.yaml` and the `package:test` testing framework.

Features:
- **5 operations**: `addition`, `subtraction`, `multiplication`, `division`, `modulus`.
- **Minimalist implementation**: `multiplication`, `division` and `modulus` are built using only `+` and `-` as primitive operations.
- **Test framework**: `package:test` — `dart test` runs all tests in `test/`.
- **Static methods**: `Calculator` is a class with `static` methods.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `pubspec.yaml` — Manifiesto del proyecto

**ES:** Define el nombre, versión, SDK requerido y dependencias (`test` para desarrollo).

**EN:** Defines the name, version, required SDK and dependencies (`test` for development).

```yaml
name: calculator
version: 1.0.0
environment:
  sdk: ^3.12.2
dev_dependencies:
  test: ^1.25.6
```

### `lib/src/calculator_base.dart` — Implementación

**ES:** Las 5 operaciones como métodos estáticos de la clase `Calculator`. `multiplication` suma repetidamente, `division` resta repetidamente, y `modulus` usa ambos.

**EN:** The 5 operations as static methods of class `Calculator`. `multiplication` repeatedly adds, `division` repeatedly subtracts, and `modulus` uses both.

```dart
class Calculator {
  static int addition(int a, int b) => a + b;
  static int subtraction(int a, int b) => a - b;

  static int multiplication(int a, int b) {
    int result = 0;
    for (int i = 0; i < b; i++) {
      result = addition(result, a);
    }
    return result;
  }

  static int division(int a, int b) {
    int quotient = 0;
    while (a >= b) {
      a = subtraction(a, b);
      quotient = addition(quotient, 1);
    }
    return quotient;
  }

  static int modulus(int a, int b) {
    int quotient = division(a, b);
    return subtraction(a, multiplication(b, quotient));
  }
}
```

### `test/calculator_test.dart` — Pruebas

**ES:** 5 tests con `group` y `test`. Usa `expect` con `equals` para las aserciones.

**EN:** 5 tests with `group` and `test`. Uses `expect` with `equals` for assertions.

```dart
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator Tests', () {
    test('Addition', () {
      expect(Calculator.addition(2, 3), equals(5));
    });

    test('Multiplication', () {
      expect(Calculator.multiplication(4, 3), equals(12));
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
cd core/foundations/unit_test/calculator
dart test
```

**Salida esperada / Expected output:**

```text
00:00 +5: All tests passed!
```

---

## 🧠 Algoritmos / operaciones

| Operación | Implementación | Primitivas usadas |
|-----------|---------------|-------------------|
| `addition(a, b)` | `a + b` | `+` |
| `subtraction(a, b)` | `a - b` | `-` |
| `multiplication(a, b)` | Suma repetitiva de `a`, `b` veces | `+` |
| `division(a, b)` | Resta repetitiva, cuenta cociente | `+`, `-` |
| `modulus(a, b)` | `a - (cociente * b)` | `+`, `-` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `for` y `while` son los mecanismos de iteración estándar de Dart.
- **EN:** `for` and `while` are Dart's standard iteration mechanisms.
- **ES:** Se usa `package:test` como framework de testing, el estándar en el ecosistema Dart.
- **EN:** `package:test` is the standard testing framework in the Dart ecosystem.
- **ES:** `dart pub get` descarga las dependencias (test) antes de ejecutar `dart test`.
- **EN:** `dart pub get` downloads dependencies (test) before running `dart test`.
- **ES:** La clase `Calculator` usa métodos `static` para no requerir instanciación.
- **EN:** The `Calculator` class uses `static` methods to avoid instantiation.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
