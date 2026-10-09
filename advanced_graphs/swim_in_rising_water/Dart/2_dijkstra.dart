// Small binary min-heap of ints. dart:core has no priority queue.
class _MinHeap {
  final _items = <int>[];

  bool get isEmpty => _items.isEmpty;

  void push(int value) {
    _items.add(value);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_items[parent] <= _items[i]) break;
      _swap(parent, i);
      i = parent;
    }
  }

  int pop() {
    final top = _items.first;
    final last = _items.removeLast();
    if (_items.isNotEmpty) {
      _items[0] = last;
      var i = 0;
      while (true) {
        final left = 2 * i + 1;
        final right = left + 1;
        var smallest = i;
        if (left < _items.length && _items[left] < _items[smallest]) {
          smallest = left;
        }
        if (right < _items.length && _items[right] < _items[smallest]) {
          smallest = right;
        }
        if (smallest == i) break;
        _swap(i, smallest);
        i = smallest;
      }
    }
    return top;
  }

  void _swap(int a, int b) {
    final tmp = _items[a];
    _items[a] = _items[b];
    _items[b] = tmp;
  }
}

int swimInWater(List<List<int>> grid) {
  final n = grid.length;
  final total = n * n;
  // Lowest time needed to reach each cell so far. total is above every height.
  final best = List<int>.filled(total, total);
  best[0] = grid[0][0];
  // Heap entries encode (time, cell) as time * total + cell, so one int is enough.
  final heap = _MinHeap()..push(grid[0][0] * total);
  const dr = [1, -1, 0, 0];
  const dc = [0, 0, 1, -1];

  while (!heap.isEmpty) {
    final top = heap.pop();
    final t = top ~/ total;
    final cell = top % total;
    if (t > best[cell]) continue; // stale entry, a better one was already processed
    if (cell == total - 1) return t;

    final r = cell ~/ n;
    final c = cell % n;
    for (var k = 0; k < 4; k++) {
      final nr = r + dr[k];
      final nc = c + dc[k];
      if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
        final next = nr * n + nc;
        // Reaching the neighbor takes as long as the larger of our time and its height.
        final nt = t > grid[nr][nc] ? t : grid[nr][nc];
        if (nt < best[next]) {
          best[next] = nt;
          heap.push(nt * total + next);
        }
      }
    }
  }
  return -1;
}
