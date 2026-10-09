import 'dart:collection';

class Node {
  int val;
  List<Node?> neighbors;
  Node([this.val = 0, List<Node?>? neighbors]) : neighbors = neighbors ?? [];
}

Node? cloneGraph(Node? node) {
  if (node == null) return null;

  final copies = <Node, Node>{node: Node(node.val)};
  final queue = Queue<Node>()..add(node);

  while (queue.isNotEmpty) {
    final current = queue.removeFirst();
    final currentCopy = copies[current]!;

    for (final neighbor in current.neighbors) {
      if (neighbor == null) continue;

      var neighborCopy = copies[neighbor];
      if (neighborCopy == null) {
        // First time we see this neighbor: make its copy and schedule it.
        neighborCopy = Node(neighbor.val);
        copies[neighbor] = neighborCopy;
        queue.add(neighbor);
      }
      currentCopy.neighbors.add(neighborCopy);
    }
  }

  return copies[node];
}
