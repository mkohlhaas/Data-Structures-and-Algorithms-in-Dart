import 'package:final_project/string_trie.dart';

void main() {
  insertingAndContains();
  removing();
  prefixMatching();
}

void insertingAndContains() {
  print('// insertingAndContains');
  final trie = StringTrie();
  trie.insert("cute");
  if (trie.contains("cute")) {
    print("cute is in the trie");
  }
  if (!trie.contains("cut")) {
    print("cut is not in the trie");
  }
}

void prefixMatching() {
  print('\n// prefixMatching');
  final trie = StringTrie();
  trie.insert('car');
  trie.insert('card');
  trie.insert('care');
  trie.insert('cared');
  trie.insert('cars');
  trie.insert('carbs');
  trie.insert('carapace');
  trie.insert('cargo');

  print('Collections starting with "car"');
  final prefixedWithCar = trie.matchPrefix('car');
  print(prefixedWithCar);

  print('\nCollections starting with "care"');
  final prefixedWithCare = trie.matchPrefix('care');
  print(prefixedWithCare);

  print('\nCollections starting with "ca"');
  final prefixedWithCa = trie.matchPrefix('ca');
  print(prefixedWithCa);
}

void removing() {
  print('\n// removing');
  final trie = StringTrie();
  trie.insert('cut');
  trie.insert('cute');

  assert(trie.contains('cut'));
  print('"cut" is in the trie');
  assert(trie.contains('cute'));
  print('"cute" is in the trie');

  print('\n--- Removing "cut" ---');
  trie.remove('cut');
  assert(!trie.contains('cut'));
  assert(trie.contains('cute'));
  print('"cute" is still in the trie');
}
