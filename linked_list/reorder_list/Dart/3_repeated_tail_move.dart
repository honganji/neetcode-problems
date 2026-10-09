// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void reorderList(ListNode? head) {
  var current = head;
  while (current != null &&
      current.next != null &&
      current.next!.next != null) {
    var beforeTail = current;
    while (beforeTail.next!.next != null) {
      beforeTail = beforeTail.next!;
    }
    final tail = beforeTail.next!;
    beforeTail.next = null;
    tail.next = current.next;
    current.next = tail;
    current = tail.next;
  }
}
