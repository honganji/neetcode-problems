def two_sum(numbers: list[int], target: int) -> list[int]:
    for i in range(len(numbers)):
        complement = target - numbers[i]
        low, high = i + 1, len(numbers) - 1
        while low <= high:
            mid = (low + high) // 2
            if numbers[mid] == complement:
                return [i + 1, mid + 1]
            if numbers[mid] < complement:
                low = mid + 1
            else:
                high = mid - 1
    return []
