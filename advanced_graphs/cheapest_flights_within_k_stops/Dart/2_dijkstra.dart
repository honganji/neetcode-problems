class _State {
  final int cost, city, used;
  _State(this.cost, this.city, this.used);
}

// Minimal binary min-heap ordered by cost.
class _MinHeap {
  final List<_State> _items = [];

  bool get isEmpty => _items.isEmpty;

  void push(_State item) {
    _items.add(item);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_items[parent].cost <= _items[i].cost) break;
      _swap(parent, i);
      i = parent;
    }
  }

  _State pop() {
    _swap(0, _items.length - 1);
    final top = _items.removeLast();
    var i = 0;
    while (true) {
      final left = 2 * i + 1, right = left + 1;
      var smallest = i;
      if (left < _items.length && _items[left].cost < _items[smallest].cost) {
        smallest = left;
      }
      if (right < _items.length && _items[right].cost < _items[smallest].cost) {
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

class Solution {
  int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
    const unreachable = 1 << 60;
    final graph = List.generate(n, (_) => <List<int>>[]);
    for (final flight in flights) {
      graph[flight[0]].add([flight[1], flight[2]]);
    }

    final heap = _MinHeap()..push(_State(0, src, 0));

    // Track flights used too, so a cheap route with too many stops
    // does not hide a pricier route that is still allowed.
    // bestCost[city][used] = cheapest known cost to reach city with exactly `used` flights.
    final bestCost = List.generate(n, (_) => List<int>.filled(k + 2, unreachable));
    bestCost[src][0] = 0;

    while (!heap.isEmpty) {
      final current = heap.pop();
      if (current.city == dst) return current.cost;
      if (current.used == k + 1) continue;

      for (final edge in graph[current.city]) {
        final to = edge[0];
        final newCost = current.cost + edge[1];
        if (newCost < bestCost[to][current.used + 1]) {
          bestCost[to][current.used + 1] = newCost;
          heap.push(_State(newCost, to, current.used + 1));
        }
      }
    }

    return -1;
  }
}
