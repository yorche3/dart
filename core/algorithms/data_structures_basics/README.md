# Data Structures Basics — Dart

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics) en **Dart**, con un enfoque manual y minimalista.

**ES:** Un único `Node` compartido y tres estructuras enlazadas (`LinkedList`, `Stack`, `Queue`) construidas a mano, sin colecciones de la biblioteca estándar. Se ejecuta con `dart test` (paquete `test`) y `dart analyze`.

**EN:** A single shared `Node` and three hand-built linked structures (`LinkedList`, `Stack`, `Queue`), with no standard-library collections. Run with `dart test` (`test` package) and `dart analyze`.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `lib/src/data_structures_basics_base.dart` | `failureValue`, `Node`, `LinkedList`, `Stack`, `Queue` / Main source code |
| `lib/data_structures_basics.dart` | Exporta la API pública / Exports the public API |
| `test/data_structures_basics_test.dart` | Suite de pruebas (`suiteDataStructuresBasicsTests`) / Test suite |
| `test/run_tests.dart` | Punto de entrada que invoca la suite / Entry point invoking the suite |
| `example/data_structures_basics_example.dart` | Ejemplo de uso / Usage example |
| `pubspec.yaml`, `analysis_options.yaml` | Manifiesto y lints / Manifest and lints |
| `.gitignore` | Excluye `.dart_tool/` y `pubspec.lock` / Ignores generated files |

**Nota de desviación / Deviation note:**

**ES:** la especificación espera `src/data_structures_basics.ext`; aquí el código vive en `lib/src/` y se exporta desde `lib/data_structures_basics.dart`, la convención de paquete de Dart (`dart create -t package`) que permite `import 'package:data_structures_basics/...'`. `test/run_tests.dart` sí existe.

**EN:** the specification expects `src/data_structures_basics.ext`; here the code lives in `lib/src/` and is exported from `lib/data_structures_basics.dart`, the Dart package convention (`dart create -t package`) enabling `import 'package:data_structures_basics/...'`. `test/run_tests.dart` does exist.

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Proyecto creado con la plantilla de paquete de Dart y completado a mano.

**EN:** Project created with the Dart package template and completed by hand.

```bash
dart create -t package data_structures_basics
```

## 📄 Configuración clave / Key Configuration

- `pubspec.yaml`: SDK `^3.12.2`; dev-dependencies `lints: ^6.0.0` y `test: ^1.25.6`; sin dependencias de ejecución / no runtime dependencies.
- `analysis_options.yaml`: `include: package:lints/recommended.yaml`.

## 🚀 Compilación y ejecución / Build & Run

```bash
dart pub get
dart analyze
dart test
dart run test/run_tests.dart
dart run example/data_structures_basics_example.dart
```

**Salida real / Actual output:**

```text
Analyzing data_structures_basics...
No issues found!

00:00 +0: loading test/data_structures_basics_test.dart
00:00 +0: test/data_structures_basics_test.dart: DataStructuresBasics Tests Node
00:00 +1: test/data_structures_basics_test.dart: DataStructuresBasics Tests LinkedList
00:00 +2: test/data_structures_basics_test.dart: DataStructuresBasics Tests Stack
00:00 +3: test/data_structures_basics_test.dart: DataStructuresBasics Tests Queue
00:00 +4: All tests passed!

+4: All tests passed!    (dart run test/run_tests.dart, última línea / last line)

LinkedList: size=3, head=5
Stack: size=2, peek=20
Queue: size=2, peek=10
```

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node(value)`, `.value`, `.next` | `int → Node` | `O(1)` | `next` es `Node?`, ausente al construir / absent on construction |
| `LinkedList()`, `isEmpty`, `size`, `getHead` | `→ bool / int / int` | `O(1)` | `getHead` devuelve `failureValue` si vacía / if empty |
| `insertHead`, `insertTail` | `int → void` | `O(1)` | Mantiene `head` y `tail` / keeps `head` and `tail` |
| `delete` | `int → bool` | `O(n)` | Elimina la primera aparición / first occurrence |
| `Stack.push`, `pop`, `peek`, `isEmpty`, `size` | `int → void / int` | `O(1)` | LIFO sobre `top` |
| `Queue.enqueue`, `dequeue`, `peek`, `isEmpty`, `size` | `int → void / int` | `O(1)` | FIFO sobre `front`/`rear` |

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Campos `head`, `tail`, `top`, `front`, `rear`, `next` públicos | Campos privados con getters/setters | Los tests recorren los enlaces del contrato (`get_head`/`get_next`) sin API extra / Tests traverse contract links without extra API |
| Contador privado `_count` | Recalcular recorriendo nodos | `size`/`isEmpty` en `O(1)` como exige el contrato / `O(1)` as the contract demands |
| Clases `final class` sin interfaz | `abstract interface class` | Una sola implementación por estructura (spec: no se exige contrato aparte) / single implementation per structure |

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init(...)` explícito tras declarar | Constructor por defecto (`Node(value)`, `LinkedList()`, `Stack()`, `Queue()`) con `_count = 0` y enlaces `null` | Dart no permite instancias sin construir; el constructor es el `init` idiomático y deja el mismo estado inicial / Dart has no uninitialized instances; the constructor is the idiomatic `init` |
| `get_value()`, `get_next()`, `set_next()` | Campos `value` (`final`) y `next` (`Node?`, mutable) | Dart expone campos como accesores; la mutabilidad hace innecesario devolver un nodo nuevo / fields act as accessors; mutability avoids returning a new node |
| Ausencia de enlace | `null` (`Node?`) | Representación nativa por nulabilidad sana / native via sound null safety |
| `snake_case` (`insert_head`, `get_head`) | `lowerCamelCase` (`insertHead`, `getHead`) | Convención de Dart (`effective dart`) / Dart naming convention |
| `if tail == current: tail = previous` en `delete` | `if (current.next == null) tail = previous` | Equivalente: el nodo es la cola exactamente cuando no tiene siguiente / equivalent: a node is the tail exactly when it has no next |
| `peek`/`getHead` con `is_empty()` o `top is absent` | `top?.value ?? failureValue` | Mismo comportamiento observable con operadores nulos / same observable behaviour via null-aware operators |
| `src/` | `lib/src/` | Ver nota de desviación / see deviation note |

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `LinkedList.getHead` | Lista vacía / empty list | `failureValue` (`-1`) | `LinkedList().getHead()` → `-1` |
| `LinkedList.delete` | Valor ausente / absent value | `false` (éxito: `true`) | `delete(99)` → `false` |
| `Stack.pop`, `Stack.peek` | Pila vacía / empty stack | `failureValue` (`-1`) | `Stack().pop()` → `-1` |
| `Queue.dequeue`, `Queue.peek` | Cola vacía / empty queue | `failureValue` (`-1`) | `Queue().dequeue()` → `-1` |
| Inserciones / insertions | Sin límite de capacidad / no capacity limit | No aplica / Not applicable | — |
| Entrada nula / null input | Los parámetros son `int` no anulable | No representable / Not representable | Caso omitido: la especificación no define entradas nulas para este módulo / case omitted: the spec defines no null inputs |

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|---|---|
| Node: inicializar y observar valor/enlace | Sí | `Node` (`data_structures_basics_test.dart`) | |
| Node: enlazar y recorrer | Sí | `Node` | |
| LinkedList: estado vacío | Sí | `LinkedList` | |
| LinkedList: insertar por ambos extremos | Sí | `LinkedList` | `5, 10, 20, 10` |
| LinkedList: eliminar primera aparición | Sí | `LinkedList` | `5, 20, 10`; tamaño 3 |
| LinkedList: valor ausente | Sí | `LinkedList` | |
| LinkedList: vaciar | Sí | `LinkedList` | |
| Stack: estado vacío y extracción fallida | Sí | `Stack` | |
| Stack: LIFO y `peek` no mutante | Sí | `Stack` | |
| Stack: extracción y reutilización | Sí | `Stack` | `30, 40, 20, 10` |
| Stack: vacío tras extracción | Sí | `Stack` | |
| Queue: estado vacío y extracción fallida | Sí | `Queue` | |
| Queue: FIFO y `peek` no mutante | Sí | `Queue` | |
| Queue: extracción y reutilización | Sí | `Queue` | `10, 20, 30, 40` |
| Queue: vacío tras extracción | Sí | `Queue` | |

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Solo `int` (sin genéricos) / `int` only, no generics | `-1` no es almacenable como dato sin confundirse con el fallo / `-1` cannot be stored without clashing with the failure indicator | Los valores de prueba son enteros positivos, como fija la especificación / tests use positive integers per the spec |

## 📝 Notas de implementación / Implementation Notes

- **ES:** Un único `Node(value)` lo comparten las tres estructuras; `Stack` gestiona `top` y `Queue` gestiona `front`/`rear` sin delegar en `LinkedList` ni en colecciones estándar. **EN:** The three structures share a single `Node(value)`; `Stack` manages `top` and `Queue` manages `front`/`rear` with no delegation to `LinkedList` or standard collections.
- **ES:** Caso nulo: no existe; `value` es `int` y los enlaces ausentes son `null`. El fallo se señala con `failureValue = -1` o `false`. Ninguna operación lanza excepciones. **EN:** Null case: none exists; `value` is `int` and absent links are `null`. Failure is signalled by `failureValue = -1` or `false`. No operation throws.
- **ES:** Los tests recorren cada tabla de la especificación en una sola prueba por estructura, sobre la misma instancia. **EN:** Tests walk each specification table in a single test per structure, on the same instance.
- **ES:** Sin imports hacia otros módulos del roadmap. **EN:** No imports from other roadmap modules.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_.
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics) |
| Módulo homologado del lenguaje / Homologated module | [`dart/core/foundations/numbers/`](../../foundations/numbers/) |
| Documentación oficial del lenguaje / Language official docs | [Dart language tour](https://dart.dev/language) |

---

*[← Volver a Algoritmos Puros](../README.md) | [↑ Volver a Core](../../README.md)*
