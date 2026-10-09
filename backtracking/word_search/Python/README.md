# Word Search — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking with in-place marking and pruning — `1_backtracking_inplace.py`

Try starting the word from every cell. At each step, check that the current cell has the next letter, then recurse into its four neighbors. To avoid reusing a cell, overwrite it with a placeholder while it is on the current path and restore it when the recursion returns. Two quick checks cut down the work: if the board has fewer copies of some letter than the word needs, the answer is `False` right away; and if the word's last letter is rarer on the board than its first, search the reversed word, since the search hits fewer dead ends from the rarer end.

- Time: O(m·n·3^L) worst case (board is m×n, word length is L), usually much faster thanks to pruning
- Space: O(L) for the recursion stack, no extra grid

## 2. Backtracking with a visited grid — `2_backtracking_visited.py`

The same search, but instead of changing the board, keep a separate grid of `True`/`False` values that marks the cells on the current path. Mark a cell before exploring its neighbors and unmark it afterwards. This is easy to follow, but it needs the extra grid and has none of the pruning from solution 1.

- Time: O(m·n·3^L) worst case
- Space: O(m·n + L)

## 3. BFS over partial paths with a bitmask — `3_bfs_bitmask.py`

Instead of recursion, keep a queue of every partial match. Each entry stores its position, how many letters have matched, and which cells it has used, packed into one integer with one bit per cell. Pop an entry: if every letter has matched, return `True`; otherwise push each valid neighbor that continues the word. It avoids recursion, but it holds every partial path in memory at the same time.

- Time: O(m·n·3^L) worst case
- Space: O(m·n·3^L) worst case for the queue
