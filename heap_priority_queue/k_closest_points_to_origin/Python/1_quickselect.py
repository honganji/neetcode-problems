import random


def k_closest(points: list[list[int]], k: int) -> list[list[int]]:
    def dist(p: list[int]) -> int:
        return p[0] * p[0] + p[1] * p[1]

    left, right = 0, len(points) - 1
    while left <= right:
        # Pick a random pivot and move it to the end of the range.
        pivot_idx = random.randint(left, right)
        pivot = dist(points[pivot_idx])
        points[pivot_idx], points[right] = points[right], points[pivot_idx]

        # Move every point closer than the pivot to the front of the range.
        store = left
        for i in range(left, right):
            if dist(points[i]) < pivot:
                points[store], points[i] = points[i], points[store]
                store += 1

        # The pivot is now in its final place; everything before it is closer.
        points[store], points[right] = points[right], points[store]

        if store == k:
            break
        if store < k:
            left = store + 1
        else:
            right = store - 1

    return points[:k]
