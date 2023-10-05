import 'dart:math' as math;

import 'avl_node.dart';

class AvlTree<E extends Comparable<E>> {
  AvlNode<E>? _root;

  bool contains(E value) {
    var current = _root;
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
    _root = _insertAt(_root, value);
  }

  int _calcHeight(AvlNode<dynamic> node) {
    return 1 +
        math.max(
          node.leftHeight,
          node.rightHeight,
        );
  }

  void remove(E value) {
    _root = _remove(_root, value);
  }

  @override
  String toString() => _root.toString();

  AvlNode<E> _balance(AvlNode<E> node) {
    AvlNode<E> result;
    switch (node.balanceFactor) {
      case 2:
        final left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return _leftRightRotate(node);
        } else {
          result = _rightRotate(node);
        }
      case -2:
        final right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          result = _rightLeftRotate(node);
        } else {
          result = _leftRotate(node);
        }
      default:
        result = node;
    }
    node.height = _calcHeight(node);
    return result;
  }

  AvlNode<E> _insertAt(AvlNode<E>? node, E value) {
    if (node == null) {
      return AvlNode(value);
    }
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    return _balance(node);
  }

  AvlNode<E> _leftRightRotate(AvlNode<E> node) {
    if (node.leftChild == null) {
      return node;
    }
    node.leftChild = _leftRotate(node.leftChild!);
    return _rightRotate(node);
  }

  AvlNode<E> _leftRotate(AvlNode<E> node) {
    final pivot = node.rightChild!;
    node.rightChild = pivot.leftChild;
    pivot.leftChild = node;
    node.height = _calcHeight(node);
    pivot.height = _calcHeight(pivot);
    return pivot;
  }

  AvlNode<E>? _remove(AvlNode<E>? node, E value) {
    if (node == null) return null;
    if (value == node.value) {
      // TODO: can we use pattern matching?
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
    return _balance(node);
  }

  AvlNode<E> _rightLeftRotate(AvlNode<E> node) {
    if (node.rightChild == null) {
      return node;
    }
    node.rightChild = _rightRotate(node.rightChild!);
    return _leftRotate(node);
  }

  AvlNode<E> _rightRotate(AvlNode<E> node) {
    final pivot = node.leftChild!;
    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;
    node.height = _calcHeight(node);
    pivot.height = _calcHeight(pivot);
    return pivot;
  }
}

extension _MinFinder<E> on AvlNode<E> {
  AvlNode<E> get min => leftChild?.min ?? this;
}
