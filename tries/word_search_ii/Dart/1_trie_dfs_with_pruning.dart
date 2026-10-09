class _TrieNode {
  final Map<String, _TrieNode> children = {};
  String? word;
}

List<String> findWords(List<List<String>> board, List<String> words) {
  final root = _TrieNode();
  for (final word in words) {
    var node = root;
    for (var i = 0; i < word.length; i++) {
      node = node.children.putIfAbsent(word[i], _TrieNode.new);
    }
    node.word = word;
  }

  final rows = board.length;
  final cols = board[0].length;
  final found = <String>[];

  void dfs(int r, int c, _TrieNode parent) {
    final ch = board[r][c];
    final node = parent.children[ch];
    if (node == null) return;
    final word = node.word;
    if (word != null) {
      found.add(word);
      node.word = null;
    }
    board[r][c] = '#';
    if (r + 1 < rows) dfs(r + 1, c, node);
    if (r > 0) dfs(r - 1, c, node);
    if (c + 1 < cols) dfs(r, c + 1, node);
    if (c > 0) dfs(r, c - 1, node);
    board[r][c] = ch;
    // Every word below this node has been collected, so cut the branch.
    if (node.children.isEmpty) parent.children.remove(ch);
  }

  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      dfs(r, c, root);
    }
  }
  return found;
}
