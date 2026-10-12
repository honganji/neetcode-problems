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
    // Treat each stored point as the corner opposite the query point.
    // It only works if it lies on the same diagonal (equal distance in x and y).
    for (final entry in _counts.entries) {
      final (px, py) = entry.key;
      final dx = (px - x).abs();
      if (dx == 0 || dx != (py - y).abs()) continue;
      total += entry.value *
          (_counts[(x, py)] ?? 0) *
          (_counts[(px, y)] ?? 0);
    }
    return total;
  }
}
