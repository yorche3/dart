# Hello, User! — Dart

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Dart**, ejecutado con **dart run**.

Lee un nombre desde la entrada estándar y saluda al usuario.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_user.dart`](hello_user.dart) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hello_user.dart     # Código fuente
└── README.md           # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este programa introduce tres conceptos nuevos respecto a `hello_world`:

1. **Lectura de entrada** — `stdin.readLineSync()` lee una línea completa desde `stdin`.
2. **Interpolación de cadenas** — `$name` inserta el valor de la variable dentro de la cadena.
3. **Salida sin salto de línea** — `stdout.write()` para el prompt, para que el cursor se quede en la misma línea.

**EN:** This program introduces three new concepts compared to `hello_world`:

1. **Input reading** — `stdin.readLineSync()` reads a full line from `stdin`.
2. **String interpolation** — `$name` inserts the variable value inside the string.
3. **Output without newline** — `stdout.write()` for the prompt, so the cursor stays on the same line.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_user.dart`

**ES:** El flujo del programa es:

1. Importar `dart:io` para entrada/salida estándar.
2. Imprimir `"Enter your name: "` con `stdout.write` (sin salto de línea).
3. Leer el nombre con `stdin.readLineSync()`.
4. Imprimir `"Hello, <nombre>!"` con `print` usando interpolación `$name`.

**EN:** Program flow:

1. Import `dart:io` for standard input/output.
2. Print `"Enter your name: "` with `stdout.write` (no newline).
3. Read the name with `stdin.readLineSync()`.
4. Print `"Hello, <name>!"` with `print` using `$name` interpolation.

```dart
import 'dart:io';

void main() {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  print('Hello, $name!');
}
```

| Elemento | Propósito |
|----------|-----------|
| `import 'dart:io';` | Importa el módulo de E/S de Dart |
| `stdout.write(...)` | Imprime sin salto de línea (ideal para prompts) |
| `stdin.readLineSync()` | Lee una línea completa desde la entrada estándar (bloqueante) |
| `String? name` | Variable de tipo `String` nullable (puede ser `null` si EOF) |
| `'Hello, $name!'` | Interpolación de cadenas: `$name` se reemplaza por el valor |

> **ES:** `stdin.readLineSync()` retorna `String?` (nullable) porque puede devolver `null` si se cierra la entrada estándar (EOF). La interpolación con `$name` imprime `null` si eso ocurre.
> **EN:** `stdin.readLineSync()` returns `String?` (nullable) because it may return `null` if standard input is closed (EOF). The `$name` interpolation prints `null` if that happens.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Dart SDK instalado

```bash
brew install dart     # macOS / Linux
```

### Ejecutar

```bash
cd core/foundations/hellouser
dart run hello_user.dart
```

**Salida esperada / Expected output:**

```text
Enter your name: Ada
Hello, Ada!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `stdout.write` no añade salto de línea, a diferencia de `print`. Es ideal para prompts donde se quiere que el usuario escriba en la misma línea.
- **EN:** `stdout.write` doesn't add a newline, unlike `print`. It's ideal for prompts where you want the user to type on the same line.
- **ES:** La interpolación `$variable` es una característica de Dart que permite insertar expresiones dentro de cadenas con comillas simples o dobles.
- **EN:** Dart's `$variable` interpolation allows inserting expressions inside single or double quoted strings.
- **ES:** Dart requiere importar `dart:io` explícitamente para acceder a `stdin` y `stdout`.
- **EN:** Dart requires explicitly importing `dart:io` to access `stdin` and `stdout`.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
