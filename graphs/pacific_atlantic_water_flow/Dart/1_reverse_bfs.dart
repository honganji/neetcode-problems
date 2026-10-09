import 'dart:collection';

const _directions = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1],
];

List<List<int>> pacificAtlantic(List<List<int>> heights) {
  final m = heights.length;
  final n = heights[0].length;

  // Cells are encoded as r * n + c. Water flows downhill, so walk uphill from the edge.
  Set<int> flood(List<int> starts) {
    final seen = Set<int>.of(starts);
    final queue = Queue<int>.of(seen);
    while (queue.isNotEmpty) {
      final cell = queue.removeFirst();
      final r = cell ~/ n;
      final c = cell % n;
      for (final d in _directions) {
        final nr = r + d[0];
        final nc = c + d[1];
        if (nr < 0 || nr >= m || nc < 0 || nc >= n) continue;
        final next = nr * n + nc;
        if (!seen.contains(next) && heights[nr][nc] >= heights[r][c]) {
          seen.add(next);
          queue.add(next);
        }
      }
    }
    return seen;
  }

  final pacificStarts = [
    for (var c = 0; c < n; c++) c,
    for (var r = 1; r < m; r++) r * n,
  ];
  final atlanticStarts = [
    for (var c = 0; c < n; c++) (m - 1) * n + c,
    for (var r = 0; r < m - 1; r++) r * n + n - 1,
  ];
  final pacific = flood(pacificStarts);
  final atlantic = flood(atlanticStarts);
  return [
    for (final cell in pacific)
      if (atlantic.contains(cell)) [cell ~/ n, cell % n],
  ];
}
