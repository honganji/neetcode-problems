// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void reorderList(ListNode? head) {
  final nodes = <ListNode>[];
  var node = head;
  while (node != null) {
    nodes.add(node);
    node = node.next;
  }
  if (nodes.isEmpty) return;

  var left = 0;
  var right = nodes.length - 1;
  while (left < right) {
    nodes[left].next = nodes[right];
    left++;
    if (left == right) break;
    nodes[right].next = nodes[left];
    right--;
  }
  nodes[left].next = null;
}
