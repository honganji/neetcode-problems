class Solution {
  bool exist(List<List<String>> board, String word) {
    final rows = board.length;
    final cols = board[0].length;

    // If the board lacks any letter the word needs, it can never match.
    final boardCount = <String, int>{};
    for (final row in board) {
      for (final ch in row) {
        boardCount[ch] = (boardCount[ch] ?? 0) + 1;
      }
    }
    final wordCount = <String, int>{};
    for (final ch in word.split('')) {
      wordCount[ch] = (wordCount[ch] ?? 0) + 1;
    }
    for (final entry in wordCount.entries) {
      if ((boardCount[entry.key] ?? 0) < entry.value) return false;
    }

    // Start from the rarer end of the word to cut down the branches.
    var target = word;
    final first = boardCount[word[0]] ?? 0;
    final last = boardCount[word[word.length - 1]] ?? 0;
    if (first > last) {
      target = String.fromCharCodes(word.codeUnits.reversed);
    }

    bool dfs(int r, int c, int i) {
      if (i == target.length) return true;
      if (r < 0 || c < 0 || r >= rows || c >= cols || board[r][c] != target[i]) {
        return false;
      }

      // Mark the cell as used in place, then restore it on the way back.
      final saved = board[r][c];
      board[r][c] = '#';
      final found = dfs(r + 1, c, i + 1) ||
          dfs(r - 1, c, i + 1) ||
          dfs(r, c + 1, i + 1) ||
          dfs(r, c - 1, i + 1);
      board[r][c] = saved;
      return found;
    }

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (dfs(r, c, 0)) return true;
      }
    }
    return false;
  }
}
