from collections import Counter
from typing import List


class Solution:
    def isNStraightHand(self, hand: List[int], groupSize: int) -> bool:
        if len(hand) % groupSize != 0:
            return False

        counts = Counter(hand)
        # Walk the distinct values from smallest to largest.
        for start in sorted(counts):
            c = counts[start]
            if c == 0:
                continue
            # The smallest value left must start all of its remaining groups.
            for v in range(start, start + groupSize):
                if counts[v] < c:
                    return False
                counts[v] -= c
        return True
