# Plus One — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Carry Propagation — `1_carry.kt`

Only the last digit gets +1 at first. If it was below 9, it simply goes up by one and we are done. If it was 9, it becomes 0 and the "+1" carries into the digit on its left, which is handled the same way. The loop stops at the first digit that is not 9. If every digit was 9, the carry falls off the front, so the answer starts with a new 1 followed by zeros. The input array is changed in place, so a new array is only created when the carry runs off the front.

- Time: O(n)
- Space: O(1) extra (O(n) for the new array only when all digits are 9)

## 2. Big Integer Arithmetic — `2_bigint.kt`

`java.math.BigInteger` has no size limit. Join the digits into a string, build a `BigInteger`, add `BigInteger.ONE`, and split the result back into digits. This skips the digit-by-digit reasoning and uses the built-in arbitrary-precision type. It is short, but converting between strings and numbers costs more than a single pass over the digits.

- Time: O(n²) in practice, because the string-to-`BigInteger` conversion is quadratic
- Space: O(n) for the string and the new array
