import 'dart:collection';

class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    final graph = List.generate(numCourses, (_) => <int>[]);
    final indegree = List.filled(numCourses, 0); // prerequisites each course still waits on
    for (final pair in prerequisites) {
      graph[pair[1]].add(pair[0]);
      indegree[pair[0]]++;
    }

    // Start with courses that have no prerequisites.
    final queue = Queue<int>.from([
      for (var i = 0; i < numCourses; i++)
        if (indegree[i] == 0) i,
    ]);
    var finished = 0;
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      finished++;
      for (final next in graph[node]) {
        indegree[next]--;
        if (indegree[next] == 0) queue.add(next);
      }
    }

    // Courses in a cycle never reach zero prerequisites, so they are never taken.
    return finished == numCourses;
  }
}
