def encode(strs: list[str]) -> str:
    return "".join(s.replace("/", "//") + "/:" for s in strs)


def decode(s: str) -> list[str]:
    result = []
    current = []
    i = 0
    while i < len(s):
        if s[i] == "/":
            if s[i + 1] == "/":
                current.append("/")
            else:
                result.append("".join(current))
                current = []
            i += 2
        else:
            current.append(s[i])
            i += 1
    return result
