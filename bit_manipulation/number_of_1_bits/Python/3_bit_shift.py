class Solution:
    def hammingWeight(self, n: int) -> int:
        count = 0
        # Check each of the 32 bit positions.
        for i in range(32):
            count += (n >> i) & 1
        return count
