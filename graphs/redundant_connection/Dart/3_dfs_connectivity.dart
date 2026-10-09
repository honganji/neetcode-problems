List<int> findRedundantConnection(List<List<int>> edges) {
  final n = edges.length;
  final adj = List.generate(n + 1, (_) => <int>[]);

  bool connected(int src, int dst) {
    final seen = List<bool>.filled(n + 1, false);
    final stack = <int>[src];
    seen[src] = true;
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node == dst) return true;
      for (final next in adj[node]) {
        if (!seen[next]) {
          seen[next] = true;
          stack.add(next);
        }
      }
    }
    return false;
  }

  for (final edge in edges) {
    // Already linked by earlier edges, so this one makes a loop.
    if (connected(edge[0], edge[1])) return edge;
    adj[edge[0]].add(edge[1]);
    adj[edge[1]].add(edge[0]);
  }

  return const [];
}
