import 'linked_list.dart';
import 'ring_buffer.dart';

// new in Dart 3.0 (abstract interface class)
abstract interface class Queue<E> {
  bool get isEmpty;
  E? get peek;
  E? dequeue(); // remove from the front
  bool enqueue(E element); // insert at the back
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = LinkedList<E>();

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  E? dequeue() => _list.pop();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  String toString() => _list.toString();
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => (isEmpty) ? null : _list.first;

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  String toString() => _list.toString();
}

class QueueRingBuffer<E> implements Queue<E> {
  final RingBuffer<E> _ringBuffer;

  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  String toString() => _ringBuffer.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[]; // reading stack (for dequeuing)
  final _rightStack = <E>[]; // writing stack (for enqueuing)

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
    return _leftStack.removeLast();
  }

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');
    return '[$combined]';
  }
}
