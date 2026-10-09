def min_eating_speed(piles: list[int], h: int) -> int:
    def can_finish(k: int) -> bool:
        hours = 0
        for pile in piles:
            hours += (pile + k - 1) // k
            if hours > h:
                return False
        return True

    low, high = 1, max(piles)
    while low < high:
        mid = (low + high) // 2
        if can_finish(mid):
            high = mid
        else:
            low = mid + 1
    return low
