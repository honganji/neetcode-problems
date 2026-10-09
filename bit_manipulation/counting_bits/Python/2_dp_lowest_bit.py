def count_bits(n: int) -> list[int]:
    ans = [0] * (n + 1)
    for i in range(1, n + 1):
        # i & (i - 1) clears the lowest set bit, leaving one fewer 1-bit.
        ans[i] = ans[i & (i - 1)] + 1
    return ans
