class Node {
  int val;
  List<Node?> neighbors;
  Node([this.val = 0, List<Node?>? neighbors]) : neighbors = neighbors ?? [];
}

Node? cloneGraph(Node? node) {
  // No hash map: every lookup scans the list of (original, copy) pairs.
  final pairs = <(Node, Node)>[];

  Node? findCopy(Node? original) {
    for (final (seen, copy) in pairs) {
      if (identical(seen, original)) return copy;
    }
    return null;
  }

  Node? clone(Node? original) {
    if (original == null) return null;

    final existing = findCopy(original);
    if (existing != null) return existing;

    final copy = Node(original.val);
    pairs.add((original, copy));
    for (final neighbor in original.neighbors) {
      copy.neighbors.add(clone(neighbor));
    }
    return copy;
  }

  return clone(node);
}
