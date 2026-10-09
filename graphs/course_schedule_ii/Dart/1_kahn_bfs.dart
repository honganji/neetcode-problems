import 'dart:collection';

class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    // nextCourses[p] = courses that get one step closer to unlocked once p is taken
    final nextCourses = List.generate(numCourses, (_) => <int>[]);
    final indegree = List.filled(numCourses, 0); // unfinished prerequisites per course
    for (final pair in prerequisites) {
      final course = pair[0];
      final prereq = pair[1];
      nextCourses[prereq].add(course);
      indegree[course]++;
    }

    final queue = Queue<int>();
    for (var c = 0; c < numCourses; c++) {
      if (indegree[c] == 0) queue.add(c);
    }

    final order = <int>[];
    while (queue.isNotEmpty) {
      final course = queue.removeFirst();
      order.add(course);
      for (final next in nextCourses[course]) {
        indegree[next]--;
        if (indegree[next] == 0) queue.add(next);
      }
    }

    // Courses left out are stuck in a cycle
    return order.length == numCourses ? order : [];
  }
}
