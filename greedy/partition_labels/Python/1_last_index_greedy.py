from typing import List


class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # Remember where each letter appears last.
        last = {c: i for i, c in enumerate(s)}

        result = []
        start = 0  # where the current part begins
        end = 0    # furthest last-occurrence seen in the current part

        for i, c in enumerate(s):
            end = max(end, last[c])
            # Every letter seen so far ends inside this part, so cut here.
            if i == end:
                result.append(end - start + 1)
                start = i + 1

        return result
