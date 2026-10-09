// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? reverseList(ListNode? head) {
  final values = <int>[];
  var node = head;
  while (node != null) {
    values.add(node.val);
    node = node.next;
  }
  final dummy = ListNode();
  var tail = dummy;
  for (var i = values.length - 1; i >= 0; i--) {
    tail.next = ListNode(values[i]);
    tail = tail.next!;
  }
  return dummy.next;
}
