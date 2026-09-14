# 🚀 Algorithms Pure — Dart

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Dart**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase usan **indicadores de fallo compatibles con el lenguaje** (`null` para tipos anulables, valor retornado) en lugar de excepciones.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `dart test` + `pubspec.yaml` + `package:test` | 3 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
└── naive_sort/                   # 05_Naive_Sort
    ├── pubspec.yaml
    ├── lib/
    │   ├── naive_sort.dart       # Export público
    │   └── src/
    │       └── naive_sort_base.dart  # Clase NaiveSort (3 métodos static)
    ├── test/
    │   ├── run_tests.dart
    │   └── naive_sort_test.dart  # 3 tests (8 casos cada uno)
    ├── example/
    │   └── naive_sort_example.dart
    ├── .gitignore
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Dart SDK — VM (desarrollo) y AOT (producción) |
| **CLI** | `dart` — comando unificado para ejecutar, testear y gestionar proyectos |
| **Proyectos con tests** | `dart test` — ejecuta todos los tests en `test/` |
| **Manifiesto** | `pubspec.yaml` — define nombre, SDK y dependencias |
| **Framework de tests** | `package:test` — estándar en el ecosistema Dart |
| **Análisis estático** | `dart analyze` con `package:lints/recommended.yaml` |
| **Dependencias** | `dart pub get` descarga las dependencias antes de ejecutar `dart test` |
| **Indicador de fallo** | `null` (`List<int>?` admite entradas y salidas nulas) |
| **Ordenamiento** | *In-place* sobre la lista recibida |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
dart pub get && dart test
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).
👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
