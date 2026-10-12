const maxCoord = 1000;

class DetectSquares {
  final Map<(int, int), int> _counts = {};

  void add(List<int> point) {
    final key = (point[0], point[1]);
    _counts[key] = (_counts[key] ?? 0) + 1;
  }

  int count(List<int> point) {
    final x = point[0];
    final y = point[1];
    var total = 0;
    // The query point is one corner. Try every side length d and every
    // direction (dx, dy) the square can extend in from the query point.
    for (var d = 1; d <= maxCoord; d++) {
      for (final dx in [d, -d]) {
        for (final dy in [d, -d]) {
          // Opposite corner, plus the two corners that touch the query point.
          final diag = _counts[(x + dx, y + dy)] ?? 0;
          if (diag == 0) continue;
          total += diag *
              (_counts[(x + dx, y)] ?? 0) *
              (_counts[(x, y + dy)] ?? 0);
        }
      }
    }
    return total;
  }
}
