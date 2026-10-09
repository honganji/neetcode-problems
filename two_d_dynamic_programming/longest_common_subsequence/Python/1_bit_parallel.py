def longest_common_subsequence(text1: str, text2: str) -> int:
    n = len(text2)
    full = (1 << n) - 1

    # For each letter, a bit mask of the positions where it appears in text2.
    match = {}
    for j, c in enumerate(text2):
        match[c] = match.get(c, 0) | (1 << j)

    # One bit per position in text2, all starting as 1.
    v = full
    for c in text1:
        u = v & match.get(c, 0)
        v = ((v + u) | (v ^ u)) & full

    # Each 0 bit left in v counts one character of the LCS.
    return n - bin(v).count("1")
