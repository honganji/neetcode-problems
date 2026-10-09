class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        def match(i: int, j: int) -> bool:
            if j == len(p):
                return i == len(s)
            first = i < len(s) and p[j] in (s[i], '.')
            if j + 1 < len(p) and p[j + 1] == '*':
                # try zero matches first, then one match staying on "x*"
                return match(i, j + 2) or (first and match(i + 1, j))
            return first and match(i + 1, j + 1)

        return match(0, 0)
