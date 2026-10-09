def character_replacement(s: str, k: int) -> int:
    counts = [0] * 26
    max_freq = 0
    left = 0
    best = 0
    for right, ch in enumerate(s):
        idx = ord(ch) - ord("A")
        counts[idx] += 1
        max_freq = max(max_freq, counts[idx])
        if right - left + 1 - max_freq > k:
            counts[ord(s[left]) - ord("A")] -= 1
            left += 1
        best = max(best, right - left + 1)
    return best
