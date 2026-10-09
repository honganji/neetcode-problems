from bisect import bisect_left


def longest_common_subsequence(text1: str, text2: str) -> int:
    # For each letter, the positions where it appears in text2, in order.
    positions = {}
    for j, c in enumerate(text2):
        positions.setdefault(c, []).append(j)

    # tails[k] = smallest end position in text2 of a common chain of length k + 1.
    tails = []
    for c in text1:
        # Right to left, so one letter of text1 can't be used twice in one chain.
        for j in reversed(positions.get(c, [])):
            k = bisect_left(tails, j)
            if k == len(tails):
                tails.append(j)
            else:
                tails[k] = j
    return len(tails)
