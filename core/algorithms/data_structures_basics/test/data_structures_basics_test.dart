import 'package:data_structures_basics/data_structures_basics.dart';
import 'package:test/test.dart';

// Fixtures: one named constant per input value and per expected sequence, so
// each case reads as data instead of a literal buried in an assertion. The
// values are positive integers so they never collide with the failure
// indicator (`failureValue`, -1).
const int firstValue = 10;
const int secondValue = 20;
const int thirdValue = 30;
const int headValue = 5;
const int absentValue = 99;
const int reusedValue = 40;

const List<int> listAfterBothEnds = [5, 10, 20, 10];
const List<int> listAfterDelete = [5, 20, 10];

// Shared traversal over the contract's node links: Dart exposes `get_value` and
// `get_next` as the public `value` and `next` fields of the shared `Node`.
List<int> traverse(Node? head) {
  final List<int> values = <int>[];
  Node? current = head;
  while (current != null) {
    values.add(current.value);
    current = current.next;
  }
  return values;
}

// The spec's cases are successive steps on the same logical state, so each
// structure walks its whole table inside one test: declare, initialize once
// (the default constructor in Dart is the idiomatic `init`) and continue
// without resetting the scenario.
void suiteDataStructuresBasicsTests() {
  group('DataStructuresBasics Tests', () {
    test('Node', () {
      // Case: initialize and observe value/link.
      final Node a = Node(firstValue);
      expect(a.value, firstValue, reason: 'Node init should assign the value');
      expect(
        a.next,
        isNull,
        reason: 'Node init should leave the next link absent',
      );

      // Case: initialize another node, link and traverse.
      final Node b = Node(secondValue);
      a.next = b;
      expect(
        a.next?.value,
        secondValue,
        reason: 'Node set_next should link the next node',
      );
      expect(
        b.next,
        isNull,
        reason: 'a linked node should keep its next link absent',
      );
    });

    test('LinkedList', () {
      // Case: empty state.
      final LinkedList list = LinkedList();
      expect(
        list.isEmpty(),
        isTrue,
        reason: 'LinkedList should be empty after init',
      );
      expect(list.size(), 0, reason: 'LinkedList should start with size 0');
      expect(
        list.getHead(),
        failureValue,
        reason:
            'LinkedList get_head should return the failure indicator on an empty list',
      );

      // Case: insert at both ends.
      list.insertTail(firstValue);
      list.insertTail(secondValue);
      list.insertHead(headValue);
      list.insertTail(firstValue);
      expect(
        list.size(),
        4,
        reason: 'LinkedList should count one element per insertion',
      );
      expect(
        traverse(list.head),
        listAfterBothEnds,
        reason: 'LinkedList should traverse 5, 10, 20, 10 from the head',
      );

      // Case: delete first occurrence.
      expect(
        list.delete(firstValue),
        isTrue,
        reason: 'LinkedList delete should succeed on the first occurrence',
      );
      expect(
        traverse(list.head),
        listAfterDelete,
        reason: 'LinkedList delete should remove only the first occurrence',
      );
      expect(
        list.size(),
        3,
        reason: 'LinkedList delete should decrement the size on success',
      );

      // Case: absent value.
      expect(
        list.delete(absentValue),
        isFalse,
        reason: 'LinkedList delete should fail on an absent value',
      );
      expect(
        traverse(list.head),
        listAfterDelete,
        reason: 'a failed LinkedList delete should keep the elements',
      );
      expect(
        list.size(),
        3,
        reason: 'a failed LinkedList delete should keep the size',
      );

      // Case: empty the list.
      expect(
        list.delete(headValue),
        isTrue,
        reason: 'LinkedList delete should remove the remaining head',
      );
      expect(
        list.delete(secondValue),
        isTrue,
        reason: 'LinkedList delete should remove the remaining second value',
      );
      expect(
        list.delete(firstValue),
        isTrue,
        reason: 'LinkedList delete should remove the remaining last value',
      );
      expect(
        list.isEmpty(),
        isTrue,
        reason: 'LinkedList should be empty after deleting every element',
      );
      expect(
        list.size(),
        0,
        reason: 'LinkedList should report size 0 after deleting every element',
      );
      expect(
        list.getHead(),
        failureValue,
        reason:
            'LinkedList get_head should return the failure indicator once empty',
      );
    });

    test('Stack', () {
      // Case: empty state and failed removal.
      final Stack stack = Stack();
      expect(
        stack.isEmpty(),
        isTrue,
        reason: 'Stack should be empty after init',
      );
      expect(stack.size(), 0, reason: 'Stack should start with size 0');
      expect(
        stack.peek(),
        failureValue,
        reason:
            'Stack peek should return the failure indicator on an empty stack',
      );
      expect(
        stack.pop(),
        failureValue,
        reason:
            'Stack pop should return the failure indicator on an empty stack',
      );

      // Case: LIFO and non-mutating peek.
      stack.push(firstValue);
      stack.push(secondValue);
      stack.push(thirdValue);
      expect(
        stack.peek(),
        thirdValue,
        reason:
            'Stack peek should observe the most recent value without removing it',
      );
      expect(stack.size(), 3, reason: 'Stack peek should not change the size');

      // Case: removal and reuse.
      expect(
        stack.pop(),
        thirdValue,
        reason: 'Stack pop should remove the most recent value first',
      );
      stack.push(reusedValue);
      expect(
        stack.pop(),
        reusedValue,
        reason: 'Stack pop should remove the reused value next',
      );
      expect(
        stack.pop(),
        secondValue,
        reason: 'Stack pop should continue in LIFO order',
      );
      expect(
        stack.pop(),
        firstValue,
        reason: 'Stack pop should remove the oldest value last',
      );
      expect(
        stack.isEmpty(),
        isTrue,
        reason: 'Stack should be empty after popping every value',
      );
      expect(
        stack.size(),
        0,
        reason: 'Stack should report size 0 after popping every value',
      );

      // Case: empty after removal.
      expect(
        stack.pop(),
        failureValue,
        reason: 'Stack pop should keep failing once empty',
      );
      expect(
        stack.isEmpty(),
        isTrue,
        reason: 'Stack should stay empty after a failed pop',
      );
    });

    test('Queue', () {
      // Case: empty state and failed removal.
      final Queue queue = Queue();
      expect(
        queue.isEmpty(),
        isTrue,
        reason: 'Queue should be empty after init',
      );
      expect(queue.size(), 0, reason: 'Queue should start with size 0');
      expect(
        queue.peek(),
        failureValue,
        reason:
            'Queue peek should return the failure indicator on an empty queue',
      );
      expect(
        queue.dequeue(),
        failureValue,
        reason:
            'Queue dequeue should return the failure indicator on an empty queue',
      );

      // Case: FIFO and non-mutating peek.
      queue.enqueue(firstValue);
      queue.enqueue(secondValue);
      queue.enqueue(thirdValue);
      expect(
        queue.peek(),
        firstValue,
        reason:
            'Queue peek should observe the oldest value without removing it',
      );
      expect(queue.size(), 3, reason: 'Queue peek should not change the size');

      // Case: removal and reuse.
      expect(
        queue.dequeue(),
        firstValue,
        reason: 'Queue dequeue should remove the oldest value first',
      );
      queue.enqueue(reusedValue);
      expect(
        queue.dequeue(),
        secondValue,
        reason: 'Queue dequeue should continue in FIFO order',
      );
      expect(
        queue.dequeue(),
        thirdValue,
        reason: 'Queue dequeue should return the third value next',
      );
      expect(
        queue.dequeue(),
        reusedValue,
        reason: 'Queue dequeue should return the reused value last',
      );
      expect(
        queue.isEmpty(),
        isTrue,
        reason: 'Queue should be empty after dequeuing every value',
      );
      expect(
        queue.size(),
        0,
        reason: 'Queue should report size 0 after dequeuing every value',
      );

      // Case: empty after removal.
      expect(
        queue.dequeue(),
        failureValue,
        reason: 'Queue dequeue should keep failing once empty',
      );
      expect(
        queue.isEmpty(),
        isTrue,
        reason: 'Queue should stay empty after a failed dequeue',
      );
    });
  });
}

void main() => suiteDataStructuresBasicsTests();
