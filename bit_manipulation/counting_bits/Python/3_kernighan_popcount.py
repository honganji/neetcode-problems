def count_bits(n: int) -> list[int]:
    ans = []
    for i in range(n + 1):
        count = 0
        x = i
        while x:
            x &= x - 1  # clear the lowest set bit
            count += 1
        ans.append(count)
    return ans
