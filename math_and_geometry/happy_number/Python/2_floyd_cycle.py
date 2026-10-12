def is_happy(n: int) -> bool:
    # Treat the chain of numbers like a linked list. slow moves one step, fast moves two.
    # A happy chain ends at the fixed point 1; an unhappy chain loops, so fast catches slow.
    slow = n
    fast = digit_square_sum(n)
    while fast != 1 and slow != fast:
        slow = digit_square_sum(slow)
        fast = digit_square_sum(digit_square_sum(fast))
    return fast == 1


def digit_square_sum(n: int) -> int:
    total = 0
    while n:
        n, digit = divmod(n, 10)
        total += digit * digit
    return total
