# Data Structures Advanced — Dart

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced) en **Dart**, con un enfoque manual y minimalista.

**ES:** Base abstracta `Node` con valor reutilizada por herencia en `TreeNode` (enlaces izquierdo y derecho) y `_GraphNode` (registro canónico y adyacencia dirigida). `BinaryTree` y `Graph` implementan búsqueda e inserción manuales sin estructuras asociativas de la biblioteca estándar. Se ejecuta con `dart test` (paquete `test`) y `dart analyze`.

**EN:** Abstract base `Node` carrying value reused via inheritance by `TreeNode` (left and right links) and `_GraphNode` (canonical registry and directed adjacency). `BinaryTree` and `Graph` implement manual search and insertion without standard library associative containers. Run with `dart test` (`test` package) and `dart analyze`.

---

## 📂 Archivos y estructura / Files & Structure

Describe la estructura del proyecto y el propósito de cada archivo.

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `lib/src/data_structures_advanced_base.dart` | `Node`, `TreeNode`, `BinaryTree`, `_GraphNode`, `Graph` / Main source code |
| `lib/data_structures_advanced.dart` | Exporta la API pública del módulo / Exports public API |
| `test/data_structures_advanced_test.dart` | Suite de pruebas unitarias (`suiteDataStructuresAdvancedTests`) / Unit test suite |
| `test/run_tests.dart` | Punto de entrada ejecutable de las pruebas / Test entry point |
| `example/data_structures_advanced_example.dart` | Ejemplo de uso / Usage example |
| `pubspec.yaml`, `analysis_options.yaml` | Manifiesto y reglas de linting / Manifest and lints |
| `.gitignore` | Exclusiones de build y dependencias (`.dart_tool/`, `pubspec.lock`) / Ignored files |

**Nota de desviación / Deviation note:**

**ES:** La especificación propone `src/data_structures_advanced.ext`; en Dart el código fuente reside en `lib/src/` y se expone mediante `lib/data_structures_advanced.dart` conforme a las convenciones estándar de paquetes de Dart (`dart create -t package`), permitiendo imports mediante `package:data_structures_advanced/...`.

**EN:** The specification suggests `src/data_structures_advanced.ext`; in Dart source code lives under `lib/src/` and is exposed through `lib/data_structures_advanced.dart` following standard Dart package conventions (`dart create -t package`), allowing `package:data_structures_advanced/...` imports.

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Proyecto creado con la herramienta oficial de Dart (`dart create -t package`) y completado a mano sin dependencias de ejecución externas.

**EN:** Project created with the official Dart tooling (`dart create -t package`) and completed by hand without external runtime dependencies.

```bash
dart create -t package data_structures_advanced
```

## 📄 Configuración clave / Key Configuration

- `pubspec.yaml`: SDK `^3.12.2`; dependencias de desarrollo `lints: ^6.0.0` y `test: ^1.25.6`; sin dependencias de ejecución (`dependencies` vacío).
- `analysis_options.yaml`: `include: package:lints/recommended.yaml`.

## 🚀 Compilación y ejecución / Build & Run

```bash
dart pub get
dart analyze
dart test
dart run test/run_tests.dart
```

**Salida real / Actual output:**

```text
Analyzing data_structures_advanced...
No issues found!

00:00 +0: loading test/data_structures_advanced_test.dart
00:00 +0: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests TreeNode Create a tree node
00:00 +1: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests TreeNode Absent initial links
00:00 +2: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests TreeNode Link two children
00:00 +3: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests TreeNode Traverse each link
00:00 +4: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests TreeNode Unlink children
00:00 +5: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Create empty
00:00 +6: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Insert the root
00:00 +7: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Insert lower and higher
00:00 +8: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Multilevel branches
00:00 +9: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Missing value in nonempty tree
00:00 +10: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Idempotent duplicate
00:00 +11: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests BinaryTree Ordered insertions
00:00 +12: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Create empty
00:00 +13: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Isolated vertex
00:00 +14: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Nonconsecutive labels and directed edge
00:00 +15: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Duplicate vertex preserves adjacency
00:00 +16: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Duplicate edge
00:00 +17: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Missing endpoint without mutation
00:00 +18: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Sorted neighbours and counts
00:00 +19: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Missing-edge query
00:00 +20: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Neighbours of missing vertex
00:00 +21: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Self-loop and duplicate
00:00 +22: test/data_structures_advanced_test.dart: DataStructuresAdvanced Tests Graph Neighbour-result isolation
00:00 +23: All tests passed!
+23: All tests passed!
```

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node(value)` | `int → Node` | `O(1)` | Clase abstracta base que aloja únicamente el valor / Abstract base class holding value only |
| `TreeNode(value)`, `.left`, `.right` | `int → TreeNode` | `O(1)` | Nodo con enlaces mutables anulables `left`/`right` inicializados a `null` / Tree node with mutable nullable links |
| `BinaryTree.insert` | `int → bool` | `O(h)` | Inserción iterativa en ABB; duplicados no alteran el tamaño y devuelven `true` / Iterative BST insertion; idempotent duplicates |
| `BinaryTree.contains` | `int → bool` | `O(h)` | Búsqueda binaria iterativa según la invariante del ABB / Iterative binary search following BST invariant |
| `BinaryTree.isEmpty`, `size` | `→ bool / int` | `O(1)` | Consulta directa de variable contadora `_count` / Direct check on internal counter |
| `Graph.addVertex` | `int → bool` | `O(V)` | Búsqueda lineal en lista de vértices; prepend e incremento si es nuevo / Linear search on linked vertices; prepend and increment if new |
| `Graph.addEdge` | `int, int → bool` | `O(V + d(u))` | Búsqueda de extremos `u` y `v`; inserción ordenada manual en adyacencia si no existe / Checks endpoints; sorted insertion into adjacency |
| `Graph.hasEdge` | `int, int → bool` | `O(V + d(u))` | Localiza `u` en `O(V)` y busca `v` en lista ordenada de vecinos en `O(d(u))` / Locates `u` and searches `v` in sorted neighbours |
| `Graph.getNeighbors` | `int → List<int>?` | `O(V + d(u))` | Copia defensiva de la adyacencia de `u`; devuelve `null` si `u` no existe / Defensive copy of neighbours; returns `null` if absent |
| `Graph.isEmpty`, `vertexCount`, `edgeCount` | `→ bool / int / int` | `O(1)` | Consulta de contadores `_vertexTotal` y `_edges` / Direct inspection of vertex and edge counters |

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Herencia de `Node` (`abstract class Node`) | Valor embebido (composición sin herencia) | Dart soporta herencia de clases de manera directa y canónica; `TreeNode` y `_GraphNode` heredan `value` sin redundancia / Dart supports class inheritance cleanly; child nodes inherit `value` without duplication |
| `_GraphNode` privado dentro de la biblioteca | `GraphNode` público | La especificación indica que `GraphNode` es interno a `Graph`; encapsula la lista encadenada de vértices `nextVertex` / Spec marks `GraphNode` internal to `Graph`; encapsulates vertex chain |
| `List<int>` para adyacencia ordenada | Estructura enlazada propia para vecinos | La especificación permite explícitamente lista estándar para el almacenamiento de vecinos, siempre que la búsqueda e inserción ordenada se hagan manualmente / Spec allows standard list for neighbour storage when operations are written manually |
| Campos `left` y `right` públicos en `TreeNode` | Getters y setters explícitos (`getLeft()`, etc.) | En Dart las propiedades/campos son la abstracción idiomática de acceso; evita boilerplates innecesarios manteniendo mutabilidad / Public fields act as idiomatic properties in Dart |

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `TreeNode.init(value)` / `BinaryTree.init()` | Constructores generativos (`TreeNode(value)`, `BinaryTree()`, `Graph()`) | Dart utiliza constructores generativos para inicializar instancias de manera idiomática y segura / Dart uses generative constructors for safe initialization |
| Enlaces ausentes `absent` | Nulabilidad nativa `TreeNode?` (`null`) | El sistema de tipos con sound null safety de Dart modela de forma natural y segura la ausencia de enlaces / Sound null safety models absent links natively |
| `get_left()`, `get_right()`, `set_left(node)`, `set_right(node)` | Propiedades mutables anulables (`node.left`, `node.right`) | Dart expone campos directamente como accesores idiomáticos / Dart exposes fields as idiomatic accessors |
| `snake_case` (`add_vertex`, `has_edge`, `get_neighbors`) | `lowerCamelCase` (`addVertex`, `hasEdge`, `getNeighbors`) | Guía de estilo oficial de Dart (Effective Dart) / Effective Dart naming convention |
| Retorno ausente en `get_neighbors(u)` | Retorno anulable `List<int>?` (`null`) | Permite distinguir de forma no ambigua un vértice inexistente (`null`) de un vértice aislado sin vecinos (`<int>[]`) / Disambiguates missing vertex (`null`) from isolated vertex with empty neighbours (`<int>[]`) |
| `src/` | `lib/src/` | Convención obligatoria de layout de paquetes en Dart / Standard Dart package layout convention |

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `BinaryTree.contains` | Valor ausente en el árbol / Value not in tree | `false` | `BinaryTree().contains(50)` → `false` |
| `BinaryTree.insert` | Capacidad agotada / Out of capacity | No aplica / Not applicable | Árbol dinámico sin límite contractual / Unbounded dynamic tree |
| `Graph.addEdge` | Uno o ambos extremos no registrados / Endpoint not registered | `false` | `Graph().addEdge(10, 99)` → `false` |
| `Graph.hasEdge` | Arista ausente o vértice inexistente / Missing edge or vertex | `false` | `Graph().hasEdge(10, 30)` → `false` |
| `Graph.getNeighbors` | Vértice inexistente / Vertex does not exist | `null` | `Graph().getNeighbors(99)` → `null` |
| Entrada nula / Null input | Argumentos son `int` no anulables | No representable / Not representable | Tipado estático con sound null safety rechaza `null` en compilación / Sound null safety rejects `null` at compile time |

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| TreeNode: Crear un nodo de árbol / Create a tree node | Sí | `TreeNode Create a tree node` | Verifica asignación de `value` / Checks `value` |
| TreeNode: Enlaces iniciales ausentes / Absent initial links | Sí | `TreeNode Absent initial links` | `left` y `right` son `null` / `left` and `right` are `null` |
| TreeNode: Enlazar dos hijos / Link two children | Sí | `TreeNode Link two children` | Asigna y verifica hijos 20 y 30 / Assigns and checks children 20 and 30 |
| TreeNode: Recorrer cada enlace / Traverse each link | Sí | `TreeNode Traverse each link` | Recorre enlaces y comprueba ausencia en hojas / Traverses links and verifies leaf nulls |
| TreeNode: Desenlazar hijos / Unlink children | Sí | `TreeNode Unlink children` | Desasigna `left` y `right` progresivamente / Progressively clears links |
| TreeNode: Adaptación inmutable / Immutable adaptation | Omitido | — | Dart usa nodos mutables directos; la especificación marca este caso como si aplica / Mutable nodes used; spec marks if applicable |
| BinaryTree: Crear vacío / Create empty | Sí | `BinaryTree Create empty` | `isEmpty()` es `true`, `size()` es 0, `contains` falla / Empty state |
| BinaryTree: Insertar la raíz / Insert the root | Sí | `BinaryTree Insert the root` | Inserción de 50; verifica tamaño 1 y pertenencia / Inserts root 50 |
| BinaryTree: Insertar menor y mayor / Insert lower and higher | Sí | `BinaryTree Insert lower and higher` | Inserta 50, 30, 70; tamaño 3 y pertenencia / Lower and higher branches |
| BinaryTree: Ramas de varios niveles / Multilevel branches | Sí | `BinaryTree Multilevel branches` | Inserta 50, 30, 70, 20, 40; tamaño 5 / Multilevel tree validation |
| BinaryTree: Valor ausente en árbol no vacío / Missing value in nonempty tree | Sí | `BinaryTree Missing value in nonempty tree` | `contains(99)` retorna `false` / Missing value lookup |
| BinaryTree: Duplicado idempotente / Idempotent duplicate | Sí | `BinaryTree Idempotent duplicate` | Inserción repetida de 30 conserva tamaño 3 / Duplicate insertion preserves size |
| BinaryTree: Inserciones ordenadas / Ordered insertions | Sí | `BinaryTree Ordered insertions` | Inserción en orden 20..70; comprueba tamaño y búsquedas / Degenerate chain order |
| Graph: Crear vacío / Create empty | Sí | `Graph Create empty` | `isEmpty()` es `true`, contadores en 0, consultas fallan / Empty graph state |
| Graph: Vértice aislado / Isolated vertex | Sí | `Graph Isolated vertex` | Registro de 10; 1 vértice, 0 aristas, vecinos vacíos `[]` / Isolated vertex |
| Graph: Etiquetas no consecutivas y arista dirigida / Nonconsecutive labels and directed edge | Sí | `Graph Nonconsecutive labels and directed edge` | Registra 10 y 70, arista dirigida `(10, 70)`; comprueba dirección / Directed edge verification |
| Graph: Vértice duplicado conserva adyacencia / Duplicate vertex preserves adjacency | Sí | `Graph Duplicate vertex preserves adjacency` | Registro duplicado es idempotente / Duplicate vertex registration |
| Graph: Arista duplicada / Duplicate edge | Sí | `Graph Duplicate edge` | Inserción duplicada de arista preserva contadores / Duplicate edge insertion |
| Graph: Extremo inexistente sin mutación / Missing endpoint without mutation | Sí | `Graph Missing endpoint without mutation` | Intentos con vértices ausentes retornan `false` sin mutar / Missing endpoints fail without mutating |
| Graph: Vecinos ordenados y contadores / Sorted neighbours and counts | Sí | `Graph Sorted neighbours and counts` | Inserciones en desorden resultan en adyacencia ordenada / Sorted neighbours verification |
| Graph: Consulta de arista ausente / Missing-edge query | Sí | `Graph Missing-edge query` | `hasEdge(10, 30)` devuelve `false` con vértices registrados / Missing edge query |
| Graph: Vecinos de vértice inexistente / Neighbours of missing vertex | Sí | `Graph Neighbours of missing vertex` | `getNeighbors(99)` devuelve `null` / Missing vertex query |
| Graph: Bucle y duplicado / Self-loop and duplicate | Sí | `Graph Self-loop and duplicate` | `addEdge(10, 10)` duplicado; verifica auto-bucle / Self-loop and duplicate |
| Graph: Aislamiento del resultado de vecinos / Neighbour-result isolation | Sí | `Graph Neighbour-result isolation` | Modificar lista retornada no altera la estructura interna / Defensive copy isolation |

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Tipado rígido en `int` (sin genéricos) / `int` only, no generics | Estructuras especializadas únicamente en enteros / Specialized for integer keys only | Sigue estrictamente la especificación del módulo pedagógico / Strictly follows educational module specification |
| `BinaryTree` sin auto-balanceo / Unbalanced BST | Altura en el peor de los casos es `O(n)` / Worst-case degenerate tree height `O(n)` | Cumple con la especificación; algoritmos balanceados (AVL/Red-Black) corresponden a fases avanzadas / Follows specification; balanced trees belong to advanced phases |

## 📝 Notas de implementación / Implementation Notes

- **ES:** Se utilizó herencia real (`TreeNode extends Node`, `_GraphNode extends Node`), cumpliendo con la base común `Node(value)` que encapsula únicamente el valor sin validaciones ni enlaces.
- **ES:** El registro de vértices de `Graph` es una lista enlazada canónica manual (`_GraphNode? _vertices` con punteros `nextVertex`). La búsqueda de vértices es `O(V)` mediante recorrido manual sin delegación en `Map` o `Set`.
- **ES:** La adyacencia de cada vértice mantiene sus vecinos ordenados en `List<int>` mediante búsqueda e inserción manual en `O(d(u))`. `getNeighbors` devuelve una copia defensiva (`List<int>.of(...)`) para garantizar el aislamiento.
- **ES:** Distinción de fallo en `Graph`: `getNeighbors` retorna `null` ante vértices inexistentes, mientras que para vértices válidos sin aristas salientes retorna una lista vacía `[]`.
- **EN:** Class inheritance is used (`TreeNode extends Node`, `_GraphNode extends Node`), adhering to the `Node(value)` contract containing only value without validations or links.
- **EN:** The vertex registry is a manual linked chain traversed in `O(V)` without delegating to `Map` or `Set`. Adjacency uses manual ordered insertion in `O(d(u))`. `getNeighbors` returns a defensive copy and signals missing vertices with `null`.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced) |
| Primera base del lenguaje / First language reference | `data_structures_basics` — [`dart/core/algorithms/data_structures_basics/`](../data_structures_basics/) |
| Segunda base del lenguaje / Second language reference | `numbers` — [`dart/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](https://yorche3.github.io/programming_languages/core/00_Project_Initialization_Guide) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](https://yorche3.github.io/programming_languages/AGENT_Template) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](https://yorche3.github.io/programming_languages/WORKFLOW) |
| Documentación oficial del lenguaje / Language official docs | [Dart language tour](https://dart.dev/language) |

---

*[← Volver a Algoritmos Puros](../README.md) | [↑ Volver a Core](../../README.md)*
