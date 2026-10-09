def character_replacement(s: str, k: int) -> int:
    counts = [0] * 26
    left = 0
    best = 0
    for right, ch in enumerate(s):
        counts[ord(ch) - ord("A")] += 1
        while right - left + 1 - max(counts) > k:
            counts[ord(s[left]) - ord("A")] -= 1
            left += 1
        best = max(best, right - left + 1)
    return best
