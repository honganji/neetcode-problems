class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        # Try a band of width k around the diagonal; double k until the answer fits.
        k = max(1, abs(len(word1) - len(word2)))
        while True:
            result = self._banded(word1, word2, k)
            if result <= k:
                return result
            k *= 2

    def _banded(self, word1: str, word2: str, k: int) -> int:
        m, n = len(word1), len(word2)
        INF = m + n + 1  # larger than any real cost
        prev = [j if j <= k else INF for j in range(n + 1)]
        for i in range(1, m + 1):
            cur = [INF] * (n + 1)
            if i <= k:
                cur[0] = i
            # Only fill cells within k of the diagonal.
            for j in range(max(1, i - k), min(n, i + k) + 1):
                if word1[i - 1] == word2[j - 1]:
                    cur[j] = prev[j - 1]
                else:
                    cur[j] = 1 + min(prev[j - 1], prev[j], cur[j - 1])
            prev = cur
        return prev[n]
