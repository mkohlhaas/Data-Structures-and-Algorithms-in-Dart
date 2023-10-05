bool betterSearch(int value, List<int> list) {
  int start = 0;
  int end = list.length;

  while (start < end) {
    final size = end - start;
    int middle = start + size ~/ 2;

    if (list[middle] == value) {
      return true;
    } else if (list[middle] < value) {
      start = middle + 1;
    } else {
      end = middle;
    }
  }

  return false;
}

int betterSumFromOneTo(int n) {
  return n * (n + 1) ~/ 2;
}

void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first);
  } else {
    print('no names');
  }
}

List<String> fillList(int length) {
  return List.filled(length, 'a');
}

int multiply(int a, int b) {
  return a * b;
}

bool naiveSearch(int value, List<int> list) {
  for (final element in list) {
    if (element == value) return true;
  }
  return false;
}

void printMoreNames(List<String> names) {
  for (final _ in names) {
    for (final name in names) {
      print(name);
    }
  }
}

void printNames(List<String> names) {
  for (final name in names) {
    print(name);
  }
}

List<String> stuffList(int length) {
  return List.filled(length, 'a' * length);
}

int sumFromOneTo(int n) {
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}
