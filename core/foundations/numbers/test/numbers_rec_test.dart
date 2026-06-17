import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

void suiteRecursiveTests() {
  group('Recursive Tests', () {
    test('Sum of first n numbers', () {
      expect(Numbers.sumFirstNRec(0), 0);
      expect(Numbers.sumFirstNRec(3), 6);
    });

    test('Factorial', () {
      expect(Numbers.factorialRec(0), 1);
      expect(Numbers.factorialRec(4), 24);
    });

    test('Fibonacci', () {
      expect(Numbers.fibonacciRec(0), 0);
      expect(Numbers.fibonacciRec(1), 1);
      expect(Numbers.fibonacciRec(6), 8);
    });

    test('Largest Common Divisor', () {
      expect(Numbers.largestCommonDivisorRec(12, 8), 4);
      expect(Numbers.largestCommonDivisorRec(7, 5), 1);
    });

    test('Least Common Multiple', () {
      expect(Numbers.leastCommonMultipleRec(8, 6), 24);
      expect(Numbers.leastCommonMultipleRec(6, 4), 12);
    });
  });
}

void main() => suiteRecursiveTests();
