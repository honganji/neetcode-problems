// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? reverseList(ListNode? head) {
  if (head == null || head.next == null) {
    return head;
  }
  final newHead = reverseList(head.next);
  head.next!.next = head;
  head.next = null;
  return newHead;
}
