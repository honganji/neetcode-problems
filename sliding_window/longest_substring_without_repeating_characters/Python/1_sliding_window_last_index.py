def length_of_longest_substring(s: str) -> int:
    last_index = {}
    left = 0
    best = 0
    for right, ch in enumerate(s):
        if ch in last_index and last_index[ch] >= left:
            left = last_index[ch] + 1
        last_index[ch] = right
        best = max(best, right - left + 1)
    return best
