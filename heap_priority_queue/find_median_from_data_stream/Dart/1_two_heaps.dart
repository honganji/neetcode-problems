// A small binary heap. `less(a, b)` is true when a should come out first.
class _Heap {
  _Heap(this._less);

  final bool Function(int, int) _less;
  final List<int> _items = [];

  int get length => _items.length;
  int get first => _items[0];

  void add(int x) {
    _items.add(x);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (!_less(_items[i], _items[parent])) break;
      _swap(i, parent);
      i = parent;
    }
  }

  int removeFirst() {
    _swap(0, _items.length - 1);
    final result = _items.removeLast();
    var i = 0;
    while (true) {
      final left = 2 * i + 1;
      final right = left + 1;
      var best = i;
      if (left < _items.length && _less(_items[left], _items[best])) best = left;
      if (right < _items.length && _less(_items[right], _items[best])) best = right;
      if (best == i) break;
      _swap(i, best);
      i = best;
    }
    return result;
  }

  void _swap(int a, int b) {
    final t = _items[a];
    _items[a] = _items[b];
    _items[b] = t;
  }
}

class MedianFinder {
  // max-heap: the smaller half
  final _low = _Heap((a, b) => a > b);
  // min-heap: the larger half
  final _high = _Heap((a, b) => a < b);

  void addNum(int num) {
    // push into low, then move low's largest into high
    _low.add(num);
    _high.add(_low.removeFirst());
    // keep low the same size as high, or one bigger
    if (_high.length > _low.length) {
      _low.add(_high.removeFirst());
    }
  }

  double findMedian() {
    if (_low.length > _high.length) return _low.first.toDouble();
    return (_low.first + _high.first) / 2;
  }
}
