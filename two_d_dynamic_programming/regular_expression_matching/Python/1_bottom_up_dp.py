class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)
        # next_row[j] = does s[i+1:] match p[j:]
        next_row = [False] * (n + 1)
        for i in range(m, -1, -1):
            # cur[j] = does s[i:] match p[j:]
            cur = [False] * (n + 1)
            cur[n] = i == m  # empty text matches an empty pattern suffix
            for j in range(n - 1, -1, -1):
                first = i < m and p[j] in (s[i], '.')
                if j + 1 < n and p[j + 1] == '*':
                    # skip "x*" entirely, or consume one char and stay on "x*"
                    cur[j] = cur[j + 2] or (first and next_row[j])
                else:
                    cur[j] = first and next_row[j + 1]
            next_row = cur
        return next_row[0]
