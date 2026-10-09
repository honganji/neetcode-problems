def character_replacement(s: str, k: int) -> int:
    best = 0
    for start in range(len(s)):
        counts = [0] * 26
        max_count = 0
        for end in range(start, len(s)):
            idx = ord(s[end]) - ord("A")
            counts[idx] += 1
            max_count = max(max_count, counts[idx])
            if end - start + 1 - max_count > k:
                break
            best = max(best, end - start + 1)
    return best
