from typing import List


class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        counts = [0] * 26
        for task in tasks:
            counts[ord(task) - ord("A")] += 1

        time = 0
        left = len(tasks)
        while left > 0:
            # Most frequent letters first, so each block takes the busiest tasks
            counts.sort(reverse=True)
            slots = n + 1  # one block = n + 1 slots
            for i in range(26):
                if slots == 0 or counts[i] == 0:
                    break
                counts[i] -= 1
                slots -= 1
                left -= 1
                time += 1
            if left > 0:
                time += slots  # idle for the rest of the block
        return time
