class Solution:
    def climbStairs(self, n: int) -> int:
        # ways[i] = ways[i - 1] + ways[i - 2], and only the last two values are needed.
        prev, curr = 1, 1  # ways to reach step 0 and step 1
        for _ in range(2, n + 1):
            prev, curr = curr, prev + curr
        return curr
