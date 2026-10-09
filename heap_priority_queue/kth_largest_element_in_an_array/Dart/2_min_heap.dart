int findKthLargest(List<int> nums, int k) {
  // Min-heap (stored in a list) that keeps only the k largest values seen so far.
  // Its smallest item at index 0 is the kth largest overall.
  final heap = <int>[];
  for (final num in nums) {
    heap.add(num);
    _siftUp(heap, heap.length - 1);
    if (heap.length > k) {
      // Remove the smallest (root): move the last item to the root and sift it down.
      _swap(heap, 0, heap.length - 1);
      heap.removeLast();
      _siftDown(heap, 0);
    }
  }
  return heap[0];
}

void _siftUp(List<int> heap, int index) {
  var i = index;
  while (i > 0) {
    final parent = (i - 1) ~/ 2;
    if (heap[parent] <= heap[i]) break;
    _swap(heap, parent, i);
    i = parent;
  }
}

void _siftDown(List<int> heap, int index) {
  var i = index;
  while (true) {
    final left = 2 * i + 1;
    final right = left + 1;
    var smallest = i;
    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }
    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }
    if (smallest == i) break;
    _swap(heap, i, smallest);
    i = smallest;
  }
}

void _swap(List<int> a, int i, int j) {
  final t = a[i];
  a[i] = a[j];
  a[j] = t;
}
