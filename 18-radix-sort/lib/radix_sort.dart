import 'dart:math';
import 'package:collection/collection.dart';

extension Digits on int {
  static const _base = 10;

  // returns digit at a certain position
  int? digitAt(int position) {
    if (position >= digits()) {
      return null;
    }

    // var number = this;
    // for (var i = 0; i < position; i++) {
    //   number ~/= _base;
    // }

    var number = this;
    while (number ~/ pow(_base, position + 1) != 0) {
      number ~/= _base;
    }
    return number % _base;
  }

  // returns number of digits
  int digits() {
    var count = 0;
    var number = this;
    while (number != 0) {
      count++;
      number ~/= _base;
    }
    return count;
  }
}

// Most significant digit
extension MsdRadixSort on List<int> {
  void lexicographicalSort() {
    final sorted = _msdRadixSorted(this, 0);
    clear();
    addAll(sorted);
  }

  int maxDigits() {
    return fold(0, max).digits();
  }

  List<int> _msdRadixSorted(List<int> list, int position) {
    if (list.length < 2 || position >= list.maxDigits()) {
      return list;
    }

    final buckets = List.generate(10, (_) => <int>[]);
    var priorityBucket = <int>[];

    for (var number in list) {
      final digit = number.digitAt(position);
      if (digit == null) {
        priorityBucket.add(number);
        continue;
      }
      buckets[digit].add(number);
    }

    final bucketOrdered = buckets.fold(<int>[], (result, bucket) {
      final sorted = _msdRadixSorted(bucket, position + 1);
      return result..addAll(sorted);
    });

    return priorityBucket..addAll(bucketOrdered);
  }
}

extension RadixSort on List<int> {
  void radixSort() {
    const base = 10;
    var done = false;
    var place = 1;
    while (!done) {
      done = true;
      final buckets = List.generate(base, (_) => <int>[]);
      forEach((number) {
        final remainingPart = number ~/ place;
        final digit = remainingPart % base;
        buckets[digit].add(number);
        if (remainingPart ~/ base > 0) {
          done = false;
        }
      });
      clear();
      addAll(buckets.flattened);
      place *= base;
    }
  }
}
