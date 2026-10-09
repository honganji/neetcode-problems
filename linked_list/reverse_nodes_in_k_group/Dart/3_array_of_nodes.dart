// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? reverseKGroup(ListNode? head, int k) {
  final nodes = <ListNode>[];
  var node = head;
  while (node != null) {
    nodes.add(node);
    node = node.next;
  }

  final fullEnd = nodes.length - nodes.length % k;
  for (var start = 0; start < fullEnd; start += k) {
    var lo = start;
    var hi = start + k - 1;
    while (lo < hi) {
      final tmp = nodes[lo];
      nodes[lo] = nodes[hi];
      nodes[hi] = tmp;
      lo++;
      hi--;
    }
  }

  for (var i = 0; i + 1 < nodes.length; i++) {
    nodes[i].next = nodes[i + 1];
  }
  if (nodes.isEmpty) {
    return null;
  }
  nodes.last.next = null;
  return nodes.first;
}
