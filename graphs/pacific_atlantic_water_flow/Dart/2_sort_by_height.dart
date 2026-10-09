const _directions = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1],
];

List<List<int>> pacificAtlantic(List<List<int>> heights) {
  final m = heights.length;
  final n = heights[0].length;

  int heightOf(int cell) => heights[cell ~/ n][cell % n];

  Iterable<int> neighborsOf(int cell) sync* {
    final r = cell ~/ n;
    final c = cell % n;
    for (final d in _directions) {
      final nr = r + d[0];
      final nc = c + d[1];
      if (nr >= 0 && nr < m && nc >= 0 && nc < n) yield nr * n + nc;
    }
  }

  // Cells encoded as r * n + c, sorted from lowest to highest.
  final order = List<int>.generate(m * n, (i) => i)
    ..sort((a, b) => heightOf(a).compareTo(heightOf(b)));

  List<bool> drains(bool Function(int r, int c) isEdge) {
    final reached = List<bool>.filled(m * n, false);
    var i = 0;
    while (i < order.length) {
      final h = heightOf(order[i]);
      var j = i;
      while (j < order.length && heightOf(order[j]) == h) {
        j++;
      }
      // Seed edge cells, and cells that can flow to a lower cell that already drains.
      final stack = <int>[];
      for (final cell in order.sublist(i, j)) {
        final flowsDown = neighborsOf(cell)
            .any((nb) => heightOf(nb) < h && reached[nb]);
        if (isEdge(cell ~/ n, cell % n) || flowsDown) {
          reached[cell] = true;
          stack.add(cell);
        }
      }
      // Equal-height cells can flow into each other, so spread through them.
      while (stack.isNotEmpty) {
        final cell = stack.removeLast();
        for (final nb in neighborsOf(cell)) {
          if (!reached[nb] && heightOf(nb) == h) {
            reached[nb] = true;
            stack.add(nb);
          }
        }
      }
      i = j;
    }
    return reached;
  }

  final pacific = drains((r, c) => r == 0 || c == 0);
  final atlantic = drains((r, c) => r == m - 1 || c == n - 1);
  return [
    for (var cell = 0; cell < m * n; cell++)
      if (pacific[cell] && atlantic[cell]) [cell ~/ n, cell % n],
  ];
}
