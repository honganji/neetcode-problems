def find_median_sorted_arrays(nums1: list[int], nums2: list[int]) -> float:
    total = len(nums1) + len(nums2)
    i, j = 0, 0
    prev, curr = 0, 0
    for _ in range(total // 2 + 1):
        prev = curr
        if j >= len(nums2) or (i < len(nums1) and nums1[i] <= nums2[j]):
            curr = nums1[i]
            i += 1
        else:
            curr = nums2[j]
            j += 1
    if total % 2 == 1:
        return float(curr)
    return (prev + curr) / 2
