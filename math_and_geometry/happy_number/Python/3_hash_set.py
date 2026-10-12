def is_happy(n: int) -> bool:
    # If we ever repeat a number, the chain is looping and can never reach 1.
    seen = set()
    while n != 1:
        if n in seen:
            return False
        seen.add(n)
        n = digit_square_sum(n)
    return True


def digit_square_sum(n: int) -> int:
    total = 0
    while n:
        n, digit = divmod(n, 10)
        total += digit * digit
    return total
