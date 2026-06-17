import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

void suiteIterativeTests() {
  group('Iterative Tests', () {
    test('Sum of first n numbers', () {
      expect(Numbers.sumFirstNIter(0), 0);
      expect(Numbers.sumFirstNIter(3), 6);
    });

    test('Factorial', () {
      expect(Numbers.factorialIter(0), 1);
      expect(Numbers.factorialIter(4), 24);
    });

    test('Fibonacci', () {
      expect(Numbers.fibonacciIter(0), 0);
      expect(Numbers.fibonacciIter(1), 1);
      expect(Numbers.fibonacciIter(6), 8);
    });

    test('Largest Common Divisor', () {
      expect(Numbers.largestCommonDivisorIter(12, 8), 4);
      expect(Numbers.largestCommonDivisorIter(7, 5), 1);
    });

    test('Least Common Multiple', () {
      expect(Numbers.leastCommonMultipleIter(8, 6), 24);
      expect(Numbers.leastCommonMultipleIter(6, 4), 12);
    });
  });
}

void main() => suiteIterativeTests();