// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
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

