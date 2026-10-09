from collections import Counter


def find_target_sum_ways(nums: list[int], target: int) -> int:
    half = len(nums) // 2
    left, right = nums[:half], nums[half:]

    def all_signed_sums(values: list[int]) -> list[int]:
        sums = [0]
        for v in values:
            # every sum so far can take either +v or -v
            sums = [s + v for s in sums] + [s - v for s in sums]
        return sums

    # For each right-half sum, the left half must produce target - that sum.
    left_counts = Counter(all_signed_sums(left))
    return sum(left_counts[target - s] for s in all_signed_sums(right))
