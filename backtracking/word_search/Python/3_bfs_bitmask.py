from collections import deque
from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        rows, cols = len(board), len(board[0])
        directions = ((1, 0), (-1, 0), (0, 1), (0, -1))

        # Each state is (row, col, letters matched, bitmask of cells used so far).
        queue = deque()
        for r in range(rows):
            for c in range(cols):
                if board[r][c] == word[0]:
                    queue.append((r, c, 1, 1 << (r * cols + c)))

        # Expand every partial path one letter at a time, level by level.
        while queue:
            r, c, n, used = queue.popleft()
            if n == len(word):
                return True
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols:
                    bit = 1 << (nr * cols + nc)
                    if not used & bit and board[nr][nc] == word[n]:
                        queue.append((nr, nc, n + 1, used | bit))
        return False
