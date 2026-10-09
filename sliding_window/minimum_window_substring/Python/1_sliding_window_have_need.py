def min_window(s: str, t: str) -> str:
    if not t or len(t) > len(s):
        return ""
    need = {}
    for ch in t:
        need[ch] = need.get(ch, 0) + 1
    window = {}
    have, required = 0, len(need)
    best_start, best_len = 0, float("inf")
    left = 0
    for right, ch in enumerate(s):
        window[ch] = window.get(ch, 0) + 1
        if ch in need and window[ch] == need[ch]:
            have += 1
        while have == required:
            if right - left + 1 < best_len:
                best_start, best_len = left, right - left + 1
            out = s[left]
            window[out] -= 1
            if out in need and window[out] < need[out]:
                have -= 1
            left += 1
    return "" if best_len == float("inf") else s[best_start:best_start + best_len]
