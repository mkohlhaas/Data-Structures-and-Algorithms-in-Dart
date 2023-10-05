class Stack<E> {
  final List<E> _storage;

  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  bool get isEmpty => _storage.isEmpty;
  bool get isNotEmpty => !isEmpty;
  E get peek => _storage.last;
  E pop() => _storage.removeLast();
  void push(E element) => _storage.add(element);

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
