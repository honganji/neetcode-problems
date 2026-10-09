class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        n = len(p)

        def closure(active: list[bool]) -> list[bool]:
            # A "x*" token can be skipped entirely, so jump over it
            for j in range(n):
                if active[j] and j + 1 < n and p[j + 1] == '*':
                    active[j + 2] = True
            return active

        # State j = "next we must match p[j]"; state n = whole pattern consumed
        cur = [False] * (n + 1)
        cur[0] = True
        cur = closure(cur)

        for c in s:
            nxt = [False] * (n + 1)
            for j in range(n):
                if cur[j] and p[j] in (c, '.'):
                    if j + 1 < n and p[j + 1] == '*':
                        nxt[j] = True  # stay on "x*" to allow more matches
                    else:
                        nxt[j + 1] = True
            cur = closure(nxt)

        return cur[n]
