import 'package:final_project/merge_sort.dart';

void main() {
  final list = <num>[7, 2, 6, 3, 9];
  final sorted = mergeSort(list);
  print('Original: $list');
  print('Merge sorted: $sorted');
}
