def merge_triplets(triplets: list[list[int]], target: list[int]) -> bool:
    x, y, z = target
    best_a = best_b = best_c = 0
    for a, b, c in triplets:
        # A triplet larger than the target in any position can never be used.
        if a <= x and b <= y and c <= z:
            best_a = max(best_a, a)
            best_b = max(best_b, b)
            best_c = max(best_c, c)
    return best_a == x and best_b == y and best_c == z
