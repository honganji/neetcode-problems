class Solution:
    def getSum(self, a: int, b: int) -> int:
        # Python ints have no fixed size, so keep only the low 32 bits
        # to mimic a 32-bit integer.
        mask = 0xFFFFFFFF
        while b & mask:
            # XOR adds bits without carrying; AND shifted left is the carry.
            a, b = (a ^ b) & mask, ((a & b) << 1) & mask
        # Interpret the 32-bit pattern as a signed value.
        return a if a <= 0x7FFFFFFF else ~(a ^ mask)
