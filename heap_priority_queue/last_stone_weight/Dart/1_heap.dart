int lastStoneWeight(List<int> stones) {
  final heap = _MaxHeap(stones);

  while (heap.length > 1) {
    final heaviest = heap.pop();
    final second = heap.pop();
    if (heaviest != second) {
      heap.push(heaviest - second);
    }
  }

  return heap.isEmpty ? 0 : heap.pop();
}

// Dart's core libraries have no priority queue, so here is a small binary max-heap.
class _MaxHeap {
  final List<int> _items = [];

  _MaxHeap(List<int> values) {
    for (final value in values) {
      push(value);
    }
  }

  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;

  void push(int value) {
    _items.add(value);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_items[parent] >= _items[i]) break;
      _swap(parent, i);
      i = parent;
    }
  }

  // Removes and returns the largest value. Call only when the heap is not empty.
  int pop() {
    final top = _items[0];
    final last = _items.removeLast();
    if (_items.isNotEmpty) {
      _items[0] = last;
      var i = 0;
      while (true) {
        final left = 2 * i + 1;
        final right = left + 1;
        var largest = i;
        if (left < _items.length && _items[left] > _items[largest]) largest = left;
        if (right < _items.length && _items[right] > _items[largest]) largest = right;
        if (largest == i) break;
        _swap(i, largest);
        i = largest;
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
