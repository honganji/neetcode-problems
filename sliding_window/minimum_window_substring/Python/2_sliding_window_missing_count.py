def min_window(s: str, t: str) -> str:
    if not t or len(t) > len(s):
        return ""
    count = [0] * 128
    for ch in t:
        count[ord(ch)] += 1
    missing = len(t)
    best_start, best_len = 0, float("inf")
    left = 0
    for right, ch in enumerate(s):
        if count[ord(ch)] > 0:
            missing -= 1
        count[ord(ch)] -= 1
        while missing == 0:
            if right - left + 1 < best_len:
                best_start, best_len = left, right - left + 1
            out = ord(s[left])
            count[out] += 1
            if count[out] > 0:
                missing += 1
            left += 1
    return "" if best_len == float("inf") else s[best_start:best_start + best_len]
