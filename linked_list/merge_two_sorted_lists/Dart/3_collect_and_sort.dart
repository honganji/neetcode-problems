// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  final values = <int>[];
  for (final head in [list1, list2]) {
    var node = head;
    while (node != null) {
      values.add(node.val);
      node = node.next;
    }
  }
  values.sort();
  final dummy = ListNode();
  var tail = dummy;
  for (final val in values) {
    tail.next = ListNode(val);
    tail = tail.next!;
  }
  return dummy.next;
}
