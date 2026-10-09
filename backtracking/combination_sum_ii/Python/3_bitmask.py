from typing import List


class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        n = len(candidates)
        found = set()
        # Each mask is one subset: bit i set means candidates[i] is used
        for mask in range(1, 1 << n):
            combo = []
            total = 0
            for i in range(n):
                if ((mask >> i) & 1) == 1:
                    combo.append(candidates[i])
                    total += candidates[i]
            if total == target:
                found.add(tuple(sorted(combo)))
        return [list(combo) for combo in found]
