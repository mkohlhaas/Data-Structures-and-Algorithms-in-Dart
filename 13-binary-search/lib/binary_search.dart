extension SortedList<E extends Comparable<E>> on List<E> {
  int? binarySearch(E value) {
    var start = 0;
    var end = length;
    while (start < end) {
      final size = end - start;
      final middle = start + size ~/ 2;
      if (this[middle] == value) {
        return middle;
      } else if (this[middle].compareTo(value) < 0) {
        start = middle + 1;
      } else {
        end = middle;
      }
    }
    return null;
  }
}

// recursive version
extension SortedListRec<E extends Comparable<dynamic>> on List<E> {
  int? binarySearchRec(E value, [int? start, int? end]) {
    final startIndex = start ?? 0;
    final endIndex = end ?? length;
    if (startIndex >= endIndex) {
      return null;
    }
    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;
    if (this[middle] == value) {
      return middle;
    } else if (value.compareTo(this[middle]) < 0) {
      return binarySearchRec(value, startIndex, middle);
    } else {
      return binarySearchRec(value, middle + 1, endIndex);
    }
  }
}
