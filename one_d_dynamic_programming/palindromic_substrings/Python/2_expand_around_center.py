class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        count = 0
        # There are 2n - 1 possible centers: n characters, and n - 1 gaps between them.
        for center in range(2 * n - 1):
            left = center // 2
            right = left + center % 2
            # Every time the ends still match, the substring between them is a new palindrome.
            while left >= 0 and right < n and s[left] == s[right]:
                count += 1
                left -= 1
                right += 1
        return count
