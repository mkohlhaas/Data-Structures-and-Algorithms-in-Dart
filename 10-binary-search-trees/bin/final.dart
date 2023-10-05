import 'package:final_project/binary_search_tree.dart';

void main() {
  insertingElementsUnbalanced();
  insertingElementsBalanced();
  findingElements();
  removingElements();
}

BinarySearchTree<num> buildExampleTree() {
  var tree = BinarySearchTree<num>();
  tree.insert(3);
  tree.insert(1);
  tree.insert(4);
  tree.insert(0);
  tree.insert(2);
  tree.insert(5);
  return tree;
}

void findingElements() {
  print('\n// findingElements');
  final tree = buildExampleTree();
  if (tree.contains(5)) {
    print("Found 5!");
  } else {
    print("Couldn’t find 5");
  }
}

void insertingElementsBalanced() {
  print('\n// insertingElementsBalanced');
  final tree = buildExampleTree();
  print(tree);
}

void insertingElementsUnbalanced() {
  print('// insertingElementsUnbalanced');
  final tree = BinarySearchTree<num>();
  for (var i = 0; i < 5; i++) {
    tree.insert(i);
  }
  print(tree);
}

void removingElements() {
  print('\n// removingElements');
  final tree = buildExampleTree();
  print('Tree before removal:');
  print(tree);
  tree.remove(3);
  print('Tree after removing root:');
  print(tree);
}
