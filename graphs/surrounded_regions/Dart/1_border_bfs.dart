import 'dart:collection';

class Solution {
  void solve(List<List<String>> board) {
    if (board.isEmpty || board[0].isEmpty) return;
    final rows = board.length;
    final cols = board[0].length;
    final queue = Queue<(int, int)>();

    // Border 'O's are safe: mark them 'S' and start the search from them
    void markSafe(int r, int c) {
      if (board[r][c] == 'O') {
        board[r][c] = 'S';
        queue.add((r, c));
      }
    }

    for (var r = 0; r < rows; r++) {
      markSafe(r, 0);
      markSafe(r, cols - 1);
    }
    for (var c = 0; c < cols; c++) {
      markSafe(0, c);
      markSafe(rows - 1, c);
    }

    // Spread safety to every 'O' connected to a safe cell
    const dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
    while (queue.isNotEmpty) {
      final (r, c) = queue.removeFirst();
      for (final (dr, dc) in dirs) {
        final nr = r + dr;
        final nc = c + dc;
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols) markSafe(nr, nc);
      }
    }

    // Remaining 'O' are surrounded -> 'X'; restore safe cells to 'O'
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] == 'O') {
          board[r][c] = 'X';
        } else if (board[r][c] == 'S') {
          board[r][c] = 'O';
        }
      }
    }
  }
}
