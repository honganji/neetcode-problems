// LeetCode provides this definition.
class Node {
  int val;
  Node? next;
  Node? random;
  Node(this.val, [this.next, this.random]);
}

Node? copyRandomList(Node? head) {
  if (head == null) {
    return null;
  }
  Node? node = head;
  while (node != null) {
    final copy = Node(node.val, node.next);
    node.next = copy;
    node = copy.next;
  }
  node = head;
  while (node != null) {
    if (node.random != null) {
      node.next!.random = node.random!.next;
    }
    node = node.next!.next;
  }
  final newHead = head.next;
  node = head;
  while (node != null) {
    final copy = node.next!;
    node.next = copy.next;
    if (copy.next != null) {
      copy.next = copy.next!.next;
    }
    node = node.next;
  }
  return newHead;
}
