class Solution {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    final graph = List.generate(n + 1, (_) => <List<int>>[]);
    for (final t in times) {
      graph[t[0]].add([t[1], t[2]]); // [to, weight]
    }

    const inf = 1 << 30;
    final dist = List<int>.filled(n + 1, inf);
    dist[k] = 0;

    // Min-heap of [time, node], smallest time first.
    final heap = _MinHeap();
    heap.push([0, k]);

    while (heap.isNotEmpty) {
      final top = heap.pop();
      final d = top[0];
      final u = top[1];
      if (d > dist[u]) continue; // stale entry

      for (final edge in graph[u]) {
        final v = edge[0];
        final w = edge[1];
        if (d + w < dist[v]) {
          dist[v] = d + w;
          heap.push([dist[v], v]);
        }
      }
    }

    final answer = dist.skip(1).reduce((a, b) => a > b ? a : b);
    return answer == inf ? -1 : answer;
  }
}

class _MinHeap {
  final List<List<int>> _items = [];

  bool get isNotEmpty => _items.isNotEmpty;

  void push(List<int> item) {
    _items.add(item);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_items[parent][0] <= _items[i][0]) break;
      _swap(parent, i);
      i = parent;
    }
  }

  List<int> pop() {
    _swap(0, _items.length - 1);
    final top = _items.removeLast();
    var i = 0;
    while (true) {
      final left = 2 * i + 1;
      final right = left + 1;
      var smallest = i;
      if (left < _items.length && _items[left][0] < _items[smallest][0]) {
        smallest = left;
      }
      if (right < _items.length && _items[right][0] < _items[smallest][0]) {
        smallest = right;
      }
      if (smallest == i) break;
      _swap(i, smallest);
      i = smallest;
    }
    return top;
  }

  void _swap(int a, int b) {
    final tmp = _items[a];
    _items[a] = _items[b];
    _items[b] = tmp;
  }
}
