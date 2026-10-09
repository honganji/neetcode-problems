// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  var length = 0;
  var node = head;
  while (node != null) {
    length++;
    node = node.next;
  }
  final dummy = ListNode(0, head);
  var prev = dummy;
  for (var i = 0; i < length - n; i++) {
    prev = prev.next!;
  }
  prev.next = prev.next!.next;
  return dummy.next;
}
