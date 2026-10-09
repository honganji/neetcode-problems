// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  final dummy = ListNode();
  var tail = dummy;
  var carry = 0;
  while (l1 != null || l2 != null || carry != 0) {
    var total = carry;
    if (l1 != null) {
      total += l1.val;
      l1 = l1.next;
    }
    if (l2 != null) {
      total += l2.val;
      l2 = l2.next;
    }
    carry = total ~/ 10;
    tail.next = ListNode(total % 10);
    tail = tail.next!;
  }
  return dummy.next;
}
