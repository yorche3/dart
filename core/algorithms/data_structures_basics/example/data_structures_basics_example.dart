import 'package:data_structures_basics/data_structures_basics.dart';

void main() {
  final LinkedList list = LinkedList();
  list.insertTail(10);
  list.insertTail(20);
  list.insertHead(5);
  print('LinkedList: size=${list.size()}, head=${list.getHead()}');

  final Stack stack = Stack();
  stack.push(10);
  stack.push(20);
  print('Stack: size=${stack.size()}, peek=${stack.peek()}');

  final Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  print('Queue: size=${queue.size()}, peek=${queue.peek()}');
}
