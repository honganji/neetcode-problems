import bisect


def last_stone_weight(stones: list[int]) -> int:
    ordered = sorted(stones)  # ascending, so the heaviest stones are at the end

    while len(ordered) > 1:
        heaviest = ordered.pop()
        second = ordered.pop()
        if heaviest != second:
            # insert the difference at its sorted position
            bisect.insort(ordered, heaviest - second)

    return ordered[0] if ordered else 0
