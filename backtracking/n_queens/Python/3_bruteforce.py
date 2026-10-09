from itertools import product
from typing import List, Sequence


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        res: List[List[str]] = []
        # Try every column choice for every row (n^n boards)
        for cols in product(range(n), repeat=n):
            if self.is_valid(cols):
                res.append(["." * c + "Q" + "." * (n - c - 1) for c in cols])
        return res

    def is_valid(self, cols: Sequence[int]) -> bool:
        n = len(cols)
        for i in range(n):
            for j in range(i + 1, n):
                # Same column, or same diagonal (equal row and column distance)
                if cols[i] == cols[j] or abs(cols[i] - cols[j]) == j - i:
                    return False
        return True
