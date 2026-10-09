def min_window(s: str, t: str) -> str:
    if not t or len(t) > len(s):
        return ""
    need = [0] * 128
    for ch in t:
        need[ord(ch)] += 1
    best_start, best_len = 0, len(s) + 1
    for start in range(len(s)):
        if len(s) - start < len(t):
            break
        count = need[:]
        missing = len(t)
        for end in range(start, len(s)):
            if end - start + 1 >= best_len:
                break
            code = ord(s[end])
            if count[code] > 0:
                missing -= 1
            count[code] -= 1
            if missing == 0:
                best_start, best_len = start, end - start + 1
                break
    return "" if best_len > len(s) else s[best_start:best_start + best_len]
