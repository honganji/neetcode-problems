List<List<int>> kClosest(List<List<int>> points, int k) {
  // Max-heap of points by distance: the farthest point sits at index 0.
  final heap = <List<int>>[];
  for (final p in points) {
    if (heap.length < k) {
      heap.add(p);
      _siftUp(heap, heap.length - 1);
    } else if (_dist(p) < _dist(heap[0])) {
      // Closer than the farthest kept point, so it replaces that one.
      heap[0] = p;
      _siftDown(heap, 0);
    }
  }
  return heap;
}

int _dist(List<int> p) => p[0] * p[0] + p[1] * p[1];

void _siftUp(List<List<int>> heap, int start) {
  var i = start;
  while (i > 0) {
    final parent = (i - 1) ~/ 2;
    if (_dist(heap[i]) <= _dist(heap[parent])) break;
    _swap(heap, i, parent);
    i = parent;
  }
}

void _siftDown(List<List<int>> heap, int start) {
  var i = start;
  while (true) {
    final left = 2 * i + 1;
    final right = left + 1;
    var largest = i;
    if (left < heap.length && _dist(heap[left]) > _dist(heap[largest])) {
      largest = left;
    }
    if (right < heap.length && _dist(heap[right]) > _dist(heap[largest])) {
      largest = right;
    }
    if (largest == i) break;
    _swap(heap, i, largest);
    i = largest;
  }
}

void _swap(List<List<int>> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}
