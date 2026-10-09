def last_stone_weight(stones: list[int]) -> int:
    stones = stones[:]  # work on a copy so the caller's list is untouched

    while len(stones) > 1:
        heaviest = max(stones)
        stones.remove(heaviest)
        second = max(stones)
        stones.remove(second)
        if heaviest != second:
            stones.append(heaviest - second)

    return stones[0] if stones else 0
