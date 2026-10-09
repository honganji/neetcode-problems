def check_inclusion(s1: str, s2: str) -> bool:
    if len(s1) > len(s2):
        return False
    target = sorted(s1)
    for start in range(len(s2) - len(s1) + 1):
        if sorted(s2[start:start + len(s1)]) == target:
            return True
    return False
