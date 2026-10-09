class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    final prereqs = List.generate(numCourses, (_) => <int>[]);
    for (final pair in prerequisites) {
      prereqs[pair[0]].add(pair[1]);
    }

    final taken = List.filled(numCourses, false);
    final order = <int>[];
    while (order.length < numCourses) {
      var progress = false;
      for (var course = 0; course < numCourses; course++) {
        if (!taken[course] && prereqs[course].every((p) => taken[p])) {
          taken[course] = true;
          order.add(course);
          progress = true;
        }
      }
      // Nothing could be taken, so every remaining course waits on another one -> cycle
      if (!progress) return [];
    }
    return order;
  }
}
