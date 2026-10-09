from typing import List


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # Try every word at the current position and recurse on the rest.
        # No memo, so the same suffix may be re-checked many times.
        def can_split(start: int) -> bool:
            if start == len(s):
                return True
            for word in wordDict:
                if s.startswith(word, start) and can_split(start + len(word)):
                    return True
            return False

        return can_split(0)
