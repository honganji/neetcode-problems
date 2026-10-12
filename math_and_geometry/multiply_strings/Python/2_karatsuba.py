def multiply(num1: str, num2: str) -> str:
    return _karatsuba(num1, num2)


def _karatsuba(a: str, b: str) -> str:
    if a == "0" or b == "0":
        return "0"
    if len(a) == 1 and len(b) == 1:
        return str(int(a) * int(b))

    # Split both numbers at the same place m from the right: x = high * 10^m + low.
    m = max(len(a), len(b)) // 2
    a_high, a_low = (a[:-m] or "0"), _strip(a[-m:])
    b_high, b_low = (b[:-m] or "0"), _strip(b[-m:])

    # Only three recursive products are needed instead of four.
    z_high = _karatsuba(a_high, b_high)
    z_low = _karatsuba(a_low, b_low)
    # (a_high + a_low)(b_high + b_low) contains the cross terms, and subtracting the others leaves them.
    z_mid = _karatsuba(_add(a_high, a_low), _add(b_high, b_low))
    z_mid = _sub(_sub(z_mid, z_high), z_low)

    return _add(_add(_shift(z_high, 2 * m), _shift(z_mid, m)), z_low)


def _strip(s: str) -> str:
    i = 0
    while i < len(s) - 1 and s[i] == "0":
        i += 1
    return s[i:]


def _shift(s: str, k: int) -> str:
    # Multiplying by 10^k appends k zeros.
    return s if s == "0" else s + "0" * k


def _add(a: str, b: str) -> str:
    digits = []
    carry = 0
    i, j = len(a) - 1, len(b) - 1
    while i >= 0 or j >= 0 or carry:
        total = carry
        if i >= 0:
            total += int(a[i])
            i -= 1
        if j >= 0:
            total += int(b[j])
            j -= 1
        digits.append(str(total % 10))
        carry = total // 10
    return "".join(reversed(digits))


def _sub(a: str, b: str) -> str:
    # Requires a >= b.
    digits = []
    borrow = 0
    i, j = len(a) - 1, len(b) - 1
    while i >= 0:
        diff = int(a[i]) - borrow
        i -= 1
        if j >= 0:
            diff -= int(b[j])
            j -= 1
        borrow = 1 if diff < 0 else 0
        digits.append(str(diff + 10 if diff < 0 else diff))
    return _strip("".join(reversed(digits)))
