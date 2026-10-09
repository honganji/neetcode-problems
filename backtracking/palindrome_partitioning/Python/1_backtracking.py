from typing import List


class Solution:
    def partition(self, s: str) -> List[List[str]]:
        n = len(s)
        # is_pal[i][j] is True when s[i..j] is a palindrome.
        is_pal = [[False] * n for _ in range(n)]
        for i in range(n - 1, -1, -1):
            for j in range(i, n):
                is_pal[i][j] = s[i] == s[j] and (j - i < 2 or is_pal[i + 1][j - 1])

        result: List[List[str]] = []
        current: List[str] = []

        def backtrack(start: int) -> None:
            if start == n:
                result.append(current[:])
                return
            for end in range(start, n):
                if is_pal[start][end]:
                    current.append(s[start:end + 1])
                    backtrack(end + 1)
                    current.pop()

        backtrack(0)
        return result
