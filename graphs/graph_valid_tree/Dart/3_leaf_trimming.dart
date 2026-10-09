import 'dart:collection';

class Solution {
  bool validTree(int n, List<List<int>> edges) {
    if (edges.length != n - 1) return false;

    final adj = List.generate(n, (_) => <int>[]);
    final degree = List<int>.filled(n, 0);
    for (final edge in edges) {
      adj[edge[0]].add(edge[1]);
      adj[edge[1]].add(edge[0]);
      degree[edge[0]]++;
      degree[edge[1]]++;
    }

    // Repeatedly strip leaves (degree <= 1). A tree gets fully stripped;
    // a cycle keeps its nodes at degree >= 2 forever.
    final queue = Queue<int>();
    for (var i = 0; i < n; i++) {
      if (degree[i] <= 1) queue.add(i);
    }

    final removed = List<bool>.filled(n, false);
    var removedCount = 0;
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      removed[node] = true;
      removedCount++;
      for (final nei in adj[node]) {
        if (!removed[nei]) {
          degree[nei]--;
          if (degree[nei] == 1) queue.add(nei);
        }
      }
    }

    return removedCount == n;
  }
}
