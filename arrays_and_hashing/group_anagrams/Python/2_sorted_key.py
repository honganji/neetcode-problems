def group_anagrams(strs: list[str]) -> list[list[str]]:
    groups: dict[str, list[str]] = {}
    for s in strs:
        groups.setdefault("".join(sorted(s)), []).append(s)
    return list(groups.values())
