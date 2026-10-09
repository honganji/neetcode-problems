from typing import List


class Solution:
    def isNStraightHand(self, hand: List[int], groupSize: int) -> bool:
        if len(hand) % groupSize != 0:
            return False

        cards = list(hand)
        while cards:
            # The smallest remaining card must start the next group.
            lowest = min(cards)
            for v in range(lowest, lowest + groupSize):
                if v not in cards:
                    return False
                cards.remove(v)
        return True
