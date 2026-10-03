const int failureValue = -1;

final class Node {
  final int value;
  Node? next;

  Node(this.value);
}

final class LinkedList {
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
    return head?.value ?? failureValue;
  }

  void insertHead(int value) {
    if (isEmpty()) {
      head = Node(value);
      tail = head;
    } else {
      final Node newHead = Node(value);
      newHead.next = head;
      head = newHead;
    }
    _count++;
  }

  void insertTail(int value) {
    if (isEmpty()) {
      head = Node(value);
      tail = head;
    } else {
      final Node newTail = Node(value);
      tail!.next = newTail;
      tail = newTail;
    }
    _count++;
  }

  bool delete(int value) {
    Node? previous;
    Node? current = head;
    while (current != null) {
      if (current.value == value) {
        if (previous == null) {
          head = current.next;
        } else {
          previous.next = current.next;
        }
        if (current.next == null) {
          tail = previous;
        }
        _count--;
        return true;
      }
      previous = current;
      current = current.next;
    }
    return false;
  }
}

final class Stack {
  Node? top;
  int _count = 0;

  bool isEmpty() {
    return _count == 0;
  }

  int size() {
    return _count;
  }

  void push(int value) {
    final Node newTop = Node(value);
    newTop.next = top;
    top = newTop;
    _count++;
  }

  int peek() {
    return top?.value ?? failureValue;
  }

  int pop() {
    if (isEmpty()) {
      return failureValue;
    }
    final int value = top!.value;
    top = top!.next;
    _count--;
    return value;
  }
}

final class Queue {
  Node? front;
  Node? rear;
  int _count = 0;

  bool isEmpty() {
    return _count == 0;
  }

  int size() {
    return _count;
  }

  void enqueue(int value) {
    final Node newRear = Node(value);
    if (isEmpty()) {
      front = newRear;
      rear = newRear;
    } else {
      rear!.next = newRear;
      rear = newRear;
    }
    _count++;
  }

  int peek() {
    return front?.value ?? failureValue;
  }

  int dequeue() {
    if (isEmpty()) {
      return failureValue;
    }
    final int value = front!.value;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    _count--;
    return value;
  }
}
