from typing import List


class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        n = len(matrix)
        # Work from the outside ring inward.
        for first in range(n // 2):
            last = n - 1 - first
            # Each step moves 4 cells in one cycle: top -> right -> bottom -> left -> top.
            for i in range(first, last):
                offset = i - first
                top = matrix[first][i]
                matrix[first][i] = matrix[last - offset][first]              # left -> top
                matrix[last - offset][first] = matrix[last][last - offset]   # bottom -> left
                matrix[last][last - offset] = matrix[i][last]                # right -> bottom
                matrix[i][last] = top                                        # top -> right
