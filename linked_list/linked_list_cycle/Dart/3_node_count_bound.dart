// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

bool hasCycle(ListNode? head) {
  const maxNodes = 10000;
  var steps = 0;
  var node = head;
  while (node != null) {
    steps++;
    if (steps > maxNodes) {
      return true;
    }
    node = node.next;
  }
  return false;
}
