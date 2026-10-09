from itertools import permutations
from typing import List


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        res: List[List[str]] = []
        # A permutation puts one queen in every row and every column,
        # so only the diagonals still need checking.
        for perm in permutations(range(n)):
            sums = {r + c for r, c in enumerate(perm)}
            diffs = {r - c for r, c in enumerate(perm)}
            if len(sums) == n and len(diffs) == n:
                res.append(["." * c + "Q" + "." * (n - c - 1) for c in perm])
        return res
