class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    // Edge prerequisite -> course.
    final graph = List.generate(numCourses, (_) => <int>[]);
    for (final pair in prerequisites) {
      graph[pair[1]].add(pair[0]);
    }

    // A course is on a cycle if we can walk from it back to itself.
    bool reachesItself(int start) {
      final seen = <int>{};
      final stack = <int>[...graph[start]];
      while (stack.isNotEmpty) {
        final node = stack.removeLast();
        if (node == start) return true;
        if (!seen.add(node)) continue;
        stack.addAll(graph[node]);
      }
      return false;
    }

    for (var course = 0; course < numCourses; course++) {
      if (reachesItself(course)) return false;
    }
    return true;
  }
}
