class Solution:
    def reverseBits(self, n: int) -> int:
        # Take bits off n from the lowest end and push each one onto the
        # bottom of the result. The first bit read ends up at the top.
        result = 0
        for _ in range(32):
            result = (result << 1) | (n & 1)
            n >>= 1
        return result
