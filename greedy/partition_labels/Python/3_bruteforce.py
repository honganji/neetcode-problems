from typing import List


class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        result = []
        start = 0
        n = len(s)

        while start < n:
            # Find the earliest end where no letter in the part appears later.
            end = start
            while not self._is_clean_cut(s, start, end):
                end += 1
            result.append(end - start + 1)
            start = end + 1

        return result

    def _is_clean_cut(self, s: str, start: int, end: int) -> bool:
        left = set(s[start:end + 1])
        right = set(s[end + 1:])
        return not (left & right)
