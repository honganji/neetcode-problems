// LeetCode provides this definition.
class Node {
  int val;
  Node? next;
  Node? random;
  Node(this.val, [this.next, this.random]);
}

Node? copyRandomList(Node? head) {
  final memo = <Node, Node>{};

  Node? copy(Node? node) {
    if (node == null) {
      return null;
    }
    final seen = memo[node];
    if (seen != null) {
      return seen;
    }
    final clone = Node(node.val);
    memo[node] = clone;
    clone.next = copy(node.next);
    clone.random = copy(node.random);
    return clone;
  }

  return copy(head);
}
