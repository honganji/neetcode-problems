MASK = 0xFFFFFFFF  # Python ints are unbounded, so keep values to 32 bits


def _increment(x: int) -> int:
    # Turn the trailing 1s into 0s until we reach a 0, then set that 0 to 1.
    bit = 1
    while x & bit:
        x ^= bit
        bit <<= 1
    return (x ^ bit) & MASK


def _decrement(x: int) -> int:
    # x - 1 == ~(~x + 1), and ~ is just a bit flip.
    return MASK ^ _increment(MASK ^ x)


class Solution:
    def getSum(self, a: int, b: int) -> int:
        a &= MASK
        step = _increment if b > 0 else _decrement
        # The loop only counts |b| steps; each step does the work with bits.
        for _ in range(abs(b)):
            a = step(a)
        # Interpret the 32-bit pattern as a signed value.
        return a if a <= 0x7FFFFFFF else ~(a ^ MASK)
