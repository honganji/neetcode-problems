from typing import List


class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        # Every node starts out labeled with its own number.
        label = list(range(n))

        # Keep letting edge endpoints adopt the smaller label until nothing changes.
        changed = True
        while changed:
            changed = False
            for a, b in edges:
                low = min(label[a], label[b])
                if label[a] != low or label[b] != low:
                    label[a] = label[b] = low
                    changed = True

        # Each component ends up labeled with its smallest node,
        # so the nodes still holding their own number are one per component.
        return sum(1 for i in range(n) if label[i] == i)
