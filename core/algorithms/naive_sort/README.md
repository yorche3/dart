# Naive Sort — Dart

Implementación de la especificación [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) en **Dart**, ejecutado con **dart test**.

Los tres algoritmos elementales de ordenamiento ($O(n^2)$): **Selection Sort**, **Bubble Sort** e **Insertion Sort**, sobre listas de enteros y devolviendo `null` como indicador de fallo.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`pubspec.yaml`](pubspec.yaml) | Manifiesto del proyecto Dart (dependencia `test`). |
| [`lib/naive_sort.dart`](lib/naive_sort.dart) | Punto de entrada de la biblioteca (exporta `naive_sort_base`). |
| [`lib/src/naive_sort_base.dart`](lib/src/naive_sort_base.dart) | Clase `NaiveSort` — 3 métodos `static` de ordenamiento. |
| [`test/naive_sort_test.dart`](test/naive_sort_test.dart) | 3 tests (uno por algoritmo) sobre 8 casos compartidos. |
| [`test/run_tests.dart`](test/run_tests.dart) | Orquestador que ejecuta la suite. |
| [`example/naive_sort_example.dart`](example/naive_sort_example.dart) | Ejemplo de uso. |
| [`.gitignore`](.gitignore) | Ignora `.dart_tool/` y `pubspec.lock`. |

**Estructura de directorios esperada:**

```text
naive_sort/
├── pubspec.yaml                  # Manifiesto del proyecto
├── lib/
│   ├── naive_sort.dart           # Export público
│   └── src/
│       └── naive_sort_base.dart  # Clase NaiveSort (3 métodos static)
├── test/
│   ├── run_tests.dart            # Orquestador de pruebas
│   └── naive_sort_test.dart      # 3 tests (8 casos cada uno)
├── example/
│   └── naive_sort_example.dart   # Ejemplo de uso
├── .gitignore
└── README.md                     # Este archivo
```

**Nota sobre la estructura / Note about the structure:**

> **ES:** La estructura difiere de la especificada en la [documentación general](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/). Los motivos:
>
> | Especificación | Este proyecto | Motivo |
> |----------------|---------------|--------|
> | `src/naive_sort.ext` | `lib/src/naive_sort_base.dart` | `dart create` genera el código en `lib/src/` y lo exporta desde `lib/` |
> | `test/run_tests.ext` | `test/run_tests.dart` | Orquestador que agrupa la suite, igual que en `numbers` |
> | Nombres `selection_sort` | `selectionSort` | Dart usa `camelCase` para métodos |
>
> **EN:** The structure differs from the one specified in the [general documentation](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/). Reasons:
>
> | Specification | This project | Reason |
> |---------------|--------------|--------|
> | `src/naive_sort.ext` | `lib/src/naive_sort_base.dart` | `dart create` places code in `lib/src/` and exports it from `lib/` |
> | `test/run_tests.ext` | `test/run_tests.dart` | Orchestrator grouping the suite, same as in `numbers` |
> | Names `selection_sort` | `selectionSort` | Dart uses `camelCase` for methods |

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó con la plantilla de paquete de Dart:

```bash
dart create -t package naive_sort
```

La clase `NaiveSort` sigue la misma convención que `Numbers` en `numbers/`: métodos `static` agrupados en una clase, exportada mediante `lib/naive_sort.dart`.

**EN:** The project was created with the Dart package template (command above).

The `NaiveSort` class follows the same convention as `Numbers` in `numbers/`: `static` methods grouped in a class, exported through `lib/naive_sort.dart`.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `pubspec.yaml` — Manifiesto del proyecto

**ES:** Define el nombre, versión, SDK requerido y dependencias (`test` para desarrollo).

**EN:** Defines the name, version, required SDK and dependencies (`test` for development).

```yaml
name: naive_sort
version: 1.0.0
environment:
  sdk: ^3.12.2

dev_dependencies:
  lints: ^6.0.0
  test: ^1.25.6
```

### `lib/src/naive_sort_base.dart` — Implementación

**ES:** Las tres funciones mutan la lista recibida (*in-place*) y la devuelven; ante `null` devuelven `null` como indicador de fallo.

**EN:** All three functions mutate the received list (in-place) and return it; on `null` they return `null` as the failure indicator.

```dart
class NaiveSort {
  static List<int>? selectionSort(List<int>? arr) {
    if (arr == null || arr.isEmpty || arr.length == 1) {
      return arr;
    }
    for (int i = 0; i < arr.length - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
    return arr;
  }
}
```

### `test/naive_sort_test.dart` — Pruebas

**ES:** Un `typedef` para el tipo de función, constantes para cada caso y un helper compartido que ejecuta las 8 aserciones. Cada caso copia su entrada con `List<int>.of` antes de ordenarla, de modo que ningún caso contamine a otro.

**EN:** A `typedef` for the function type, constants for every case, and a shared helper running the 8 assertions. Each case copies its input with `List<int>.of` before sorting, so no case contaminates another.

```dart
typedef SortFunction = List<int>? Function(List<int>?);

void assertSortsAllCases(SortFunction sort, String algorithmName) {
  expect(sort(List<int>.of(standardInput)), equals(standardOutput),
      reason: '$algorithmName should sort an unsorted array');
  // ...
  expect(sort(null), isNull,
      reason: '$algorithmName should return the failure indicator for a null array');
}

void suiteNaiveSortTests() {
  group('NaiveSort Tests', () {
    test('Selection sort', () {
      assertSortsAllCases(NaiveSort.selectionSort, 'selectionSort');
    });
    // ...
  });
}
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Dart SDK instalado

```bash
dart --version
```

### Configurar dependencias (primera vez)

```bash
dart pub get
```

### Ejecutar pruebas

```bash
cd core/algorithms/naive_sort
dart test
```

**Salida real / Actual output:**

```text
00:00 +0: loading test/naive_sort_test.dart
00:00 +0: test/naive_sort_test.dart: NaiveSort Tests Selection sort
00:00 +1: test/naive_sort_test.dart: NaiveSort Tests Bubble sort
00:00 +2: test/naive_sort_test.dart: NaiveSort Tests Insertion sort
00:00 +3: All tests passed!
```

### Análisis estático

```bash
dart analyze
```

**Salida real / Actual output:**

```text
Analyzing naive_sort...
No issues found!
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

### 3 algoritmos / 3 tests × 8 casos = 24 aserciones

| Función | Estrategia | Complejidad temporal | In-place | Tests |
|---------|------------|---------------------|:--------:|:-----:|
| `selectionSort` | Encuentra el mínimo del resto no ordenado y lo ubica al inicio | $O(n^2)$ siempre | ✅ | 1 |
| `bubbleSort` | Compara e intercambia adyacentes; corta antes si no hubo swaps | $O(n^2)$ peor/promedio, $O(n)$ mejor | ✅ | 1 |
| `insertionSort` | Construye el sub-array ordenado insertando cada elemento en su posición | $O(n^2)$ peor/promedio, $O(n)$ mejor | ✅ | 1 |

### Casos cubiertos / Covered cases

Cada test ejecuta los mismos 8 casos a través del helper compartido:

| # | Caso | Entrada | Salida esperada |
|---|------|---------|-----------------|
| 1 | Lista estándar desordenada | `[5, 2, 9, 1, 5, 6]` | `[1, 2, 5, 5, 6, 9]` |
| 2 | Lista ya ordenada | `[1, 2, 3, 4, 5]` | `[1, 2, 3, 4, 5]` |
| 3 | Lista en orden inverso | `[5, 4, 3, 2, 1]` | `[1, 2, 3, 4, 5]` |
| 4 | Elementos idénticos | `[7, 7, 7, 7]` | `[7, 7, 7, 7]` |
| 5 | Con números negativos | `[3, -1, 4, -5, 0]` | `[-5, -1, 0, 3, 4]` |
| 6 | Un solo elemento | `[42]` | `[42]` |
| 7 | Lista vacía | `[]` | `[]` |
| 8 | Entrada nula (indicador de fallo) | `null` | `null` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** El parámetro y el retorno son `List<int>?` porque `null` es el **indicador de fallo** del lenguaje para una entrada inválida, tal como exige la especificación. Ninguna función lanza excepciones.
- **EN:** Both parameter and return are `List<int>?` because `null` is the language's **failure indicator** for an invalid input, as required by the specification. No function throws exceptions.
- **ES:** Los tres algoritmos ordenan **in-place**: mutan y devuelven la misma lista recibida.
- **EN:** All three algorithms sort **in-place**: they mutate and return the same list received.
- **ES:** `bubbleSort` incluye la optimización de salida temprana con la bandera `swapped` exigida por los criterios de aceptación; `selectionSort` evita el swap cuando `minIndex == i`.
- **EN:** `bubbleSort` includes the early-exit optimization with the `swapped` flag required by the acceptance criteria; `selectionSort` skips the swap when `minIndex == i`.
- **ES:** La guarda `arr == null || arr.isEmpty || arr.length == 1` cubre los casos nulo, vacío y de un elemento devolviendo la entrada tal cual.
- **EN:** The `arr == null || arr.isEmpty || arr.length == 1` guard covers the null, empty and single-element cases by returning the input unchanged.
- **ES:** Los *fixtures* del test son `const`, por lo que cada caso ordena su propia copia con `List<int>.of`. Así se evita que el ordenamiento *in-place* contamine los demás casos o falle contra una lista inmutable.
- **EN:** The test fixtures are `const`, so each case sorts its own copy with `List<int>.of`. This prevents the in-place sort from contaminating the other cases or failing against an immutable list.
- **ES:** No se usan funciones de ordenamiento de la biblioteca estándar (`List.sort`, `collection` de `package:collection`, etc.).
- **EN:** No standard-library sorting functions are used (`List.sort`, `package:collection`'s `collection`, etc.).
- **ES:** `dart analyze` se ejecuta sin issues; el proyecto usa `package:lints/recommended.yaml` vía `analysis_options.yaml`.
- **EN:** `dart analyze` runs with no issues; the project uses `package:lints/recommended.yaml` through `analysis_options.yaml`.
- **ES:** Los directorios `.dart_tool/` y el archivo `pubspec.lock` son generados por `dart pub` y no deben versionarse. Ver [`.gitignore`](.gitignore).
- **EN:** The `.dart_tool/` directories and the `pubspec.lock` file are generated by `dart pub` and should not be versioned. See [`.gitignore`](.gitignore).

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*[← Volver a Algoritmos Puros](../README.md) | [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
