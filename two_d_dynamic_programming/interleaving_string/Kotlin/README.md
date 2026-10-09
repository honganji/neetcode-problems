# Interleaving String — Kotlin

Solutions ordered from most to least efficient. Let m = len(s1) and n = len(s2).
All three first reject inputs where m + n is not equal to len(s3), since then s3
cannot be built from s1 and s2 at all.

## 1. ⭐ Rolling 1D DP — `1_rolling_dp.kt`

Picture a grid where the row is how many characters of s1 have been used and the
column is how many of s2 have been used. A cell is reachable if the character it
adds matches s3 and the cell above or to the left was reachable. Each row only looks
at the row above it, so a single array can be reused, updated one cell at a time.

- Time: O(m · n)
- Space: O(n)

## 2. BFS over (i, j) states — `2_bfs.kt`

Treat each pair (i, j) as a point, meaning "i characters of s1 and j of s2 are used
so far". From a point you may move right by taking the next character of s1, or down
by taking the next character of s2, but only if it matches the next character of s3.
Start at (0, 0) and explore level by level with a queue, skipping any point already
seen. Reaching (m, n) means s3 is an interleaving. Only reachable points are visited,
so it often does less work than the full table, but in the worst case it visits all of them.

- Time: O(m · n)
- Space: O(m · n) for the seen set and the queue

## 3. Top-down recursion with memoization — `3_memo_dfs.kt`

Ask a question from each point: "can the rest of s3 be matched starting here?" To
answer, try taking the next character from s1, then from s2, and recurse on each. Store
every answer in a memo table so each point is solved only once. It uses the same
recurrence as #1, just computed from the top down, and the recursion goes at most m + n
levels deep.

- Time: O(m · n)
- Space: O(m · n) for the memo, plus O(m + n) for the recursion stack

_Note: the usual full 2D table is the same recurrence as #1 without reusing the row, so
it is not listed separately._
