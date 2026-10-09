List<String> findWords(List<List<String>> board, List<String> words) {
  final rows = board.length;
  final cols = board[0].length;

  bool exists(int r, int c, String word, int i) {
    if (board[r][c] != word[i]) return false;
    if (i == word.length - 1) return true;
    board[r][c] = '#';
    final ok = (r + 1 < rows && exists(r + 1, c, word, i + 1)) ||
        (r > 0 && exists(r - 1, c, word, i + 1)) ||
        (c + 1 < cols && exists(r, c + 1, word, i + 1)) ||
        (c > 0 && exists(r, c - 1, word, i + 1));
    board[r][c] = word[i];
    return ok;
  }

  final found = <String>[];
  for (final word in words.toSet()) {
    if (word.length > rows * cols) continue;
    var hit = false;
    for (var r = 0; r < rows && !hit; r++) {
      for (var c = 0; c < cols && !hit; c++) {
        hit = exists(r, c, word, 0);
      }
    }
    if (hit) found.add(word);
  }
  return found;
}
