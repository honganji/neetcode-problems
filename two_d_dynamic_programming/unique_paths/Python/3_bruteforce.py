class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        def count(r: int, c: int) -> int:
            # Stepped off the grid: not a valid path.
            if r == m or c == n:
                return 0
            # Reached the bottom-right corner: exactly one path ends here.
            if r == m - 1 and c == n - 1:
                return 1
            # Otherwise try both moves and add up the paths.
            return count(r + 1, c) + count(r, c + 1)

        return count(0, 0)
