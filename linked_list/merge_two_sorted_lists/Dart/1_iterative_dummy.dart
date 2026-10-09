// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  final dummy = ListNode();
  var tail = dummy;
  var a = list1;
  var b = list2;
  while (a != null && b != null) {
    if (a.val <= b.val) {
      tail.next = a;
      a = a.next;
    } else {
      tail.next = b;
      b = b.next;
    }
    tail = tail.next!;
  }
  tail.next = a ?? b;
  return dummy.next;
}
