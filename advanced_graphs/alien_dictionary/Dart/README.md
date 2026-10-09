# Alien Dictionary — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Kahn's algorithm (BFS topological sort) — `1_kahn.dart`

Think of each rule "x comes before y" as an arrow from x to y. Count how many arrows point into each letter. A letter with zero arrows pointing into it has nothing blocking it, so it can go next. Take it out, remove its outgoing arrows, and any letter that becomes free joins the queue. If every letter gets output, that output is a valid order. If some letters never get free, they are waiting on each other in a loop, so no order exists.

- Time: O(C), where C is the total number of characters in all words (the 26×26 grid work is a constant)
- Space: O(1) (a fixed 26×26 grid)

## 2. DFS topological sort — `2_dfs.dart`

Walk the arrows depth-first. A letter is marked "finished" only after every letter it points to is finished, so the finish order is the reverse of a valid answer. Reverse that list at the end. While walking, if we reach a letter that is still on the current path, we have found a loop, so return `""`. This has the same complexity as idea 1; it is ranked second because it relies on recursion and needs the extra "on the path" bookkeeping.

- Time: O(C), where C is the total number of characters in all words (the 26×26 grid work is a constant)
- Space: O(1) (a fixed 26×26 grid, plus recursion depth of at most 26)

## 3. Transitive closure + counting predecessors — `3_closure.dart`

Instead of peeling or walking, first work out for every pair of letters whether one must come before the other, including indirectly (if a comes before b and b comes before c, then a comes before c). Floyd–Warshall does this in 26×26×26 steps. If any letter must come before itself, there is a loop. Otherwise, a letter that comes later always has strictly more letters forced before it, so sorting the letters by "how many letters must come before me" gives a valid order. This is the slowest of the three because of the extra 26³ work, but the idea is different from the other two.

- Time: O(C + 26³), which is O(C) with a fixed constant
- Space: O(1) (a fixed 26×26 grid)
