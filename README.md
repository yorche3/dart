# Dart

Proyectos en **Dart**, ejecutados con el SDK de Dart (`dart run`, `dart test`).

Usa `pubspec.yaml` como manifiesto de proyecto y **package:test** como framework de pruebas unitarias.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
|--------|-------------|
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `calculator`, `numbers` |

---

### ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
dart run hello_world.dart

# Hello, User!
cd core/foundations/hellouser
dart run hello_user.dart

# Calculator Tests
cd core/foundations/unit_test/calculator
dart pub get && dart test

# Numbers Tests
cd core/foundations/numbers
dart pub get && dart test
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
|-------------|-------------|
| [Dart SDK](https://dart.dev/get-dart) | `brew install dart` (macOS) / [descargar](https://dart.dev/get-dart) (Linux, Windows) |

```bash
# Verificar instalación
dart --version
```

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Script simple (archivo único)

**ES:** Un único archivo fuente `.dart`, sin dependencias externas, ejecutado directamente con `dart run`. Ideal para `helloworld` y `hellouser`.

**EN:** A single `.dart` source file, no external dependencies, executed directly with `dart run`. Ideal for `helloworld` and `hellouser`.

```bash
dart run <archivo>.dart
```

### 2. Proyecto pub + tests (dart test)

**ES:** Para proyectos que requieren pruebas unitarias, se utiliza `pubspec.yaml` como manifiesto y el paquete **test** como framework. Los tests se colocan en `test/` y se ejecutan con `dart test`.

**EN:** For projects requiring unit tests, `pubspec.yaml` is used as the manifest and the **test** package as the testing framework. Tests go in `test/` and are run with `dart test`.

```bash
dart pub get
dart test
```

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*