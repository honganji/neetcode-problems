class Solution {
  static const _dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];

  void solve(List<List<String>> board) {
    if (board.isEmpty || board[0].isEmpty) return;
    final rows = board.length;
    final cols = board[0].length;

    // Decide for each 'O' on its own, then flip all surrounded ones at the end
    final toFlip = <(int, int)>[];
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] == 'O' && _isSurrounded(board, r, c)) {
          toFlip.add((r, c));
        }
      }
    }
    for (final (r, c) in toFlip) {
      board[r][c] = 'X';
    }
  }

  bool _isSurrounded(List<List<String>> board, int sr, int sc) {
    final rows = board.length;
    final cols = board[0].length;
    final seen = <(int, int)>{(sr, sc)};
    final stack = <(int, int)>[(sr, sc)];
    while (stack.isNotEmpty) {
      final (r, c) = stack.removeLast();
      // Reaching the border means this 'O' is connected to it, so it is not surrounded
      if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) return false;
      for (final (dr, dc) in _dirs) {
        final nr = r + dr;
        final nc = c + dc;
        if (board[nr][nc] == 'O' && seen.add((nr, nc))) {
          stack.add((nr, nc));
        }
      }
    }
    return true;
  }
}
