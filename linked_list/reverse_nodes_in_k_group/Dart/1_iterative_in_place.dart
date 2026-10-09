// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? reverseKGroup(ListNode? head, int k) {
  final dummy = ListNode(0, head);
  var groupPrev = dummy;

  while (true) {
    ListNode? kth = groupPrev;
    for (var i = 0; i < k; i++) {
      kth = kth!.next;
      if (kth == null) {
        return dummy.next;
      }
    }
    final groupNext = kth!.next;

    ListNode? prev = groupNext;
    ListNode? curr = groupPrev.next;
    while (!identical(curr, groupNext)) {
      final nxt = curr!.next;
      curr!.next = prev;
      prev = curr;
      curr = nxt;
    }

    final first = groupPrev.next!;
    groupPrev.next = kth;
    groupPrev = first;
  }
}
