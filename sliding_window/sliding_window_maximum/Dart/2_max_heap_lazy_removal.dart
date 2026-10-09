List<int> maxSlidingWindow(List<int> nums, int k) {
  // Max-heap of [value, index] pairs, ordered by value.
  final heap = <List<int>>[];

  void siftUp(int i) {
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (heap[parent][0] >= heap[i][0]) break;
      final tmp = heap[parent];
      heap[parent] = heap[i];
      heap[i] = tmp;
      i = parent;
    }
  }

  void siftDown(int i) {
    while (true) {
      final left = 2 * i + 1;
      final right = left + 1;
      var largest = i;
      if (left < heap.length && heap[left][0] > heap[largest][0]) {
        largest = left;
      }
      if (right < heap.length && heap[right][0] > heap[largest][0]) {
        largest = right;
      }
      if (largest == i) break;
      final tmp = heap[largest];
      heap[largest] = heap[i];
      heap[i] = tmp;
      i = largest;
    }
  }

  final result = <int>[];
  for (var i = 0; i < nums.length; i++) {
    heap.add([nums[i], i]);
    siftUp(heap.length - 1);
    if (i >= k - 1) {
      while (heap[0][1] <= i - k) {
        heap[0] = heap.removeLast();
        siftDown(0);
      }
      result.add(heap[0][0]);
    }
  }
  return result;
}
