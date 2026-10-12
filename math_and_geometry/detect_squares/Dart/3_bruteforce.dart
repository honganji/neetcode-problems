class DetectSquares {
  final List<(int, int)> _points = [];

  void add(List<int> point) {
    _points.add((point[0], point[1]));
  }

  int count(List<int> point) {
    final x = point[0];
    final y = point[1];
    var total = 0;
    // Each stored point is a candidate for the corner opposite the query point.
    // Find the other two corners by scanning the whole list.
    for (final (px, py) in _points) {
      if (px == x || (px - x).abs() != (py - y).abs()) continue;
      final corner1 = (x, py);
      final corner2 = (px, y);
      total += _points.where((p) => p == corner1).length *
          _points.where((p) => p == corner2).length;
    }
    return total;
  }
}
