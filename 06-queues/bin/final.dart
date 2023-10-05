import 'package:final_project/queue.dart';

void main() {
  queueListExample();
  queueLinkedListExample();
  queueRingBufferExample();
  queueDoubleStackExample();
}

void queueDoubleStackExample() {
  print('\n// queueDoubleStackExample');
  final queue = QueueStack<String>();
  testQueue(queue);
}

void queueLinkedListExample() {
  print('\n// queueLinkedListExample');
  final queue = QueueLinkedList<String>();
  testQueue(queue);
}

void queueListExample() {
  print('// queueListExample');
  final queue = QueueList<String>();
  testQueue(queue);
}

void queueRingBufferExample() {
  print('\n// queueRingBufferExample');
  final queue = QueueRingBuffer<String>(10);
  testQueue(queue);
}

void testQueue(Queue<String> queue) {
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue);
  queue.dequeue();
  print(queue);
  queue.peek;
  print(queue);
}
