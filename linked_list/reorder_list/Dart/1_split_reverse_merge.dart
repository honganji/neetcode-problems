// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void reorderList(ListNode? head) {
  if (head == null || head.next == null) return;

  ListNode slow = head;
  ListNode fast = head;
  while (fast.next != null && fast.next!.next != null) {
    slow = slow.next!;
    fast = fast.next!.next!;
  }

  ListNode? second = slow.next;
  slow.next = null;
  ListNode? prev;
  while (second != null) {
    final nxt = second.next;
    second.next = prev;
    prev = second;
    second = nxt;
  }

  ListNode? first = head;
  second = prev;
  while (second != null) {
    final firstNext = first!.next;
    final secondNext = second.next;
    first.next = second;
    second.next = firstNext;
    first = firstNext;
    second = secondNext;
  }
}
