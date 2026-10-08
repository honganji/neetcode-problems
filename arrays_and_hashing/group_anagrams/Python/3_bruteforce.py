def group_anagrams(strs: list[str]) -> list[list[str]]:
    def letter_counts(s: str) -> list[int]:
        counts = [0] * 26
        for ch in s:
            counts[ord(ch) - ord("a")] += 1
        return counts

    counts = [letter_counts(s) for s in strs]
    visited = [False] * len(strs)
    result: list[list[str]] = []
    for i in range(len(strs)):
        if visited[i]:
            continue
        group = [strs[i]]
        visited[i] = True
        for j in range(i + 1, len(strs)):
            if not visited[j] and counts[i] == counts[j]:
                group.append(strs[j])
                visited[j] = True
        result.append(group)
    return result
