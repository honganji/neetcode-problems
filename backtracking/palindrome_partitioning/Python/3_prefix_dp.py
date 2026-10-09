from typing import List


class Solution:
    def partition(self, s: str) -> List[List[str]]:
        n = len(s)

        def is_palindrome(l: int, r: int) -> bool:
            while l < r:
                if s[l] != s[r]:
                    return False
                l += 1
                r -= 1
            return True

        # partitions[i] holds every way to split the first i characters.
        partitions: List[List[List[str]]] = [[] for _ in range(n + 1)]
        partitions[0] = [[]]
        for end in range(1, n + 1):
            for start in range(end):
                if is_palindrome(start, end - 1):
                    last = s[start:end]
                    for prefix in partitions[start]:
                        partitions[end].append(prefix + [last])
        return partitions[n]
