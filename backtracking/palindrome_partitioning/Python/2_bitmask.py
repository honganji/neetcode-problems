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

        result: List[List[str]] = []
        # Bit k of mask set means "cut after index k".
        for mask in range(1 << (n - 1)):
            parts: List[str] = []
            start = 0
            valid = True
            for end in range(n):
                is_cut = end == n - 1 or (mask >> end) & 1
                if not is_cut:
                    continue
                if not is_palindrome(start, end):
                    valid = False
                    break
                parts.append(s[start:end + 1])
                start = end + 1
            if valid:
                result.append(parts)
        return result
