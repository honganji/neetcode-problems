def find_kth_largest(nums: list[int], k: int) -> int:
    # Sorted ascending, the kth largest is k positions from the end.
    return sorted(nums)[-k]
