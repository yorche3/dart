// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Numbers {
  static int sumFirstNRec(int n) {
    if (n <= 0) {
      return 0;
    }
    return n + sumFirstNRec(n - 1);
  }

  static int factorialRec(int n) {
    if (n <= 1) {
      return 1;
    }
    return n * factorialRec(n - 1);
  }

  static int fibonacciRec(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonacciRec(n - 1) + fibonacciRec(n - 2);
  }

  static int largestCommonDivisorRec(int a, int b) {
    if (b == 0) {
      return a;
    }
    return largestCommonDivisorRec(b, a % b);
  }

  static int leastCommonMultipleRec(int a, int b) {
    return (a * b) ~/ largestCommonDivisorRec(a, b);
  }

  int _sumFirstNHelp(int n, int sum) {
    if (n <= 0) {
      return sum;
    }
    return _sumFirstNHelp(n - 1, sum + n);
  }

  int sumFirstNAcc(int n) {
    return _sumFirstNHelp(n, 0);
  }

  int _factorialHelp(int n) {
    if (n <= 1) {
      return 1;
    }
    return n * _factorialHelp(n - 1);
  }

  int factorialAcc(int n) {
    return _factorialHelp(n);
  }

  int _fibonacciHelp(int n) {
    if (n <= 1) {
      return n;
    }
    return _fibonacciHelp(n - 1) + _fibonacciHelp(n - 2);
  }

  int fibonacciAcc(int n) {
    return _fibonacciHelp(n);
  }

  static int sumFirstNIter(int n) {
    int acc = 0;
    for (int i = 1; i <= n; i++) {
      acc += i;
    }
    return acc;
  }

  static int factorialIter(int n) {
    int acc = 1;
    for (int i = 1; i <= n; i++) {
      acc *= i;
    }
    return acc;
  }

  static int fibonacciIter(int n) {
    if (n <= 1) {
      return n;
    }
    int acc1 = 0;
    int acc2 = 1;
    for (int i = 2; i < n; i++) {
      int temp = acc1 + acc2;
      acc1 = acc2;
      acc2 = temp;
    }
    return acc2 + acc1;
  }

  static int largestCommonDivisorIter(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  static int leastCommonMultipleIter(int a, int b) {
    return (a * b) ~/ largestCommonDivisorIter(a, b);
  }
}