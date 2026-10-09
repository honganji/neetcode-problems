# Longest Increasing Path in a Matrix — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Topological Sort (Kahn's Algorithm) — `1_topological_sort`

Think of every move from a smaller cell to a larger neighbor as an arrow. Values only go up, so the arrows can never loop back. First, count how many arrows point into each cell. Cells with no arrows pointing in are where paths can start. Process those cells in layers: each layer is one more step along the longest paths. When a cell is handled, remove its outgoing arrows, and any cell left with no incoming arrows joins the next layer. The number of layers is the answer. It uses a queue instead of recursion, so a very long path cannot overflow the call stack. It has the same Big-O as #2, and it is listed first for that reason.

- Time: O(m · n), each cell is handled once and checks 4 neighbors
- Space: O(m · n) for the in-degree grid and the queue

## 2. Memoized DFS — `2_memoized_dfs`

For each cell, ask: what is the longest increasing path that starts here? It is 1 plus the best answer among the larger neighbors (or just 1 if there are none). The recursion asks that question for each neighbor in turn. A memo table saves each answer, so every cell is computed only once, even though many paths pass through the same cell. Without the memo, the same cells would be recomputed over and over. The final answer is the best value over all cells.

- Time: O(m · n), each cell is computed once and checks 4 neighbors
- Space: O(m · n) for the memo, plus up to O(m · n) recursion depth in the worst case (a snake-shaped path)

## 3. Sort Then DP — `3_sort_then_dp`

Sort all cells from smallest to largest value. When you reach a cell, every smaller neighbor has already been visited, so its best value is final. Set the cell's value to 1 plus the largest value among its smaller neighbors. The answer is the largest value found. The sorted order does the job that recursion or arrow counting did in the other two. It is the least efficient, because the sort adds a log factor.

- Time: O(m · n · log(m · n)), dominated by sorting the cells
- Space: O(m · n) for the cell list and the DP grid
