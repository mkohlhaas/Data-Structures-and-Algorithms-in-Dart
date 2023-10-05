import 'package:final_project/stack.dart';

void main() {
  recursionInComputing();
  whenRecursionIsUseful();
  whenNotToUseRecursion();
}

void breakingOutOfWhileLoopExample() {
  print('\n// breakingOutOfWhileLoopExample');
  int i = 0;
  while (true) {
    print('Knock knock');
    print("Who's there?");
    if (i == 5) break;
    print('Banana');
    print('Banana who?');
    i++;
  }
  print('Orange');
  print('Orange who?');
  print("Orange you glad I didn't say banana again?\n");
}

void countToTenRecursively([int i = 1]) {
  print('// countToTenRecursively');
  if (i > 10) return;
  print('$i Mississippi');
  // await Future.delayed(Duration(seconds: 1));
  countToTenRecursively(i + 1);
}

int fibonacci(int n) {
  print('// fibonacci');
  print('fibonacci($n)');
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int iterativeFibonacci(int n) {
  print('\n// iterativeFibonacci');
  if (n <= 1) return n;

  int first = 1;
  int second = 1;

  for (int i = 3; i <= n; i++) {
    int temp = first + second;
    first = second;
    second = temp;
  }

  return second;
}

int memoizedFibonacci(int n, [Map<int, int>? memo]) {
  print('// memoizedFibonacci');
  print('memoizedFibonacci($n)');
  memo ??= {};
  if (n <= 1) return n;
  if (!memo.containsKey(n)) {
    memo[n] = memoizedFibonacci(n - 1, memo) + memoizedFibonacci(n - 2, memo);
  }
  return memo[n]!;
}

void printName(Rabbit rabbit) {
  print('// printName');
  print(rabbit.name);
  final babies = rabbit.babies;
  if (babies == null) return;
  for (final baby in babies) {
    printName(baby);
  }
}

void printNamesIteratively(Rabbit rabbit) {
  print('\n// printNamesIteratively');
  final stack = Stack<Rabbit>();
  stack.push(rabbit);

  while (stack.isNotEmpty) {
    Rabbit current = stack.pop();
    print(current.name);

    final babies = current.babies;
    if (babies == null) continue;

    for (final baby in babies.reversed) {
      stack.push(baby);
    }
  }
}

void recursionInComputing() {
  print('// recursionInComputing');
  // tellJoke();
  // tellJokeIteratively();
  breakingOutOfWhileLoopExample();
  countToTenRecursively();
}

void tellJoke() {
  print('\n// tellJoke');
  print("Pete and Repeat were in a boat. Pete fell out. Who's left?");
  print('Repeat');
  tellJoke();
}

void tellJokeIteratively() {
  print('\n// tellJokeIteratively');
  while (true) {
    print("Pete and Repeat were in a boat. Pete fell out. Who's left?");
    print('Repeat');
  }
}

void whenNotToUseRecursion() {
  print('\n// whenNotToUseRecursion');
  var value = fibonacci(5);
  print('value: $value');
  print('');
  value = memoizedFibonacci(5);
  print('value: $value');

  value = iterativeFibonacci(5);
  print('value: $value');
}

void whenRecursionIsUseful() {
  print('\n// whenRecursionIsUseful');
  final family = Rabbit(
    'Mommy',
    babies: [
      Rabbit(
        'Hoppy',
        babies: [
          Rabbit('Bunny'),
          Rabbit('Honey'),
          Rabbit('Sunny'),
        ],
      ),
      Rabbit(
        'Floppy',
        babies: [
          Rabbit('Doozy'),
          Rabbit('Woozy'),
        ],
      ),
      Rabbit(
        'Moppy',
        babies: [
          Rabbit('Nosey'),
          Rabbit('Mosey'),
          Rabbit('Toesy'),
          Rabbit('Rosey'),
        ],
      ),
    ],
  );

  printName(family);
  printNamesIteratively(family);
}

class Rabbit {
  final String name;
  final List<Rabbit>? babies;
  Rabbit(this.name, {this.babies});
}
