from typing import List


class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        total_surplus = 0  # total gas - total cost over the whole circle
        tank = 0           # fuel left while driving from the current start
        start = 0

        for i in range(len(gas)):
            diff = gas[i] - cost[i]
            total_surplus += diff
            tank += diff
            if tank < 0:
                # Can't get from `start` to station i + 1, so no station
                # between `start` and i can work. Try the next one.
                start = i + 1
                tank = 0

        return start if total_surplus >= 0 else -1
