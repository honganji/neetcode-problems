from typing import List


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # Store the dictionary in a trie so that from any position we can
        # walk forward and find every word that starts there in one pass.
        root = {}
        for word in wordDict:
            node = root
            for ch in word:
                node = node.setdefault(ch, {})
            node["#"] = True  # marks the end of a word

        n = len(s)
        can_reach = [False] * (n + 1)  # can_reach[i]: s[:i] can be split
        can_reach[0] = True

        for start in range(n):
            if not can_reach[start]:
                continue
            node = root
            for end in range(start, n):
                node = node.get(s[end])
                if node is None:
                    break
                if "#" in node:
                    can_reach[end + 1] = True

        return can_reach[n]
