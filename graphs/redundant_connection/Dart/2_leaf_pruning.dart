import 'dart:collection';

List<int> findRedundantConnection(List<List<int>> edges) {
  final n = edges.length;
  final adj = List.generate(n + 1, (_) => <int>[]);
  final degree = List<int>.filled(n + 1, 0);
  for (final edge in edges) {
    adj[edge[0]].add(edge[1]);
    adj[edge[1]].add(edge[0]);
    degree[edge[0]]++;
    degree[edge[1]]++;
  }

  // Strip leaves (degree 1). Only the cycle nodes keep degree >= 2.
  final queue = Queue<int>();
  for (var i = 1; i <= n; i++) {
    if (degree[i] == 1) queue.add(i);
  }
  while (queue.isNotEmpty) {
    final node = queue.removeFirst();
    for (final next in adj[node]) {
      degree[next]--;
      if (degree[next] == 1) queue.add(next);
    }
  }

  // Edges between two cycle nodes are cycle edges; take the last one.
  for (final edge in edges.reversed) {
    if (degree[edge[0]] >= 2 && degree[edge[1]] >= 2) return edge;
  }

  return const [];
}
