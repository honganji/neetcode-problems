MOD = 998244353  # prime of the form c * 2^k + 1, so the roots of unity we need exist
ROOT = 3  # primitive root modulo MOD


def multiply(num1: str, num2: str) -> str:
    if num1 == "0" or num2 == "0":
        return "0"

    # Little-endian digits: index 0 is the ones place.
    a = [int(c) for c in reversed(num1)]
    b = [int(c) for c in reversed(num2)]

    size = 1
    while size < len(a) + len(b):
        size *= 2
    a += [0] * (size - len(a))
    b += [0] * (size - len(b))

    # Multiplying digit lists is a convolution; the transform makes it a pointwise product.
    fa = _ntt(a, invert=False)
    fb = _ntt(b, invert=False)
    c = _ntt([x * y % MOD for x, y in zip(fa, fb)], invert=True)

    # Each position may hold a value above 9, so carry it to the next place.
    digits = []
    carry = 0
    for value in c:
        carry += value
        digits.append(carry % 10)
        carry //= 10
    while carry:
        digits.append(carry % 10)
        carry //= 10

    while len(digits) > 1 and digits[-1] == 0:
        digits.pop()
    return "".join(str(d) for d in reversed(digits))


def _ntt(arr: list[int], invert: bool) -> list[int]:
    n = len(arr)
    # Reorder entries into bit-reversed order.
    j = 0
    for i in range(1, n):
        bit = n >> 1
        while j & bit:
            j ^= bit
            bit >>= 1
        j ^= bit
        if i < j:
            arr[i], arr[j] = arr[j], arr[i]

    length = 2
    while length <= n:
        w = pow(ROOT, (MOD - 1) // length, MOD)
        if invert:
            w = pow(w, MOD - 2, MOD)
        half = length // 2
        for start in range(0, n, length):
            wn = 1
            for k in range(half):
                u = arr[start + k]
                v = arr[start + k + half] * wn % MOD
                arr[start + k] = (u + v) % MOD
                arr[start + k + half] = (u - v + MOD) % MOD
                wn = wn * w % MOD
        length <<= 1

    if invert:
        inv_n = pow(n, MOD - 2, MOD)
        return [x * inv_n % MOD for x in arr]
    return arr
