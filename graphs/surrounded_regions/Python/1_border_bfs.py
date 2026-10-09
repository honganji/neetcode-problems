from collections import deque
from typing import List


class Solution:
    def solve(self, board: List[List[str]]) -> None:
        if not board or not board[0]:
            return
        rows, cols = len(board), len(board[0])
        queue = deque()

        # Every 'O' on the border is safe; mark it 'S' and start the search there
        for r in range(rows):
            for c in (0, cols - 1):
                if board[r][c] == "O":
                    board[r][c] = "S"
                    queue.append((r, c))
        for c in range(cols):
            for r in (0, rows - 1):
                if board[r][c] == "O":
                    board[r][c] = "S"
                    queue.append((r, c))

        # Spread safety to every 'O' connected to a safe cell
        while queue:
            r, c = queue.popleft()
            for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and board[nr][nc] == "O":
                    board[nr][nc] = "S"
                    queue.append((nr, nc))

        # Remaining 'O' are surrounded -> 'X'; restore safe cells to 'O'
        for r in range(rows):
            for c in range(cols):
                if board[r][c] == "O":
                    board[r][c] = "X"
                elif board[r][c] == "S":
                    board[r][c] = "O"
