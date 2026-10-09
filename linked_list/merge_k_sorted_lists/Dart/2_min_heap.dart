// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? mergeKLists(List<ListNode?> lists) {
  // Min-heap of nodes, ordered by val.
  final heap = <ListNode>[];

  void siftUp(int i) {
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (heap[parent].val <= heap[i].val) break;
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
      if (left < heap.length && heap[left].val < heap[smallest].val) {
        smallest = left;
      }
      if (right < heap.length && heap[right].val < heap[smallest].val) {
        smallest = right;
      }
      if (smallest == i) break;
      final tmp = heap[smallest];
      heap[smallest] = heap[i];
      heap[i] = tmp;
      i = smallest;
    }
  }

  void push(ListNode node) {
    heap.add(node);
    siftUp(heap.length - 1);
  }

  ListNode pop() {
    final top = heap[0];
    final last = heap.removeLast();
    if (heap.isNotEmpty) {
      heap[0] = last;
      siftDown(0);
    }
    return top;
  }

  for (final head in lists) {
    if (head != null) push(head);
  }

  final dummy = ListNode();
  var tail = dummy;
  while (heap.isNotEmpty) {
    final node = pop();
    tail.next = node;
    tail = node;
    final next = node.next;
    if (next != null) push(next);
  }
  return dummy.next;
}
