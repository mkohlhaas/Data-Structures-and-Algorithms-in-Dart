import 'package:final_project/heap.dart';

void main() {
  inserting();
  removingRoot();
  removingArbitraryNode();
  searchingForElement();
  acceptingListInConstructorMax();
  acceptingListInConstructorMin();
}

void acceptingListInConstructorMax() {
  print('\n// acceptingListInConstructorMax');
  var heap = Heap<num>(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(heap);

  while (!heap.isEmpty) {
    print(heap.remove());
  }
}

void acceptingListInConstructorMin() {
  print('\n// acceptingListInConstructorMin');
  var heap = Heap<num>(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
    priority: Priority.min,
  );
  print(heap);

  while (!heap.isEmpty) {
    print(heap.remove());
  }
}

void inserting() {
  print('// inserting');
  final heap = Heap<num>();
  heap.insert(8);
  heap.insert(6);
  heap.insert(5);
  heap.insert(4);
  heap.insert(3);
  heap.insert(2);
  heap.insert(1);
  print(heap);

  heap.insert(7);
  print(heap);
}

void removingArbitraryNode() {
  print('\n// removingArbitraryNode');
  final heap = Heap<num>();
  heap.insert(10);
  heap.insert(7); // remove this
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);

  final index = 1;
  heap.removeAt(index);
  print(heap);
}

void removingRoot() {
  print('\n// removingRoot');
  final heap = Heap<num>();
  heap.insert(10);
  heap.insert(8);
  heap.insert(5);
  heap.insert(4);
  heap.insert(6);
  heap.insert(2);
  heap.insert(1);
  heap.insert(3);

  final root = heap.remove();
  print(root);
  print(heap);
}

void searchingForElement() {
  print('\n// searchingForElement');
  final heap = Heap<num>();
  heap.insert(10);
  heap.insert(7);
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);
  print(heap);

  final index = heap.indexOf(7);
  print(index);
}
