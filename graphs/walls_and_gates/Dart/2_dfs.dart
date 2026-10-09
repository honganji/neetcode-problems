void wallsAndGates(List<List<int>> rooms) {
  const directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];
  if (rooms.isEmpty) return;
  final rows = rooms.length;
  final cols = rooms[0].length;

  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      if (rooms[r][c] != 0) continue;

      // Depth-first search from this gate. A room is only updated
      // when we arrive with a shorter distance than it already has.
      final stack = <List<int>>[
        [r, c, 0],
      ];
      while (stack.isNotEmpty) {
        final cell = stack.removeLast();
        final row = cell[0];
        final col = cell[1];
        final dist = cell[2];
        if (row < 0 || row >= rows || col < 0 || col >= cols) continue;
        // Wall, or this room is already closer to a gate.
        if (rooms[row][col] < dist) continue;
        rooms[row][col] = dist;
        for (final d in directions) {
          stack.add([row + d[0], col + d[1], dist + 1]);
        }
      }
    }
  }
}
