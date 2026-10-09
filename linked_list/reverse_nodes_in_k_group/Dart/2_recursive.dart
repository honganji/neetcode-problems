// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? reverseKGroup(ListNode? head, int k) {
  var node = head;
  var count = 0;
  while (node != null && count < k) {
    node = node.next;
    count++;
  }
  if (count < k) {
    return head;
  }

  ListNode? prev;
  var curr = head;
  for (var i = 0; i < k; i++) {
    final nxt = curr!.next;
    curr!.next = prev;
    prev = curr;
    curr = nxt;
  }

  head!.next = reverseKGroup(curr, k);
  return prev;
}
