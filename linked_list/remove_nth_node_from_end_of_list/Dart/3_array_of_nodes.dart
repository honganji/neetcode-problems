// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  final nodes = <ListNode>[];
  var node = head;
  while (node != null) {
    nodes.add(node);
    node = node.next;
  }
  final index = nodes.length - n;
  if (index == 0) {
    return head!.next;
  }
  nodes[index - 1].next = nodes[index].next;
  return head;
}
