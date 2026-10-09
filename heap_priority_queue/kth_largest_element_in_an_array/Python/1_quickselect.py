import random


def find_kth_largest(nums: list[int], k: int) -> int:
    # In sorted order, the kth largest sits at index len - k.
    target = len(nums) - k
    lo, hi = 0, len(nums) - 1
    while True:
        pivot = nums[random.randint(lo, hi)]
        # 3-way partition: smaller values go left, equal values stay in the middle,
        # larger values go right. Equal values are grouped so duplicates are fine.
        lt, i, gt = lo, lo, hi
        while i <= gt:
            if nums[i] < pivot:
                nums[lt], nums[i] = nums[i], nums[lt]
                lt += 1
                i += 1
            elif nums[i] > pivot:
                nums[i], nums[gt] = nums[gt], nums[i]
                gt -= 1
            else:
                i += 1
        # Only one side can contain the target, so we keep searching just that side.
        if target < lt:
            hi = lt - 1
        elif target > gt:
            lo = gt + 1
        else:
            return pivot
