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

        # 0 = not visited, 1 = on the current DFS path, 2 = finished
        state = [0] * 26
        postorder = []

        def dfs(u: int) -> bool:
            state[u] = 1
            for v in range(26):
                if adj[u][v]:
                    # Reaching a letter that is still on the path means a cycle
                    if state[v] == 1:
                        return False
                    if state[v] == 0 and not dfs(v):
                        return False
            state[u] = 2
            postorder.append(u)
            return True

        for c in range(26):
            if present[c] and state[c] == 0 and not dfs(c):
                return ""

        # A letter finishes only after every letter it points to, so reversing finish order works
        return "".join(chr(c + ord("a")) for c in reversed(postorder))
