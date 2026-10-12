def my_pow(x: float, n: int) -> float:
    if n < 0:
        if x == 0:
            return float("inf")
        x = 1 / x
        n = -n

    result = 1.0
    while n:
        # If the lowest bit of n is set, this power of x is part of the answer.
        if n & 1:
            result *= x
        # Squaring x doubles the exponent it represents.
        x *= x
        n >>= 1
    return result
