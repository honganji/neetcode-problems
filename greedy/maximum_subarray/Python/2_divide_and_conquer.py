from typing import List


class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        def solve(lo: int, hi: int) -> int:
            # Best subarray that lies entirely within nums[lo..hi].
            if lo == hi:
                return nums[lo]
            mid = (lo + hi) // 2

            # Best subarray crossing the middle that ends at mid (left side).
            left_best = running = nums[mid]
            for i in range(mid - 1, lo - 1, -1):
                running += nums[i]
                left_best = max(left_best, running)

            # Best subarray crossing the middle that starts at mid + 1 (right side).
            right_best = running = nums[mid + 1]
            for i in range(mid + 2, hi + 1):
                running += nums[i]
                right_best = max(right_best, running)

            return max(solve(lo, mid), solve(mid + 1, hi), left_best + right_best)

        return solve(0, len(nums) - 1)
