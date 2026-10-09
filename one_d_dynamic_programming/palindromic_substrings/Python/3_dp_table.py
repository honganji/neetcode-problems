class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        # dp[i][j] is True when s[i..j] is a palindrome.
        dp = [[False] * n for _ in range(n)]
        count = 0
        for i in range(n - 1, -1, -1):
            for j in range(i, n):
                # Ends must match, and the inside must itself be a palindrome (or empty/one char).
                if s[i] == s[j] and (j - i < 2 or dp[i + 1][j - 1]):
                    dp[i][j] = True
                    count += 1
        return count
