import 'package:final_project/binary_node.dart';

void main() {
  binaryTree();
  inOrderTraversal();
  preOrderTraversal();
  postOrderTraversal();
}

void binaryTree() {
  print('// binaryTree\n');
  final tree = createBinaryTree();
  print(tree);
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

void inOrderTraversal() {
  print('\n// inOrderTraversal');
  print('traverseInOrder');
  final tree = createBinaryTree();
  tree.traverseInOrder(print);
}

void postOrderTraversal() {
  print('\n// postOrderTraversal');
  print('traversePostOrder');
  final tree = createBinaryTree();
  tree.traversePostOrder(print);
}

void preOrderTraversal() {
  print('\n// preOrderTraversal');
  print('traversePreOrder');
  final tree = createBinaryTree();
  tree.traversePreOrder(print);
}
