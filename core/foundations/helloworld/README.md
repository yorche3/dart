# Hello, World! — Dart

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Dart**, ejecutado con **dart run**.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_world.dart`](hello_world.dart) | Código fuente: imprime `"Hello, World! from Dart!"` en la consola. |

**Estructura de directorios esperada:**

```text
helloworld/
├── hello_world.dart     # Código fuente
└── README.md            # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Dart** y sigue un enfoque minimalista: un único archivo fuente, sin dependencias externas, ejecutado directamente con `dart run`.

Características:
- **Sin dependencias externas** — solo usa `print` de Dart core.
- **Ejecución directa** — `dart run` ejecuta scripts Dart directamente.
- **Sin archivo de proyecto** — no necesita `pubspec.yaml`.

**EN:** This project uses **Dart** and follows a minimalist approach: a single source file, no external dependencies, executed directly with `dart run`.

Features:
- **No external dependencies** — only uses `print` from Dart core.
- **Direct execution** — `dart run` runs Dart scripts directly.
- **No project file** — no `pubspec.yaml` needed.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_world.dart`

**ES:** Punto de entrada `main()`. Usa `print` para imprimir el saludo.

**EN:** Entry point `main()`. Uses `print` to output the greeting.

```dart
void main() {
  print('Hello, World! from Dart!');
}
```

| Elemento | Propósito |
|----------|-----------|
| `void main()` | Punto de entrada del programa |
| `print(...)` | Función de Dart que imprime una cadena seguida de un salto de línea |

> **ES:** `print` es la función estándar de salida de Dart. Convierte cualquier valor a string usando `toString()` y lo imprime en la consola, añadiendo un salto de línea al final.
> **EN:** `print` is Dart's standard output function. It converts any value to string using `toString()` and prints it to the console, adding a newline at the end.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Dart SDK instalado

```bash
# Con Homebrew (macOS / Linux)
brew install dart

# Con SDK manager
# Ver: https://dart.dev/get-dart
```

### Ejecutar

```bash
cd core/foundations/helloworld
dart run hello_world.dart
```

**Salida esperada / Expected output:**

```text
Hello, World! from Dart!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `dart run` compila y ejecuta en un solo paso. Dart también permite compilación AOT (`dart compile exe`) para binarios nativos.
- **EN:** `dart run` compiles and runs in one step. Dart also supports AOT compilation (`dart compile exe`) for native binaries.
- **ES:** No se necesita `pubspec.yaml` para scripts simples; solo se requiere cuando hay dependencias externas.
- **EN:** No `pubspec.yaml` file is needed for simple scripts; it's only required when there are external dependencies.
- **ES:** Dart se ejecuta tanto en una VM (desarrollo) como compilado AOT (producción).
- **EN:** Dart runs both on a VM (development) and AOT-compiled (production).

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
