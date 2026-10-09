class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        # dp[i][j] is True when s[i..j] is a palindrome.
        dp = [[False] * n for _ in range(n)]
        start, best = 0, 0
        # Going i from right to left means dp[i + 1][...] is ready when needed.
        for i in range(n - 1, -1, -1):
            for j in range(i, n):
                # s[i..j] is a palindrome if its ends match and the inside is one too.
                if s[i] == s[j] and (j - i < 2 or dp[i + 1][j - 1]):
                    dp[i][j] = True
                    if j - i + 1 > best:
                        start, best = i, j - i + 1
        return s[start : start + best]
