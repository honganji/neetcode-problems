// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? mergeKLists(List<ListNode?> lists) {
  ListNode? mergeTwo(ListNode? a, ListNode? b) {
    final dummy = ListNode();
    var tail = dummy;
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

  ListNode? result;
  for (final head in lists) {
    result = mergeTwo(result, head);
  }
  return result;
}
