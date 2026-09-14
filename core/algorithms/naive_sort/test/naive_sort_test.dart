import 'package:naive_sort/naive_sort.dart';
import 'package:test/test.dart';

// Fixtures: one constant per input/output case. The helper copies each input
// with `List<int>.of` before sorting, so an in-place sort can never leak
// between cases and the shared constants stay immutable.
const List<int> standardInput = [5, 2, 9, 1, 5, 6];
const List<int> standardOutput = [1, 2, 5, 5, 6, 9];

const List<int> sortedInput = [1, 2, 3, 4, 5];
const List<int> sortedOutput = [1, 2, 3, 4, 5];

const List<int> reverseInput = [5, 4, 3, 2, 1];
const List<int> reverseOutput = [1, 2, 3, 4, 5];

const List<int> identicalInput = [7, 7, 7, 7];
const List<int> identicalOutput = [7, 7, 7, 7];

const List<int> negativeInput = [3, -1, 4, -5, 0];
const List<int> negativeOutput = [-5, -1, 0, 3, 4];

const List<int> singleInput = [42];
const List<int> singleOutput = [42];

const List<int> emptyInput = [];
const List<int> emptyOutput = [];

typedef SortFunction = List<int>? Function(List<int>?);

// Runs the 8 shared cases against any sort function.
void assertSortsAllCases(SortFunction sort, String algorithmName) {
  expect(sort(List<int>.of(standardInput)), equals(standardOutput),
      reason: '$algorithmName should sort an unsorted array');
  expect(sort(List<int>.of(sortedInput)), equals(sortedOutput),
      reason: '$algorithmName should keep an already sorted array sorted');
  expect(sort(List<int>.of(reverseInput)), equals(reverseOutput),
      reason: '$algorithmName should sort a reverse ordered array');
  expect(sort(List<int>.of(identicalInput)), equals(identicalOutput),
      reason: '$algorithmName should sort identical elements');
  expect(sort(List<int>.of(negativeInput)), equals(negativeOutput),
      reason: '$algorithmName should sort an array with negative numbers');
  expect(sort(List<int>.of(singleInput)), equals(singleOutput),
      reason: '$algorithmName should sort a single element array');
  expect(sort(List<int>.of(emptyInput)), equals(emptyOutput),
      reason: '$algorithmName should sort an empty array');
  expect(sort(null), isNull,
      reason:
          '$algorithmName should return the failure indicator for a null array');
}

void suiteNaiveSortTests() {
  group('NaiveSort Tests', () {
    test('Selection sort', () {
      assertSortsAllCases(NaiveSort.selectionSort, 'selectionSort');
    });

    test('Bubble sort', () {
      assertSortsAllCases(NaiveSort.bubbleSort, 'bubbleSort');
    });

    test('Insertion sort', () {
      assertSortsAllCases(NaiveSort.insertionSort, 'insertionSort');
    });
  });
}

void main() => suiteNaiveSortTests();
