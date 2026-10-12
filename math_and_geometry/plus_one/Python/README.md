# Plus One — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Carry Propagation — `1_carry.py`

Only the last digit gets +1 at first. If it was below 9, it simply goes up by one and we are done. If it was 9, it becomes 0 and the "+1" carries into the digit on its left, which is handled the same way. The loop stops at the first digit that is not 9. If every digit was 9, the carry falls off the front, so the answer starts with a new 1 followed by zeros. The input list is changed in place, so no new list is needed unless the carry runs off the front.

- Time: O(n)
- Space: O(1) extra (O(n) for the new list only when all digits are 9)

## 2. Big Integer Arithmetic — `2_bigint.py`

Python integers have no size limit. Join the digits into a string, turn it into an integer, add 1, and split the result back into digits. This skips the digit-by-digit reasoning entirely and leans on the language's built-in arbitrary-precision arithmetic. It is short and easy to trust, but converting between strings and integers costs more than a single pass over the digits.

- Time: O(n²) in practice, because base-10 string-to-int conversion is quadratic in CPython
- Space: O(n) for the string and the new list
