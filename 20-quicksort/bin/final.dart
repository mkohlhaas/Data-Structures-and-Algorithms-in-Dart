import 'package:final_project/quicksort.dart';

void main() {
  naive();
  lomuto();
  hoare();
  median();
  dutchFlag();
}

// Dutch national flag partitioning is an excellent technique to use if you have a lot of duplicate elements.
void dutchFlag() {
  print('\n// dutchFlag');
  final list = <num>[8, 2, 2, 8, 9, 5, 9, 2, 8];
  quicksortDutchFlag(list, 0, list.length - 1);
  print(list);
}

void hoare() {
  print('\n// hoare');
  final list = <num>[8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortHoare(list, 0, list.length - 1);
  print(list);
}

// based on idea by Nico Lomuto
void lomuto() {
  print('\n// lomuto');
  final list = <num>[8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortLomuto(list, 0, list.length - 1);
  print(list);
}

void median() {
  print('\n// median');
  final list = <num>[8, 7, 6, 5, 4, 3, 2, 1];
  quicksortMedian(list, 0, list.length - 1);
  print(list);
}

void naive() {
  print('// naive');
  final list = <num>[8, 2, 10, 0, 9, 18, 9, -1, 5];
  final sorted = quicksortNaive(list);
  print(sorted);
}
