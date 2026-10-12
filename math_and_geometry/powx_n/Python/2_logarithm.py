import math


def my_pow(x: float, n: int) -> float:
    if n == 0:
        return 1.0
    if x == 0:
        return 0.0 if n > 0 else float("inf")

    # x^n = e^(n * ln|x|), so the power becomes one multiply and one exp.
    try:
        magnitude = math.exp(n * math.log(abs(x)))
    except OverflowError:
        magnitude = float("inf")

    # An odd power of a negative number stays negative.
    negative = x < 0 and n % 2 != 0
    return -magnitude if negative else magnitude
