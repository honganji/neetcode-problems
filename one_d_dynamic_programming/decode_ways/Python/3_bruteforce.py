class Solution:
    def numDecodings(self, s: str) -> int:
        def ways(i: int) -> int:
            # Try every possible split of s[i:] into 1-digit and 2-digit pieces.
            if i == len(s):
                return 1
            if s[i] == "0":
                return 0

            total = ways(i + 1)
            if i + 1 < len(s) and 10 <= int(s[i:i + 2]) <= 26:
                total += ways(i + 2)
            return total

        return ways(0)
