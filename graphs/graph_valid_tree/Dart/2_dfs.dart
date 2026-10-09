class Solution {
  bool validTree(int n, List<List<int>> edges) {
    if (edges.length != n - 1) return false;

    final adj = List.generate(n, (_) => <int>[]);
    for (final edge in edges) {
      adj[edge[0]].add(edge[1]);
      adj[edge[1]].add(edge[0]);
    }

    // Iterative DFS: each stack entry is [node, parent it was reached from].
    final visited = List<bool>.filled(n, false);
    final stack = <List<int>>[
      [0, -1],
    ];
    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      final node = current[0];
      final parent = current[1];
      if (visited[node]) return false; // reached twice, so there is a cycle
      visited[node] = true;
      for (final nei in adj[node]) {
        if (nei != parent) {
          stack.add([nei, node]);
        }
      }
    }

    // Every node must be reachable from node 0.
    return !visited.contains(false);
  }
}
