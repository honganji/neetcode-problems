// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  final dummy = ListNode(0, head);
  ListNode? fast = dummy;
  var slow = dummy;
  for (var i = 0; i < n + 1; i++) {
    fast = fast!.next;
  }
  while (fast != null) {
    fast = fast.next;
    slow = slow.next!;
  }
  slow.next = slow.next!.next;
  return dummy.next;
}
