class _TrieNode {
  final List<_TrieNode?> children = List.filled(26, null);
  bool isEnd = false;
}

class Trie {
  final _TrieNode _root = _TrieNode();
  static final int _a = 'a'.codeUnitAt(0);

  Trie();

  void insert(String word) {
    var node = _root;
    for (final code in word.codeUnits) {
      final index = code - _a;
      var child = node.children[index];
      if (child == null) {
        child = _TrieNode();
        node.children[index] = child;
      }
      node = child;
    }
    node.isEnd = true;
  }

  bool search(String word) {
    final node = _find(word);
    return node != null && node.isEnd;
  }

  bool startsWith(String prefix) {
    return _find(prefix) != null;
  }

  _TrieNode? _find(String key) {
    _TrieNode? node = _root;
    for (final code in key.codeUnits) {
      node = node!.children[code - _a];
      if (node == null) return null;
    }
    return node;
  }
}
