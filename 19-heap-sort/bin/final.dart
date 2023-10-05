import 'package:final_project/heapsort.dart';

void main() {
  heapsortUsingHeap();
  inPlaceHeapsort();
}

void heapsortUsingHeap() {
  print('// heapsortUsingHeap');
  final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
  print(list);
  final sorted = heapsort<num>(list);
  print(sorted);
}

void inPlaceHeapsort() {
  print('\n// inPlaceHeapsort');
  final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
  print(list);
  list.heapsortInPlace();
  print(list);
}
