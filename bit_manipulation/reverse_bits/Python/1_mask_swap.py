class Solution:
    def reverseBits(self, n: int) -> int:
        # Swap neighbouring groups of bits, doubling the group size each step:
        # single bits, pairs, nibbles, bytes, then the two 16-bit halves.
        n = ((n >> 1) & 0x55555555) | ((n & 0x55555555) << 1)
        n = ((n >> 2) & 0x33333333) | ((n & 0x33333333) << 2)
        n = ((n >> 4) & 0x0F0F0F0F) | ((n & 0x0F0F0F0F) << 4)
        n = ((n >> 8) & 0x00FF00FF) | ((n & 0x00FF00FF) << 8)
        # Python ints are unbounded, so trim the result back to 32 bits.
        return ((n >> 16) | (n << 16)) & 0xFFFFFFFF
