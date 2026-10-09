# Precompute the reverse of every 8-bit value once.
# REVERSED_BYTE[i] is i with its 8 bits flipped, e.g. 0b00000001 -> 0b10000000.
REVERSED_BYTE = [0] * 256
for i in range(1, 256):
    REVERSED_BYTE[i] = (REVERSED_BYTE[i >> 1] >> 1) | ((i & 1) << 7)


class Solution:
    def reverseBits(self, n: int) -> int:
        # Split the 32 bits into four bytes, reverse each one with the table,
        # and place it in the mirrored position.
        return (
            (REVERSED_BYTE[n & 0xFF] << 24)
            | (REVERSED_BYTE[(n >> 8) & 0xFF] << 16)
            | (REVERSED_BYTE[(n >> 16) & 0xFF] << 8)
            | REVERSED_BYTE[(n >> 24) & 0xFF]
        )
