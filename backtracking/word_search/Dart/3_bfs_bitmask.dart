import 'dart:collection';

class Solution {
  bool exist(List<List<String>> board, String word) {
    final rows = board.length;
    final cols = board[0].length;
    const directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];

    // Each state is [row, col, letters matched, bitmask of cells used so far].
    final queue = Queue<List<int>>();
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] == word[0]) {
          queue.add([r, c, 1, 1 << (r * cols + c)]);
        }
      }
    }

    // Expand every partial path one letter at a time.
    while (queue.isNotEmpty) {
      final state = queue.removeFirst();
      final r = state[0];
      final c = state[1];
      final n = state[2];
      final used = state[3];
      if (n == word.length) return true;

      for (final d in directions) {
        final nr = r + d[0];
        final nc = c + d[1];
        if (nr < 0 || nc < 0 || nr >= rows || nc >= cols) continue;
        final bit = 1 << (nr * cols + nc);
        if ((used & bit) == 0 && board[nr][nc] == word[n]) {
          queue.add([nr, nc, n + 1, used | bit]);
        }
      }
    }
    return false;
  }
}
