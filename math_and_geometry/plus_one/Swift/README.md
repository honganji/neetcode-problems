# Plus One — Swift

Solutions ordered from most to least efficient.

Only one solution is included. Swift's standard library has no arbitrary-precision integer type, and Foundation's `Decimal` keeps only about 38 digits, which is too few for inputs of up to 100 digits. The big-integer approach from the other languages therefore does not carry over to Swift.

## 1. ⭐ Carry Propagation — `1_carry.swift`

Only the last digit gets +1 at first. If it was below 9, it simply goes up by one and we are done. If it was 9, it becomes 0 and the "+1" carries into the digit on its left, which is handled the same way. The loop stops at the first digit that is not 9. If every digit was 9, the carry falls off the front, so the answer starts with a new 1 followed by zeros. The function copies the input array first, so the caller's array is not changed.

- Time: O(n)
- Space: O(n) for the copy and the result (O(1) extra beyond the copy)
