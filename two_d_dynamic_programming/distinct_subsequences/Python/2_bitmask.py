def num_distinct(s: str, t: str) -> int:
    n = len(s)
    count = 0
    # Each number from 0 to 2^n - 1 is one choice of positions: bit i set means keep s[i].
    for mask in range(1 << n):
        picked = [s[i] for i in range(n) if mask >> i & 1]
        if len(picked) == len(t) and "".join(picked) == t:
            count += 1
    return count
