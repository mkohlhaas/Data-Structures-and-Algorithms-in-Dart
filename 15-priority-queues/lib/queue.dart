abstract interface class Queue<E> {
  bool get isEmpty;
  E? get peek;
  E? dequeue();
  bool enqueue(E element);
}
