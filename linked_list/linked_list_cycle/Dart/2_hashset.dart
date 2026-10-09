// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

bool hasCycle(ListNode? head) {
  final visited = <ListNode>{};
  var node = head;
  while (node != null) {
    if (visited.contains(node)) {
      return true;
    }
    visited.add(node);
    node = node.next;
  }
  return false;
}
