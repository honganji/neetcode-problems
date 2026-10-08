def three_sum(nums: list[int]) -> list[list[int]]:
    nums.sort()
    triplets = set()
    for i in range(len(nums) - 2):
        for j in range(i + 1, len(nums) - 1):
            for k in range(j + 1, len(nums)):
                if nums[i] + nums[j] + nums[k] == 0:
                    triplets.add((nums[i], nums[j], nums[k]))
    return [list(t) for t in triplets]
