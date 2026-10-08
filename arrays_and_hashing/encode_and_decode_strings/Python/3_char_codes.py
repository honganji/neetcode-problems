def encode(strs: list[str]) -> str:
    return "".join(",".join(str(ord(ch)) for ch in s) + ";" for s in strs)


def decode(s: str) -> list[str]:
    result = []
    for chunk in s.split(";")[:-1]:
        if chunk:
            result.append("".join(chr(int(code)) for code in chunk.split(",")))
        else:
            result.append("")
    return result
