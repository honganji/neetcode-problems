from typing import List


class Solution:
    def maxCoins(self, nums: List[int]) -> int:
        n = len(nums)
        # best[mask] = max coins from bursting exactly the balloons still set in mask.
        best = [0] * (1 << n)

        for mask in range(1, 1 << n):
            total = 0
            for i in range(n):
                if ((mask >> i) & 1) == 0:
                    continue
                # Neighbors are the nearest balloons still alive on each side (or 1).
                left = 1
                for j in range(i - 1, -1, -1):
                    if ((mask >> j) & 1) == 1:
                        left = nums[j]
                        break
                right = 1
                for j in range(i + 1, n):
                    if ((mask >> j) & 1) == 1:
                        right = nums[j]
                        break
                # Burst i now, then solve the rest; remaining mask is smaller, so already computed.
                rest = mask ^ (1 << i)
                total = max(total, left * nums[i] * right + best[rest])
            best[mask] = total

        return best[(1 << n) - 1]
