def find_median_sorted_arrays(nums1: list[int], nums2: list[int]) -> float:
    a, b = nums1, nums2
    if len(a) > len(b):
        a, b = b, a
    m, n = len(a), len(b)
    half = (m + n + 1) // 2
    low, high = 0, m
    while low <= high:
        i = (low + high) // 2
        j = half - i
        max_left_a = a[i - 1] if i > 0 else float("-inf")
        min_right_a = a[i] if i < m else float("inf")
        max_left_b = b[j - 1] if j > 0 else float("-inf")
        min_right_b = b[j] if j < n else float("inf")
        if max_left_a <= min_right_b and max_left_b <= min_right_a:
            max_left = max(max_left_a, max_left_b)
            if (m + n) % 2 == 1:
                return float(max_left)
            min_right = min(min_right_a, min_right_b)
            return (max_left + min_right) / 2
        if max_left_a > min_right_b:
            high = i - 1
        else:
            low = i + 1
    return 0.0
