class Solution:
    def numDecodings(self, s: str) -> int:
        # ways[i] = number of ways to decode s[i:].
        # We only need the two most recent values, so keep just those.
        after = 1       # ways[i + 1], starts as ways[n] = 1 (empty suffix)
        after_next = 0  # ways[i + 2]

        for i in range(len(s) - 1, -1, -1):
            ways = 0
            if s[i] != "0":
                # Decode s[i] as a single letter.
                ways = after
                # Or decode s[i:i+2] as a pair, if it is 10..26.
                if i + 1 < len(s) and 10 <= int(s[i:i + 2]) <= 26:
                    ways += after_next
            after, after_next = ways, after

        return after
