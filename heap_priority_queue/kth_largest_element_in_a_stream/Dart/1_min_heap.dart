class KthLargest {
  final int k;
  // Min-heap holding only the k largest values seen so far.
  // Its root is the smallest of them, which is the kth largest overall.
  final List<int> _heap = [];

  KthLargest(this.k, List<int> nums) {
    for (final num in nums) {
      _offer(num);
    }
  }

  int add(int val) {
    _offer(val);
    return _heap[0];
  }

  void _offer(int val) {
    if (_heap.length < k) {
      _heap.add(val);
      _siftUp(_heap.length - 1);
    } else if (val > _heap[0]) {
      // Replace the smallest of the top k with the new, larger value.
      _heap[0] = val;
      _siftDown(0);
    }
  }

  void _siftUp(int index) {
    var i = index;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_heap[parent] <= _heap[i]) break;
      _swap(parent, i);
      i = parent;
    }
  }

  void _siftDown(int index) {
    var i = index;
    while (true) {
      final left = 2 * i + 1;
      final right = left + 1;
      var smallest = i;
      if (left < _heap.length && _heap[left] < _heap[smallest]) smallest = left;
      if (right < _heap.length && _heap[right] < _heap[smallest]) smallest = right;
      if (smallest == i) break;
      _swap(i, smallest);
      i = smallest;
    }
  }

  void _swap(int a, int b) {
    final tmp = _heap[a];
    _heap[a] = _heap[b];
    _heap[b] = tmp;
  }
}
