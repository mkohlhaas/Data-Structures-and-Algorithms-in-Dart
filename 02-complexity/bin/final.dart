import 'package:final_project/chapter_code.dart';

void main() {
  ///////////////////////
  /// Time complexity ///
  ///////////////////////

  // Constant time
  print('// Constant Time');
  const names = ['Edith', 'Megan', 'Pablo'];
  checkFirst(names);

  // Linear time
  print('\n// Linear Time');
  printNames(names);

  // Quadratic time
  print('\n// Quadratic Time');
  printMoreNames(names);

  // Logarithmic time
  print('\n// Logarithmic Time');
  const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
  var exists = naiveSearch(451, numbers);
  print(exists);
  exists = betterSearch(451, numbers);
  print(exists);

  // Comparing time complexity
  print('\n// Comparing Time Complexity');
  print('// Naive');
  final start = DateTime.now();
  final sum = sumFromOneTo(10000);
  final end = DateTime.now();
  final time = end.difference(start);
  print(sum);
  print(time);

  print('// Gauss');
  final start2 = DateTime.now();
  final sum2 = betterSumFromOneTo(10000);
  final end2 = DateTime.now();
  final time2 = end2.difference(start2);
  print(sum2);
  print(time2);

  ////////////////////////
  /// Space complexity ///
  ////////////////////////

  // Constant space
  print('\n// Constant Space');
  print(multiply(3, 5));

  // Linear space
  print('\n// Linear Space');
  print(fillList(5));

  // Quadratic space
  print('\n// Quadratic Space');
  print(stuffList(5));
}
