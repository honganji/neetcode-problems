def check_inclusion(s1: str, s2: str) -> bool:
    if len(s1) > len(s2):
        return False
    need = [0] * 26
    window = [0] * 26
    for i in range(len(s1)):
        need[ord(s1[i]) - ord("a")] += 1
        window[ord(s2[i]) - ord("a")] += 1
    matches = sum(1 for i in range(26) if need[i] == window[i])
    for right in range(len(s1), len(s2)):
        if matches == 26:
            return True
        enter = ord(s2[right]) - ord("a")
        window[enter] += 1
        if window[enter] == need[enter]:
            matches += 1
        elif window[enter] == need[enter] + 1:
            matches -= 1
        leave = ord(s2[right - len(s1)]) - ord("a")
        window[leave] -= 1
        if window[leave] == need[leave]:
            matches += 1
        elif window[leave] == need[leave] - 1:
            matches -= 1
    return matches == 26
