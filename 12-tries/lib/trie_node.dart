class TrieNode<T> {
  T? key;
  TrieNode<T>? parent;
  Map<T, TrieNode<T>?> children = {};
  bool isTerminal = false;

  TrieNode({this.key, this.parent});
}
