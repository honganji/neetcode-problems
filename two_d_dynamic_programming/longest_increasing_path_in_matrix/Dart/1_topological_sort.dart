import 'dart:collection';

int longestIncreasingPath(List<List<int>> matrix) {
  final rows = matrix.length;
  final cols = matrix[0].length;
  const dRow = [1, -1, 0, 0];
  const dCol = [0, 0, 1, -1];

  // indegree[r][c] = how many strictly smaller neighbors can step into this cell.
  final indegree = List.generate(rows, (_) => List.filled(cols, 0));
  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      for (var k = 0; k < 4; k++) {
        final nr = r + dRow[k];
        final nc = c + dCol[k];
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] < matrix[r][c]) {
          indegree[r][c]++;
        }
      }
    }
  }

  // Cells with no smaller neighbor are the starts of paths.
  final queue = Queue<List<int>>();
  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      if (indegree[r][c] == 0) queue.add([r, c]);
    }
  }

  var length = 0;
  while (queue.isNotEmpty) {
    // Each pass over the queue is one more step along the longest paths.
    length++;
    final layerSize = queue.length;
    for (var i = 0; i < layerSize; i++) {
      final cell = queue.removeFirst();
      final r = cell[0];
      final c = cell[1];
      for (var k = 0; k < 4; k++) {
        final nr = r + dRow[k];
        final nc = c + dCol[k];
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] > matrix[r][c]) {
          indegree[nr][nc]--;
          if (indegree[nr][nc] == 0) queue.add([nr, nc]);
        }
      }
    }
  }
  return length;
}
