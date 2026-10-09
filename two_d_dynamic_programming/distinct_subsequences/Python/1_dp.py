def num_distinct(s: str, t: str) -> int:
    m = len(t)
    # ways[j] = number of ways t[:j] can be picked out of the part of s read so far.
    ways = [0] * (m + 1)
    ways[0] = 1  # the empty prefix can always be formed in exactly one way
    for ch in s:
        # Go backwards so one character of s is never used twice in the same step.
        for j in range(m, 0, -1):
            if t[j - 1] == ch:
                ways[j] += ways[j - 1]
    return ways[m]
