def is_interleave(s1: str, s2: str, s3: str) -> bool:
    m, n = len(s1), len(s2)
    if m + n != len(s3):
        return False

    memo: dict[tuple[int, int], bool] = {}

    def dfs(i: int, j: int) -> bool:
        # Used all of s1 and s2, so s3 is fully matched.
        if i == m and j == n:
            return True
        if (i, j) in memo:
            return memo[(i, j)]
        k = i + j
        # Try to take the next character from s1, or from s2.
        result = (i < m and s1[i] == s3[k] and dfs(i + 1, j)) or (
            j < n and s2[j] == s3[k] and dfs(i, j + 1)
        )
        memo[(i, j)] = result
        return result

    return dfs(0, 0)
