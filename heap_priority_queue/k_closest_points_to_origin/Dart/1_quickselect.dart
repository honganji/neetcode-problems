import 'dart:math';

final _random = Random();

List<List<int>> kClosest(List<List<int>> points, int k) {
  int dist(List<int> p) => p[0] * p[0] + p[1] * p[1];

  var left = 0;
  var right = points.length - 1;
  while (left <= right) {
    // Pick a random pivot and move it to the end of the range.
    final pivotIdx = left + _random.nextInt(right - left + 1);
    final pivot = dist(points[pivotIdx]);
    _swap(points, pivotIdx, right);

    // Move every point closer than the pivot to the front of the range.
    var store = left;
    for (var i = left; i < right; i++) {
      if (dist(points[i]) < pivot) {
        _swap(points, store, i);
        store++;
      }
    }

    // The pivot is now in its final place; everything before it is closer.
    _swap(points, store, right);

    if (store == k) break;
    if (store < k) {
      left = store + 1;
    } else {
      right = store - 1;
    }
  }
  return points.sublist(0, k);
}

void _swap(List<List<int>> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}
