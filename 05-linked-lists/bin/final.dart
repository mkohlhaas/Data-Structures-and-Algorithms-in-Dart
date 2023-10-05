import 'package:final_project/linked_list.dart';

void main() {
  nodesExample();
  pushExample();
  appendExample();
  insertAfterExample();
  popExample();
  removeLastExample();
  removeAfterExample();
  makingListIterable();
}

void appendExample() {
  print('\n// appendExample');
  final list = LinkedList<int>();
  list.append(1);
  list.append(2);
  list.append(3);

  print(list);
}

void insertAfterExample() {
  print('\n// insertAfterExample');
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  var middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  print('After:  $list');
}

void makingListIterable() {
  print('\n// makingListIterable');
  final numbers = [1, 2, 3];
  for (final number in numbers) {
    print(number);
  }

  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  for (final element in list) {
    print(element);
  }
}

void nodesExample() {
  print('// nodesExample');
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);
}

void popExample() {
  print('\n// popExample');
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  final poppedValue = list.pop();

  print('After:  $list');
  print('Popped value: $poppedValue');
}

void pushExample() {
  print('\n// pushExample');
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print(list);
}

void removeAfterExample() {
  print('\n// removeAfterExample');
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  final firstNode = list.nodeAt(0);
  final removedValue = list.removeAfter(firstNode!);

  print('After:  $list');
  print('Removed value: $removedValue');
}

void removeLastExample() {
  print('\n// removeLastExample');
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  final removedValue = list.removeLast();

  print('After:  $list');
  print('Removed value: $removedValue');
}
