from typing import List


class Solution:
    def solve(self, board: List[List[str]]) -> None:
        if not board or not board[0]:
            return
        rows, cols = len(board), len(board[0])

        # Decide for each 'O' on its own, then flip all surrounded ones at the end
        to_flip = []
        for r in range(rows):
            for c in range(cols):
                if board[r][c] == "O" and self._is_surrounded(board, r, c):
                    to_flip.append((r, c))
        for r, c in to_flip:
            board[r][c] = "X"

    def _is_surrounded(self, board: List[List[str]], sr: int, sc: int) -> bool:
        rows, cols = len(board), len(board[0])
        seen = {(sr, sc)}
        stack = [(sr, sc)]
        while stack:
            r, c = stack.pop()
            # Reaching the border means this 'O' is connected to it, so it is not surrounded
            if r == 0 or r == rows - 1 or c == 0 or c == cols - 1:
                return False
            for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nr, nc = r + dr, c + dc
                if board[nr][nc] == "O" and (nr, nc) not in seen:
                    seen.add((nr, nc))
                    stack.append((nr, nc))
        return True
