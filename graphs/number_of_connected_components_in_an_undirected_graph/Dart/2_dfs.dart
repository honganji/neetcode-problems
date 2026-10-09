class Solution {
  int countComponents(int n, List<List<int>> edges) {
    final graph = List<List<int>>.generate(n, (_) => []);
    for (final edge in edges) {
      graph[edge[0]].add(edge[1]);
      graph[edge[1]].add(edge[0]);
    }

    final visited = List<bool>.filled(n, false);
    var components = 0;
    for (var start = 0; start < n; start++) {
      if (visited[start]) continue;
      // Every unvisited node starts a new component.
      components++;
      visited[start] = true;
      final stack = <int>[start];
      while (stack.isNotEmpty) {
        final node = stack.removeLast();
        for (final neighbor in graph[node]) {
          if (!visited[neighbor]) {
            visited[neighbor] = true;
            stack.add(neighbor);
          }
        }
      }
    }

    return components;
  }
}
