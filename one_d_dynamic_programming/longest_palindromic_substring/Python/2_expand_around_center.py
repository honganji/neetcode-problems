class Solution:
    def longestPalindrome(self, s: str) -> str:
        start, best = 0, 0
        for center in range(len(s)):
            # Odd-length palindromes center on a character, even-length on a gap.
            for left, right in ((center, center), (center, center + 1)):
                while left >= 0 and right < len(s) and s[left] == s[right]:
                    left -= 1
                    right += 1
                # s[left + 1 : right] is the palindrome found from this center.
                if right - left - 1 > best:
                    start, best = left + 1, right - left - 1
        return s[start : start + best]
