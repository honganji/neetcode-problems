from typing import List


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # Compress values to ranks 1..m so they can index the Fenwick tree.
        ranks = {v: i + 1 for i, v in enumerate(sorted(set(nums)))}
        m = len(ranks)
        # tree[i] holds the best subsequence length over a range of ranks.
        tree = [0] * (m + 1)

        best = 0
        for x in nums:
            r = ranks[x]

            # Best length among smaller values (ranks 1..r-1).
            cur = 0
            i = r - 1
            while i > 0:
                cur = max(cur, tree[i])
                i -= i & -i

            length = cur + 1

            # Record this length at rank r.
            i = r
            while i <= m:
                tree[i] = max(tree[i], length)
                i += i & -i

            best = max(best, length)
        return best
