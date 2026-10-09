from collections import deque
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

        # Count how many letters must come right before each letter
        indegree = [0] * 26
        for u in range(26):
            for v in range(26):
                if adj[u][v]:
                    indegree[v] += 1

        # Letters with nothing blocking them can go first
        queue = deque(c for c in range(26) if present[c] and indegree[c] == 0)
        order = []
        while queue:
            u = queue.popleft()
            order.append(chr(u + ord("a")))
            for v in range(26):
                if adj[u][v]:
                    indegree[v] -= 1
                    if indegree[v] == 0:
                        queue.append(v)

        # Letters stuck with blockers form a cycle, so no valid order exists
        if len(order) != sum(present):
            return ""
        return "".join(order)
