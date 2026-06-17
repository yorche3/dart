# 🚀 Foundations — Dart

Implementaciones de la [Fase 0 — Fundamentos](https://yorche3.github.io/programming_languages/ROADMAP/#fase-0--fundamentos--foundations--completada) en **Dart**: `helloworld`, `hellouser`, `unit_test/calculator` y `numbers`.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`helloworld/`](helloworld/) | [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | `dart run` (archivo único) | — | ✅ |
| [`hellouser/`](hellouser/) | [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | `dart run` (archivo único) | — | ✅ |
| [`unit_test/calculator/`](unit_test/calculator/) | [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | `dart test` + `pubspec.yaml` + `package:test` | 5 | ✅ |
| [`numbers/`](numbers/) | [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | `dart test` + `pubspec.yaml` + `package:test` | 10 | ✅ |

---

## 📁 Estructura / Structure

```text
foundations/
├── helloworld/                   # 01_Hello_World
│   ├── hello_world.dart          # void main() { print('...'); }
│   └── README.md
│
├── hellouser/                    # 02_Hello_User
│   ├── hello_user.dart           # stdout.write() + stdin.readLineSync()
│   └── README.md
│
├── unit_test/
│   └── calculator/               # 03_Unit_Test_Calculator
│       ├── pubspec.yaml
│       ├── lib/
│       │   └── src/
│       │       └── calculator_base.dart  # 5 operaciones (+, -, *, /, mod)
│       ├── test/
│       │   └── calculator_test.dart      # 5 tests
│       └── README.md
│
└── numbers/                      # 04_Numbers
    ├── pubspec.yaml
    ├── lib/
    │   └── src/
    │       └── numbers_base.dart         # 15 funciones (3 enfoques × 5 algoritmos)
    ├── test/
    │   ├── run_tests.dart                # Orquestador
    │   ├── numbers_rec_test.dart         # 5 tests recursivos
    │   └── numbers_ite_test.dart         # 5 tests iterativos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Dart SDK — VM (desarrollo) y AOT (producción) |
| **CLI** | `dart` — comando unificado para ejecutar, testear y gestionar proyectos |
| **Archivos únicos** | `dart run <archivo>.dart` para programas simples (`helloworld`, `hellouser`) |
| **Proyectos con tests** | `dart test` — ejecuta todos los tests en `test/` |
| **Manifiesto** | `pubspec.yaml` — define nombre, SDK y dependencias |
| **Framework de tests** | `package:test` — estándar en el ecosistema Dart |
| **Dependencias** | `dart pub get` descarga las dependencias antes de ejecutar `dart test` |
| **Tipado** | Parámetros `int` con tipos estáticos explícitos |
| **Acumuladores** | Sin tests directos (Dart no garantiza TCO) |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Hello, World!
cd helloworld
dart run hello_world.dart

# Hello, User!
cd hellouser
dart run hello_user.dart

# Calculator Tests
cd unit_test/calculator
dart pub get && dart test

# Numbers Tests
cd numbers
dart pub get && dart test
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Después de fundamentos, continúa con [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).  
👉 After foundations, continue with [Phase 1 — Algorithms Pure](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).

---

*[← Volver a Dart](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
