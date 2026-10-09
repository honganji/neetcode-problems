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

  // Start the search from every gate at once.
  final queue = Queue<List<int>>();
  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      if (rooms[r][c] == 0) queue.add([r, c]);
    }
  }

  // Expand one step at a time, so the first time a room is reached
  // is also the shortest distance to a gate.
  while (queue.isNotEmpty) {
    final cell = queue.removeFirst();
    final r = cell[0];
    final c = cell[1];
    for (final d in directions) {
      final nr = r + d[0];
      final nc = c + d[1];
      if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && rooms[nr][nc] == inf) {
        rooms[nr][nc] = rooms[r][c] + 1;
        queue.add([nr, nc]);
      }
    }
  }
}
