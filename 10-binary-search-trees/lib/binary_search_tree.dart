import 'binary_node.dart';

class BinarySearchTree<E extends Comparable<E>> {
  BinaryNode<E>? root;

  bool contains(E value) {
    var current = root;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  void insert(E value) {
    root = _insertAt(root, value);
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  @override
  String toString() => root.toString();

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    if (node == null) {
      return BinaryNode(value);
    }
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    return node;
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;
    if (value == node.value) {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }
}

// nice trick!
extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
