class _TrieNode {
  final Map<int, _TrieNode> children = {};
  bool isEnd = false;
}

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    // Store the dictionary in a trie so that from any position we can
    // walk forward and find every word that starts there in one pass.
    final root = _TrieNode();
    for (final word in wordDict) {
      var node = root;
      for (final unit in word.codeUnits) {
        node = node.children.putIfAbsent(unit, () => _TrieNode());
      }
      node.isEnd = true;
    }

    final chars = s.codeUnits;
    final n = chars.length;
    final canReach = List<bool>.filled(n + 1, false); // canReach[i]: s[:i] can be split
    canReach[0] = true;

    for (var start = 0; start < n; start++) {
      if (!canReach[start]) continue;
      var node = root;
      for (var end = start; end < n; end++) {
        final next = node.children[chars[end]];
        if (next == null) break;
        node = next;
        if (node.isEnd) canReach[end + 1] = true;
      }
    }

    return canReach[n];
  }
}
