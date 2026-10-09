from typing import List


class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        balance = 0                  # running sum of gas[i] - cost[i]
        min_balance = float("inf")   # lowest balance seen so far
        start = 0

        for i in range(len(gas)):
            balance += gas[i] - cost[i]
            if balance < min_balance:
                # Starting right after the lowest point keeps the tank
                # from ever dipping below zero.
                min_balance = balance
                start = (i + 1) % len(gas)

        # The final balance is the total surplus; if it is negative, no
        # start works.
        return start if balance >= 0 else -1
