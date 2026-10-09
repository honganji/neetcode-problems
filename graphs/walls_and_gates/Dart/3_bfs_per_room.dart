import 'dart:collection';

void wallsAndGates(List<List<int>> rooms) {
  const inf = 2147483647;
  const directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];
  if (rooms.isEmpty) return;
  final rows = rooms.length;
  final cols = rooms[0].length;

  // Start a separate search from each empty room and stop at the first gate.
  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      if (rooms[r][c] != inf) continue;

      final seen = <int>{r * cols + c};
      final queue = Queue<List<int>>()..add([r, c, 0]);
      while (queue.isNotEmpty) {
        final cell = queue.removeFirst();
        final row = cell[0];
        final col = cell[1];
        final dist = cell[2];
        if (rooms[row][col] == 0) {
          rooms[r][c] = dist;
          break;
        }
        for (final d in directions) {
          final nr = row + d[0];
          final nc = col + d[1];
          if (nr >= 0 &&
              nr < rows &&
              nc >= 0 &&
              nc < cols &&
              rooms[nr][nc] != -1 &&
              seen.add(nr * cols + nc)) {
            queue.add([nr, nc, dist + 1]);
          }
        }
      }
    }
  }
}
