from typing import List


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        words = set(wordDict)
        max_len = max(len(w) for w in wordDict)

        n = len(s)
        can_reach = [False] * (n + 1)  # can_reach[i]: s[:i] can be split
        can_reach[0] = True

        for i in range(1, n + 1):
            # Only the last max_len characters can form the final word.
            for j in range(i - 1, max(0, i - max_len) - 1, -1):
                if can_reach[j] and s[j:i] in words:
                    can_reach[i] = True
                    break

        return can_reach[n]
