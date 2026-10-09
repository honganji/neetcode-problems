class _TrieNode {
  final List<_TrieNode?> children = List.filled(26, null);
  bool isWord = false;
}

class WordDictionary {
  final _TrieNode _root = _TrieNode();

  WordDictionary();

  void addWord(String word) {
    var node = _root;
    for (final code in word.codeUnits) {
      final idx = code - 97;
      node = node.children[idx] ??= _TrieNode();
    }
    node.isWord = true;
  }

  bool search(String word) {
    return _dfs(_root, word, 0);
  }

  bool _dfs(_TrieNode node, String word, int i) {
    if (i == word.length) return node.isWord;
    final code = word.codeUnitAt(i);
    if (code == 46) {
      for (final child in node.children) {
        if (child != null && _dfs(child, word, i + 1)) return true;
      }
      return false;
    }
    final child = node.children[code - 97];
    return child != null && _dfs(child, word, i + 1);
  }
}
