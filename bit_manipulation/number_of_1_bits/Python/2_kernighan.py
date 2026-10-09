class Solution:
    def hammingWeight(self, n: int) -> int:
        count = 0
        # n & (n - 1) clears the lowest set bit, so this loops once per 1 bit.
        while n:
            n &= n - 1
            count += 1
        return count
