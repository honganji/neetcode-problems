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
    final stack = <(_TrieNode, int)>[(_root, 0)];
    while (stack.isNotEmpty) {
      final (node, i) = stack.removeLast();
      if (i == word.length) {
        if (node.isWord) return true;
        continue;
      }
      final code = word.codeUnitAt(i);
      if (code == 46) {
        for (final child in node.children) {
          if (child != null) stack.add((child, i + 1));
        }
      } else {
        final child = node.children[code - 97];
        if (child != null) stack.add((child, i + 1));
      }
    }
    return false;
  }
}
