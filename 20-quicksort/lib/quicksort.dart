void quicksortDutchFlag<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final middle = _partitionDutchFlag(list, low, high);
  quicksortDutchFlag(list, low, middle.low - 1);
  quicksortDutchFlag(list, middle.high + 1, high);
}

void quicksortHoare<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final leftHigh = _partitionHoare(list, low, high);
  quicksortHoare(list, low, leftHigh);
  quicksortHoare(list, leftHigh + 1, high);
}

void quicksortLomuto<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final pivotIndex = _partitionLomuto(list, low, high);
  quicksortLomuto(list, low, pivotIndex - 1);
  quicksortLomuto(list, pivotIndex + 1, high);
}

void quicksortMedian<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  var pivotIndex = _medianOfThree(list, low, high);
  list.swap(pivotIndex, high);
  pivotIndex = _partitionLomuto(list, low, high);
  quicksortLomuto(list, low, pivotIndex - 1);
  quicksortLomuto(list, pivotIndex + 1, high);
}

List<E> quicksortNaive<E extends Comparable<E>>(
  List<E> list,
) {
  if (list.length < 2) return list;
  final pivot = list[0];
  final less = list.where(
    (value) => value.compareTo(pivot) < 0,
  );
  final equal = list.where(
    (value) => value.compareTo(pivot) == 0,
  );
  final greater = list.where(
    (value) => value.compareTo(pivot) > 0,
  );
  return [
    ...quicksortNaive(less.toList()),
    ...equal,
    ...quicksortNaive(greater.toList()),
  ];
}

// puts the "median" value into the center of the list
// https://t.ly/WYxvK
// https://t.ly/jlUaa
int _medianOfThree<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  final center = (low + high) ~/ 2;
  if (list[low].compareTo(list[center]) > 0) {
    list.swap(low, center);
  }
  if (list[low].compareTo(list[high]) > 0) {
    list.swap(low, high);
  }
  if (list[center].compareTo(list[high]) > 0) {
    list.swap(center, high);
  }
  return center;
}

Range _partitionDutchFlag<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  final pivot = list[high];
  var smaller = low;
  var equal = low;
  var larger = high;
  while (equal <= larger) {
    if (list[equal].compareTo(pivot) < 0) {
      list.swap(smaller, equal);
      smaller++;
      equal++;
    } else if (list[equal] == pivot) {
      equal++;
    } else {
      list.swap(equal, larger);
      larger--;
    }
  }
  return Range(smaller, larger);
}

int _partitionHoare<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  final pivot = list[low];
  var left = low - 1;
  var right = high + 1;

  while (true) {
    do {
      left++;
    } while (list[left].compareTo(pivot) < 0);
    do {
      right--;
    } while (list[right].compareTo(pivot) > 0);

    if (left < right) {
      list.swap(left, right);
    } else {
      return right;
    }
  }
}

int _partitionLomuto<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  final pivot = list[high];

  var pivotIndex = low;
  for (int i = low; i < high; i++) {
    if (list[i].compareTo(pivot) <= 0) {
      list.swap(pivotIndex, i);
      pivotIndex++;
    }
  }

  list.swap(pivotIndex, high);
  return pivotIndex;
}

class Range {
  final int low;
  final int high;
  const Range(this.low, this.high);
}

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}
