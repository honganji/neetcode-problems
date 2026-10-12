from typing import List


class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        n = len(matrix)
        # Put each value at its rotated position in a new matrix.
        rotated = [[0] * n for _ in range(n)]
        for i in range(n):
            for j in range(n):
                rotated[j][n - 1 - i] = matrix[i][j]
        # Copy the result back into the original matrix.
        for i in range(n):
            matrix[i][:] = rotated[i]
