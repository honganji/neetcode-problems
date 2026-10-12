def is_happy(n: int) -> bool:
    # Every unhappy number gets stuck in the loop 4 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4,
    # so we can stop as soon as we reach 1 (happy) or 4 (unhappy).
    while n != 1 and n != 4:
        n = digit_square_sum(n)
    return n == 1


def digit_square_sum(n: int) -> int:
    total = 0
    while n:
        n, digit = divmod(n, 10)
        total += digit * digit
    return total
