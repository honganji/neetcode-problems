def find_target_sum_ways(nums: list[int], target: int) -> int:
    def backtrack(i: int, current: int) -> int:
        if i == len(nums):
            return 1 if current == target else 0
        # give nums[i] a "+" sign, then a "-" sign
        return backtrack(i + 1, current + nums[i]) + backtrack(i + 1, current - nums[i])

    return backtrack(0, 0)
