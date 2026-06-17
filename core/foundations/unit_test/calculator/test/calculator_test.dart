import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator Tests', () {
    test('Addition', () {
      expect(Calculator.addition(2, 3), equals(5));
    });

    test('Subtraction', () {
      expect(Calculator.subtraction(5, 3), equals(2));
    });

    test('Multiplication', () {
      expect(Calculator.multiplication(4, 3), equals(12));
    });

    test('Division', () {
      expect(Calculator.division(10, 3), equals(3));
    });

    test('Modulus', () {
      expect(Calculator.modulus(10, 3), equals(1));
    });
  });
}
