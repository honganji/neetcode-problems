// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  if (l1 == null) {
    return l2;
  }
  final head = l1;
  var prev = l1;
  var carry = 0;
  while (l1 != null && l2 != null) {
    final total = l1.val + l2.val + carry;
    l1.val = total % 10;
    carry = total ~/ 10;
    prev = l1;
    l1 = l1.next;
    l2 = l2.next;
  }
  if (l2 != null) {
    prev.next = l2;
    l1 = l2;
  }
  while (l1 != null) {
    final total = l1.val + carry;
    l1.val = total % 10;
    carry = total ~/ 10;
    prev = l1;
    l1 = l1.next;
  }
  if (carry != 0) {
    prev.next = ListNode(carry);
  }
  return head;
}
