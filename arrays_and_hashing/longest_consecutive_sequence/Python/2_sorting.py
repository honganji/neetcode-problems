def longest_consecutive(nums: list[int]) -> int:
    if not nums:
        return 0
    sorted_nums = sorted(nums)
    longest = 1
    length = 1
    for i in range(1, len(sorted_nums)):
        if sorted_nums[i] == sorted_nums[i - 1]:
            continue
        if sorted_nums[i] == sorted_nums[i - 1] + 1:
            length += 1
        else:
            length = 1
        longest = max(longest, length)
    return longest
