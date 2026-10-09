class _TrieNode {
  final Map<int, _TrieNode> children = {};
  bool isEnd = false;
}

class Trie {
  final _TrieNode _root = _TrieNode();

  Trie();

  void insert(String word) {
    var node = _root;
    for (final code in word.codeUnits) {
      node = node.children.putIfAbsent(code, () => _TrieNode());
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
      node = node!.children[code];
      if (node == null) return null;
    }
    return node;
  }
}
