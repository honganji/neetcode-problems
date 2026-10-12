# Multiply Strings — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Number-theoretic transform (NTT) — `1_ntt.kt`

Multiplying two numbers digit by digit is really a convolution of their digit lists, and the number-theoretic transform (NTT) computes convolutions quickly. It turns each digit list into a different representation, multiplies the two representations point by point, and transforms back. All the arithmetic is exact integer math modulo 998244353, so there are no rounding errors. The result still needs carrying, just like on paper. This has the best time complexity, but its setup cost means the simpler methods run faster at these sizes (up to 200 digits).

- Time: O((m + n) log(m + n)), where m and n are the lengths of `num1` and `num2`
- Space: O(m + n)

## 2. Karatsuba (divide and conquer) — `2_karatsuba.kt`

Split each number into a high half and a low half, so `x = high * 10^m + low`. Multiplying the halves the normal way takes four half-size products. Karatsuba notices that the cross terms can be found from `(a_high + a_low) * (b_high + b_low)` minus the two products it already needs, so only three smaller products are required. Applying this recursively shrinks the work at every level. The helper functions do string addition, subtraction, and shifting by powers of ten.

- Time: O(n^1.585), where n is the longer length
- Space: O(n)

## 3. Digit array (long multiplication) — `3_digit_array.kt`

Multiply the way you learned in school. Every digit of `num1` is multiplied by every digit of `num2`. The product of the digits at positions `i` and `j` always lands in the two places `i + j` and `i + j + 1` of the result, so add it there and carry any overflow to the left.

- Time: O(m * n), where m and n are the lengths of `num1` and `num2`
- Space: O(m + n)
