from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        rows, cols = len(board), len(board[0])
        visited = [[False] * cols for _ in range(rows)]
        directions = ((1, 0), (-1, 0), (0, 1), (0, -1))

        def dfs(r: int, c: int, i: int) -> bool:
            if i == len(word):
                return True
            if (r < 0 or c < 0 or r >= rows or c >= cols
                    or visited[r][c] or board[r][c] != word[i]):
                return False

            # Track the path in a separate grid instead of changing the board.
            visited[r][c] = True
            found = any(dfs(r + dr, c + dc, i + 1) for dr, dc in directions)
            visited[r][c] = False
            return found

        return any(dfs(r, c, 0) for r in range(rows) for c in range(cols))
