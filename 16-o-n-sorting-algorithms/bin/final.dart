import 'package:final_project/bubble_sort.dart';
import 'package:final_project/insertion_sort.dart';
import 'package:final_project/selection_sort.dart';

void main() {
  bubbleSortExample();
  selectionSortExample();
  insertionSortExample();
}

void bubbleSortExample() {
  print('// bubbleSortExample');
  testSortingAlgorithm(bubbleSort, 'Bubble');
}

void insertionSortExample() {
  print('\n// insertionSortExample');
  testSortingAlgorithm(insertionSort, 'Insertion');
}

void selectionSortExample() {
  print('\n// selectionSortExample');
  testSortingAlgorithm(selectionSort, 'Selection');
}

void testSortingAlgorithm(void Function(List<num>) sortFunc, String sortFuncName) {
  final list = <num>[9, 4, 10, 3];
  print('Original: $list');
  sortFunc(list);
  print('$sortFuncName sorted: $list');
}
