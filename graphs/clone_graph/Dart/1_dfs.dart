class Node {
  int val;
  List<Node?> neighbors;
  Node([this.val = 0, List<Node?>? neighbors]) : neighbors = neighbors ?? [];
}

Node? cloneGraph(Node? node) {
  final copies = <Node, Node>{};

  Node? clone(Node? original) {
    if (original == null) return null;

    final existing = copies[original];
    if (existing != null) return existing;

    // Register the copy before visiting neighbors, so cycles stop here.
    final copy = Node(original.val);
    copies[original] = copy;
    for (final neighbor in original.neighbors) {
      copy.neighbors.add(clone(neighbor));
    }
    return copy;
  }

  return clone(node);
}
