def count_bits(n: int) -> list[int]:
    ans = [0] * (n + 1)
    for i in range(1, n + 1):
        # i >> 1 drops the last bit; i & 1 is that last bit.
        ans[i] = ans[i >> 1] + (i & 1)
    return ans
