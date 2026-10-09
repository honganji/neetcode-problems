class Solution:
    def longestPalindrome(self, s: str) -> str:
        # Interleave '#' so every palindrome has odd length ("aba" -> "#a#b#a#").
        t = "#" + "#".join(s) + "#"
        n = len(t)

        # p[i]: radius of the palindrome centered at t[i] (in t, not in s).
        p = [0] * n
        center = right = 0  # the palindrome reaching furthest right so far
        best_center = 0
        for i in range(n):
            if i < right:
                # Start from the mirror image's radius, capped at the known box.
                p[i] = min(right - i, p[2 * center - i])
            while i - p[i] - 1 >= 0 and i + p[i] + 1 < n and t[i - p[i] - 1] == t[i + p[i] + 1]:
                p[i] += 1
            if i + p[i] > right:
                center, right = i, i + p[i]
            if p[i] > p[best_center]:
                best_center = i

        start = (best_center - p[best_center]) // 2
        return s[start : start + p[best_center]]
