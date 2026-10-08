def is_anagram(s: str, t: str) -> bool:
    if len(s) != len(t):
        return False
    remaining = list(t)
    for ch in s:
        for i, other in enumerate(remaining):
            if other == ch:
                remaining.pop(i)
                break
        else:
            return False
    return True
