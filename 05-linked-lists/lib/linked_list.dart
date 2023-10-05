class LinkedList<E> extends Iterable<E> {
  Node<E>? head; // first node of linked list
  Node<E>? tail; // last  node of linked list

  @override
  bool get isEmpty => head == null;

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  // appends at end of linked list
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentNode;
  }

  // removes first node of the linked list
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  // appends at beginning of linked list
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  // removes last node of the linked list
  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

class Node<T> {
  T value;
  Node<T>? next;
  Node({required this.value, this.next});

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    Node<T>? currentNode = this;
    while (true) {
      buffer.write(currentNode?.value);
      currentNode = currentNode?.next;
      if (currentNode == null) break;
      buffer.write(' -> ');
    }
    return buffer.toString();
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  final LinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  _LinkedListIterator(LinkedList<E> list) : _list = list;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}
