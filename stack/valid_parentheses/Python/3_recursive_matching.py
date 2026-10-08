def is_valid(s: str) -> bool:
    pairs = {"(": ")", "[": "]", "{": "}"}

    def parse(i: int) -> int:
        if i >= len(s) or s[i] not in pairs:
            return -1
        closing = pairs[s[i]]
        i += 1
        while i < len(s) and s[i] != closing:
            i = parse(i)
            if i == -1:
                return -1
        return i + 1 if i < len(s) else -1

    i = 0
    while i < len(s):
        i = parse(i)
        if i == -1:
            return False
    return True
