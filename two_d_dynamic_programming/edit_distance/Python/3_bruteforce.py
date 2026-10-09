class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        m, n = len(word1), len(word2)

        def solve(i: int, j: int) -> int:
            # word1[i:] and word2[j:] are the parts still to match
            if i == m:
                return n - j  # insert the rest of word2
            if j == n:
                return m - i  # delete the rest of word1
            if word1[i] == word2[j]:
                return solve(i + 1, j + 1)
            return 1 + min(
                solve(i + 1, j + 1),  # replace
                solve(i + 1, j),      # delete
                solve(i, j + 1),      # insert
            )

        return solve(0, 0)
