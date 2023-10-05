import 'package:final_project/binary_search.dart';
import 'package:test/test.dart';

void main() {
  group('binarySearch:', () {
    test('empty list', () {
      final list = <num>[];
      expect(list.binarySearch(1), isNull);
    });

    test('normal list', () {
      final list = <num>[1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
      expect(list.binarySearch(1), 0);
      expect(list.binarySearch(5), 1);
      expect(list.binarySearch(15), 2);
      expect(list.binarySearch(17), 3);
      expect(list.binarySearch(19), 4);
      expect(list.binarySearch(22), 5);
      expect(list.binarySearch(24), 6);
      expect(list.binarySearch(31), 7);
      expect(list.binarySearch(105), 8);
      expect(list.binarySearch(150), 9);
      expect(list.binarySearch(-1), isNull);
      expect(list.binarySearch(100), isNull);
    });

    test('normal list recursively', () {
      final list = <num>[1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
      expect(list.binarySearchRec(1), 0);
      expect(list.binarySearchRec(5), 1);
      expect(list.binarySearchRec(15), 2);
      expect(list.binarySearchRec(17), 3);
      expect(list.binarySearchRec(19), 4);
      expect(list.binarySearchRec(22), 5);
      expect(list.binarySearchRec(24), 6);
      expect(list.binarySearchRec(31), 7);
      expect(list.binarySearchRec(105), 8);
      expect(list.binarySearchRec(150), 9);
      expect(list.binarySearchRec(-1), isNull);
      expect(list.binarySearchRec(100), isNull);
    });
  });
}
