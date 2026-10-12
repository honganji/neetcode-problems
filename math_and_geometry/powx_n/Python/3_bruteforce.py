import math


def my_pow(x: float, n: int) -> float:
    result = 1.0
    # Multiply x by itself |n| times.
    for _ in range(abs(n)):
        result *= x

    if n < 0:
        return float("inf") if result == 0 else 1 / result
    return result
