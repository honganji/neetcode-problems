List<int> topKFrequent(List<int> nums, int k) {
  final counts = <int, int>{};
  for (final num in nums) {
    counts[num] = (counts[num] ?? 0) + 1;
  }

  // Min-heap of [freq, num] pairs, ordered by freq.
  final heap = <List<int>>[];

  void siftUp(int i) {
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (heap[parent][0] <= heap[i][0]) break;
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
      var smallest = i;
      if (left < heap.length && heap[left][0] < heap[smallest][0]) {
        smallest = left;
      }
      if (right < heap.length && heap[right][0] < heap[smallest][0]) {
        smallest = right;
      }
      if (smallest == i) break;
      final tmp = heap[smallest];
      heap[smallest] = heap[i];
      heap[i] = tmp;
      i = smallest;
    }
  }

  counts.forEach((num, freq) {
    heap.add([freq, num]);
    siftUp(heap.length - 1);
    if (heap.length > k) {
      heap[0] = heap.removeLast();
      siftDown(0);
    }
  });

  return [for (final pair in heap) pair[1]];
}
