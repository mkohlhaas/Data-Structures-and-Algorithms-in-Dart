import 'trie_node.dart';

class StringTrie {
  TrieNode<int> root = TrieNode();

  bool contains(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminal;
  }

  void insert(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }
    current.isTerminal = true;
  }

  List<String> matchPrefix(String prefix) {
    var current = root;
    for (final codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return [];
      }
      current = child;
    }
    return _moreMatches(prefix, current);
  }

  void remove(String text) {
    var current = root;
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminal) {
      return;
    }
    current.isTerminal = false;
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminal) {
      current.parent?.children.remove(current.key);
      current = current.parent!;
    }
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    List<String> results = [];
    if (node.isTerminal) {
      results.add(prefix);
    }
    for (final child in node.children.values) {
      final codeUnit = child!.key!;
      results.addAll(
        _moreMatches(
          '$prefix${String.fromCharCode(codeUnit)}',
          child,
        ),
      );
    }
    return results;
  }
}
