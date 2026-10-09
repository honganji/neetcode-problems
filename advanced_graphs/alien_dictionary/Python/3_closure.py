from typing import List


class Solution:
    def alienOrder(self, words: List[str]) -> str:
        # Letters are numbered 0..25 (a..z). adj[u][v] is True when u must come before v.
        present = [False] * 26
        adj = [[False] * 26 for _ in range(26)]

        for word in words:
            for ch in word:
                present[ord(ch) - ord("a")] = True

        for first, second in zip(words, words[1:]):
            limit = min(len(first), len(second))
            j = 0
            while j < limit and first[j] == second[j]:
                j += 1
            if j == limit:
                # "abc" before "ab" can never be sorted
                if len(first) > len(second):
                    return ""
                continue
            adj[ord(first[j]) - ord("a")][ord(second[j]) - ord("a")] = True

        # Floyd-Warshall: afterwards adj[u][v] is True if u must come before v, even indirectly
        for k in range(26):
            for i in range(26):
                if adj[i][k]:
                    for j in range(26):
                        if adj[k][j]:
                            adj[i][j] = True

        # A letter that must come before itself means a cycle
        if any(adj[c][c] for c in range(26)):
            return ""

        # A letter that must come later has strictly more letters forced before it,
        # so sorting by that count gives a valid order
        ancestors = [0] * 26
        for u in range(26):
            for v in range(26):
                if adj[u][v]:
                    ancestors[v] += 1

        letters = sorted((c for c in range(26) if present[c]), key=lambda c: ancestors[c])
        return "".join(chr(c + ord("a")) for c in letters)
