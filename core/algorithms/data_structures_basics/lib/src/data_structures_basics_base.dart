const int failureValue = -1;

final class Node {
  final int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  int _count = 0;

  bool isEmpty() {
    return _count == 0;
  }

  int size() {
    return _count;
  }

  int getHead() {
    return failureValue;
  }

  void insertHead(int value) {}

  void insertTail(int value) {}

  bool delete(int value) {
    return false;
  }
}

class Stack {
  Node? top;
  int _count = 0;

  bool isEmpty() {
    return _count == 0;
  }

  int size() {
    return _count;
  }

  void push(int value) {}

  int peek() {
    return failureValue;
  }

  int pop() {
    return failureValue;
  }
}

class Queue {
  Node? front;
  Node? rear;
  int _count = 0;

  bool isEmpty() {
    return _count == 0;
  }

  int size() {
    return _count;
  }

  void enqueue(int value) {}

  int peek() {
    return failureValue;
  }

  int dequeue() {
    return failureValue;
  }
}
