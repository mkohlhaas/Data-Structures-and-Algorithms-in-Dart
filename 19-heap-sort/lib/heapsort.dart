import 'heap.dart';

List<E> heapsort<E extends Comparable<E>>(List<E> list) {
  final heap = Heap<E>(
    elements: list.toList(),
    priority: Priority.min,
  );

  final sorted = <E>[];
  while (!heap.isEmpty) {
    final value = heap.remove();
    sorted.add(value!);
  }
  return sorted;
}

extension Heapsort<E extends Comparable<E>> on List<E> {
  void heapsortInPlace() {
    if (isEmpty) return;

    // heapify the list; start from last parent node
    var start = length ~/ 2 - 1;
    while (start >= 0) {
      // all nodes below start will be in heap-order
      _siftDown(start: start, end: length);
      // go to previous parent node (after sifting down the root node all nodes are in heap order)
      start--;
    }

    var end = length - 1;
    while (end >0) {
      _swapValues(0, end);
      _siftDown(start: 0, end: end);
      end--;
    }
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  void _siftDown({required int start, required int end}) {
    var parent = start;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = parent;
      if (left < end && this[left].compareTo(this[chosen]) > 0) {
        chosen = left;
      }
      if (right < end && this[right].compareTo(this[chosen]) > 0) {
        chosen = right;
      }
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  void _swapValues(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}
