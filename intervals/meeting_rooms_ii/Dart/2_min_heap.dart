int minMeetingRooms(List<List<int>> intervals) {
  final sorted = [...intervals]..sort((a, b) => a[0].compareTo(b[0]));

  // Min-heap of end times for the rooms in use; the earliest end is always on top.
  final ends = _MinHeap();
  for (final meeting in sorted) {
    if (ends.isNotEmpty && ends.peek <= meeting[0]) {
      // The room that frees up first is free now, so reuse it.
      ends.pop();
    }
    ends.push(meeting[1]);
  }
  return ends.length;
}

// Dart's core library has no priority queue, so here is a small binary min-heap.
class _MinHeap {
  final List<int> _data = [];

  bool get isNotEmpty => _data.isNotEmpty;
  int get length => _data.length;
  int get peek => _data.first;

  void push(int value) {
    _data.add(value);
    var i = _data.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_data[parent] <= _data[i]) break;
      _swap(i, parent);
      i = parent;
    }
  }

  int pop() {
    final top = _data.first;
    final last = _data.removeLast();
    if (_data.isNotEmpty) {
      _data[0] = last;
      var i = 0;
      while (true) {
        final left = 2 * i + 1;
        final right = left + 1;
        var smallest = i;
        if (left < _data.length && _data[left] < _data[smallest]) smallest = left;
        if (right < _data.length && _data[right] < _data[smallest]) smallest = right;
        if (smallest == i) break;
        _swap(i, smallest);
        i = smallest;
      }
    }
    return top;
  }

  void _swap(int i, int j) {
    final temp = _data[i];
    _data[i] = _data[j];
    _data[j] = temp;
  }
}
