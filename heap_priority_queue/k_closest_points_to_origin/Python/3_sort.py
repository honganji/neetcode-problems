def k_closest(points: list[list[int]], k: int) -> list[list[int]]:
    # Squared distance orders points the same way as real distance, so no sqrt is needed.
    ordered = sorted(points, key=lambda p: p[0] * p[0] + p[1] * p[1])
    return ordered[:k]
