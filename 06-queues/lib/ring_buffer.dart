class RingBuffer<E> {
  final List<E?> _list;

  int _writeIndex = 0;
  int _readIndex = 0;
  int _size = 0;
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);

  bool get isEmpty => _size == 0;

  bool get isFull => _size == _list.length;

  E? get peek => (isEmpty) ? null : _list[_readIndex];

  E? read() {
    if (isEmpty) return null;
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return element;
  }

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    for (int i = 0; i < _size; i++) {
      final index = (_readIndex + i) % _list.length;
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index]);
    }
    text.write(']');
    return text.toString();
  }

  void write(E element) {
    if (isFull) throw Exception('Buffer is full');
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  int _advance(int index) => (index + 1) % _list.length;
}
