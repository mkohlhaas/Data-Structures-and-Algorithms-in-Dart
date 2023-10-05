import 'package:final_project/avl_tree.dart';

void main() {
  inserting();
  removing();
}

void inserting() {
  print('// inserting\n');
  final tree = AvlTree<num>();
  for (var i = 1; i <= 100; i++) {
    tree.insert(i);
  }
  print(tree);
}

void removing() {
  print('\n// removing\n');
  final tree = AvlTree<num>();
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.insert(18);
  print('Before removing 10:\n');
  print(tree);
  print('After removing 10:\n');
  tree.remove(10);
  print(tree);
}
