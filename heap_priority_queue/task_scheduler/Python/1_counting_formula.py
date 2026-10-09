from collections import Counter
from typing import List


class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        counts = Counter(tasks)
        max_freq = max(counts.values())
        # How many letters tie for the highest count
        max_count = sum(1 for c in counts.values() if c == max_freq)

        # (max_freq - 1) gaps of size n + 1, plus one final slot per tied letter
        formula = (max_freq - 1) * (n + 1) + max_count
        # If there are more tasks than the layout holds, no idle time is needed
        return max(len(tasks), formula)
