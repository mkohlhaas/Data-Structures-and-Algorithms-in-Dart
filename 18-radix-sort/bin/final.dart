import 'package:final_project/radix_sort.dart';

void main() {
  lsdRadixSort();
  numberOfDigits();
  digitAtPosition();
  maxDigits();
  msdRadixSort();
}

void digitAtPosition() {
  print('\n// digitAtPosition');
  print(1345);
  print(1345.digitAt(0));
  print(1345.digitAt(1));
  print(1345.digitAt(2));
  print(1345.digitAt(3));
  print(1345.digitAt(4));
  print(1345.digitAt(5));
}

void lsdRadixSort() {
  print('// lsdRadixSort');
  final list = [88, 410, 1772, 20];
  print("Original list: $list");
  list.radixSort();
  print("Radix sorted:  $list");
}

void maxDigits() {
  print('\n// maxDigits');
  final list = [46, 500, 459, 1345, 13, 999];
  print(list);
  print(list.maxDigits());
}

void msdRadixSort() {
  print('\n// msdRadixSort');
  final list = [46, 500, 459, 1345, 13, 999];
  print('Original list:            $list');
  list.lexicographicalSort();
  print('Lexicographically sorted: $list');
}

void numberOfDigits() {
  print('\n// numberOfDigits');
  print(13.digits());
  print(10.digits());
  print(999.digits());
  print(1345.digits());
}
