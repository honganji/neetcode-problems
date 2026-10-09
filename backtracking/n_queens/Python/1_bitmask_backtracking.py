from typing import List


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        res: List[List[str]] = []
        cols: List[int] = [0] * n  # cols[row] = column of that row's queen

        def backtrack(row: int, col_mask: int, diag1: int, diag2: int) -> None:
            if row == n:
                res.append(["." * c + "Q" + "." * (n - c - 1) for c in cols])
                return
            # Columns not attacked by any queen placed so far
            free = ~(col_mask | diag1 | diag2) & ((1 << n) - 1)
            while free:
                bit = free & -free  # lowest free column
                free ^= bit
                cols[row] = bit.bit_length() - 1
                # Attacked diagonals move one column per row
                backtrack(row + 1, col_mask | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1)

        backtrack(0, 0, 0, 0)
        return res
