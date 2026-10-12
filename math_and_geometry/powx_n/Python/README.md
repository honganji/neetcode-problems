# Pow(x, n) — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Exponentiation — `1_binary_exponentiation.py`

Any power can be built from squares. Write `n` in binary: for `x^13`, 13 is `1101`,
so `x^13 = x^8 · x^4 · x^1`. Repeatedly square `x` (giving `x, x², x⁴, x⁸, …`) and
multiply it into the answer only when the matching bit of `n` is 1. Each step halves
`n`, so there are only about 31 steps. A negative `n` is handled by using `1/x`
and the positive exponent.

- Time: O(log n)
- Space: O(1)

## 2. Logarithm — `2_logarithm.py`

Use the identity `x^n = e^(n · ln|x|)`. The whole power becomes one multiplication,
one `log`, and one `exp`, so it runs in constant time. The sign is set separately
(a negative `x` only gives a negative result for an odd `n`). Zero and overflow need
special cases because `log(0)` is undefined and `exp` can overflow.

This is the fastest on paper (O(1)), but it is ranked second because the result is a
floating-point approximation, not an exact product. It is accurate enough for the
tolerance the problem allows, but it is less reliable than binary exponentiation.

- Time: O(1)
- Space: O(1)

## 3. Repeated Multiplication — `3_bruteforce.py`

The definition of a power: multiply `x` by itself `|n|` times. If `n` is negative,
take the reciprocal at the end. It is simple and always correct, but it does one
multiplication per unit of `n`. With `n` up to about 2 billion, that is far too slow,
so it is mainly useful as a baseline to understand the problem.

- Time: O(|n|)
- Space: O(1)
