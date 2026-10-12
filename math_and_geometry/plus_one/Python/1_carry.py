def plus_one(digits: list[int]) -> list[int]:
    # Walk from the least significant digit and stop at the first digit that can absorb the carry.
    for i in range(len(digits) - 1, -1, -1):
        if digits[i] < 9:
            digits[i] += 1
            return digits
        # A 9 becomes 0 and passes the carry to the digit on its left.
        digits[i] = 0
    # Every digit was 9, so the result gains a leading 1.
    return [1] + digits
