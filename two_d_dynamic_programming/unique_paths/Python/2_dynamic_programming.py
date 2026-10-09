class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        # row[j] = number of paths to the cell at column j of the current row.
        row = [1] * n  # the first row: only one way to reach each cell
        for _ in range(1, m):
            for j in range(1, n):
                # row[j] still holds the count from above; row[j - 1] was already
                # updated for this row, so it holds the count from the left.
                row[j] += row[j - 1]
        return row[n - 1]
