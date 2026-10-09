// LeetCode provides this definition.
class Node {
  int val;
  Node? next;
  Node? random;
  Node(this.val, [this.next, this.random]);
}

Node? copyRandomList(Node? head) {
  final copies = <Node, Node>{};
  var node = head;
  while (node != null) {
    copies[node] = Node(node.val);
    node = node.next;
  }
  node = head;
  while (node != null) {
    final copy = copies[node]!;
    copy.next = copies[node.next];
    copy.random = copies[node.random];
    node = node.next;
  }
  return copies[head];
}
