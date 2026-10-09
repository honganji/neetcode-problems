from typing import List


class Solution:
    def solve(self, board: List[List[str]]) -> None:
        if not board or not board[0]:
            return
        rows, cols = len(board), len(board[0])
        border = rows * cols  # virtual node meaning "connected to the border"
        parent = list(range(rows * cols + 1))
        size = [1] * (rows * cols + 1)

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]  # path halving
                x = parent[x]
            return x

        def union(a: int, b: int) -> None:
            ra, rb = find(a), find(b)
            if ra == rb:
                return
            if size[ra] < size[rb]:
                ra, rb = rb, ra
            parent[rb] = ra
            size[ra] += size[rb]

        # Group each 'O' with its 'O' neighbours; border 'O's join the border node
        for r in range(rows):
            for c in range(cols):
                if board[r][c] != "O":
                    continue
                cell = r * cols + c
                if r == 0 or r == rows - 1 or c == 0 or c == cols - 1:
                    union(cell, border)
                if r + 1 < rows and board[r + 1][c] == "O":
                    union(cell, cell + cols)
                if c + 1 < cols and board[r][c + 1] == "O":
                    union(cell, cell + 1)

        # Any 'O' not in the border's group is surrounded
        safe = find(border)
        for r in range(rows):
            for c in range(cols):
                if board[r][c] == "O" and find(r * cols + c) != safe:
                    board[r][c] = "X"
