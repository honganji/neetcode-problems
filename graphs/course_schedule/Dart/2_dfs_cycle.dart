class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    final graph = List.generate(numCourses, (_) => <int>[]);
    for (final pair in prerequisites) {
      graph[pair[0]].add(pair[1]);
    }

    // 0 = not visited, 1 = on the current DFS path, 2 = fully explored
    final state = List.filled(numCourses, 0);
    final nextEdge = List.filled(numCourses, 0); // next prerequisite to check per course

    // Iterative DFS with an explicit stack.
    for (var start = 0; start < numCourses; start++) {
      if (state[start] != 0) continue;
      state[start] = 1;
      final stack = <int>[start];
      while (stack.isNotEmpty) {
        final node = stack.last;
        if (nextEdge[node] < graph[node].length) {
          final next = graph[node][nextEdge[node]];
          nextEdge[node]++;
          if (state[next] == 1) return false; // back edge to the current path -> cycle
          if (state[next] == 0) {
            state[next] = 1;
            stack.add(next);
          }
        } else {
          state[node] = 2;
          stack.removeLast();
        }
      }
    }
    return true;
  }
}
