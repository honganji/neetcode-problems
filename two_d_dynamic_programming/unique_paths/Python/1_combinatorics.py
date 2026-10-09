class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        # Every path is a sequence of (m - 1) downs and (n - 1) rights.
        # The answer is how many ways we can pick which moves are downs: C(m + n - 2, k).
        total = m + n - 2
        k = min(m - 1, n - 1)
        result = 1
        for i in range(1, k + 1):
            # Each step keeps result an exact integer, so // is safe here.
            result = result * (total - k + i) // i
        return result
