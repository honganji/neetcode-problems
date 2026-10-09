def min_eating_speed(piles: list[int], h: int) -> int:
    k = 1
    while True:
        hours = 0
        for pile in piles:
            hours += (pile + k - 1) // k
            if hours > h:
                break
        if hours <= h:
            return k
        k += 1
