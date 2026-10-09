# Course Schedule II — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Kahn's algorithm (BFS topological sort) — `1_kahn_bfs.swift`

Courses with no prerequisites can be taken right away. Count how many unfinished prerequisites each course has. Take a course whose count is 0, then lower the count of every course that depends on it. Any course whose count reaches 0 joins the queue. If all courses get taken, the order is valid. If some never reach 0, they are stuck in a cycle, so return `[]`.

- Time: O(V + E)
- Space: O(V + E)

## 2. DFS post-order (cycle detection) — `2_dfs_postorder.swift`

Walk from each course toward the courses that depend on it. A course is added to the list only after everything that depends on it is already added. Reversing that list puts prerequisites first. While walking, mark courses on the current path. If the walk reaches a course that is still on the path, there is a cycle.

- Time: O(V + E)
- Space: O(V + E)

## 3. Repeated scan (fixed-point loop) — `3_repeated_scan.swift`

Keep looping over all courses. Take any course whose prerequisites have all been taken. If a full pass takes nothing while courses are still left, the remaining courses are waiting on each other in a cycle, so return `[]`. This is the simplest idea, but on a long chain listed in the wrong order it makes many passes over the same courses.

- Time: O(V × (V + E))
- Space: O(V + E)
