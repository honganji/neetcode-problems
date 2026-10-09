def is_interleave(s1: str, s2: str, s3: str) -> bool:
    m, n = len(s1), len(s2)
    if m + n != len(s3):
        return False

    # dp[j] is True when s1[:i] and s2[:j] can interleave into s3[:i + j].
    # One row is reused: dp[j] still holds row i - 1 until it is updated.
    dp = [False] * (n + 1)
    for i in range(m + 1):
        for j in range(n + 1):
            if i == 0 and j == 0:
                dp[j] = True
                continue
            from_top = i > 0 and dp[j] and s1[i - 1] == s3[i + j - 1]
            from_left = j > 0 and dp[j - 1] and s2[j - 1] == s3[i + j - 1]
            dp[j] = from_top or from_left
    return dp[n]
