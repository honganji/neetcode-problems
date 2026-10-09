// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode? add(ListNode? a, ListNode? b, int carry) {
    if (a == null && b == null && carry == 0) {
      return null;
    }
    var total = carry;
    if (a != null) {
      total += a.val;
      a = a.next;
    }
    if (b != null) {
      total += b.val;
      b = b.next;
    }
    return ListNode(total % 10, add(a, b, total ~/ 10));
  }

  return add(l1, l2, 0);
}
