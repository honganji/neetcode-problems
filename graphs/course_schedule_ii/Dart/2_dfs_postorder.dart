class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    final nextCourses = List.generate(numCourses, (_) => <int>[]);
    for (final pair in prerequisites) {
      nextCourses[pair[1]].add(pair[0]);
    }

    // 0 = unvisited, 1 = on the current path, 2 = finished
    final state = List.filled(numCourses, 0);
    final order = <int>[]; // a course is added after every course that depends on it

    bool dfs(int course) {
      if (state[course] == 1) return false; // back to the current path -> cycle
      if (state[course] == 2) return true;
      state[course] = 1;
      for (final next in nextCourses[course]) {
        if (!dfs(next)) return false;
      }
      state[course] = 2;
      order.add(course);
      return true;
    }

    for (var c = 0; c < numCourses; c++) {
      if (!dfs(c)) return [];
    }
    // Reversed post-order puts prerequisites before the courses that need them
    return order.reversed.toList();
  }
}
