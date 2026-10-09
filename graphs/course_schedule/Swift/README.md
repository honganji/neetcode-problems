# Course Schedule — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Kahn's algorithm (BFS topological sort) — `1_kahn_bfs.swift`

Count how many prerequisites each course is still waiting on. Courses with zero waiting prerequisites can be taken right away, so put them in a queue. Taking a course "removes" it from the graph, which may free up the courses that depended on it. If every course eventually gets taken, there was no cycle. A cycle is exactly what blocks courses from ever reaching zero, so they never get taken.

- Time: O(V + E), where V is `numCourses` and E is the number of prerequisite pairs
- Space: O(V + E)

## 2. Iterative DFS with three colors — `2_dfs_cycle.swift`

Walk the graph depth-first. Each course is either unvisited, on the current path, or fully explored. If the walk reaches a course that is still on the current path, it has found a loop. Finishing a course without finding one means it can never be part of a cycle, so it is marked done and skipped next time. The stack is written out by hand, which keeps the code independent of call-stack depth.

- Time: O(V + E)
- Space: O(V + E)

## 3. Brute-force reachability — `3_bruteforce_reachability.swift`

For every course, search forward from it and check whether it can reach itself. If any course can, there is a cycle. This ignores the global structure and repeats a full search for each course, so it does far more work than the two above. It is still correct, and it is a useful first idea to compare against.

- Time: O(V × (V + E))
- Space: O(V + E)
