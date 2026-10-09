# Palindromic Substrings — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Manacher's algorithm — `1_manachers.dart`

Every palindrome has a center, and each center can be expanded outward as far as the characters keep matching. Manacher's algorithm avoids re-checking characters that are already known. It keeps track of the palindrome that reaches furthest to the right. When a new center falls inside that palindrome, its mirror position on the left already has a known radius, so that answer can be copied (capped at the edge) instead of recomputed. Only the parts that extend past the right edge are checked character by character. The right edge only moves forward, so the total work stays linear. Odd and even centers are handled in two passes, and the answer is the sum of the radii.

- Time: O(n)
- Space: O(n)

## 2. Expand around center — `2_expand_around_center.dart`

Every palindrome has a middle. For odd-length palindromes the middle is a character, and for even-length ones it is the gap between two characters. That gives 2n - 1 possible centers. From each center, step outward while the characters on both sides match. Each successful step is one more palindrome, and the walk stops at the first mismatch. This is simple and needs no extra memory, but when many characters match (for example, all the same letter), each center can expand almost the full length of the string.

- Time: O(n²)
- Space: O(1)

## 3. DP table — `3_dp_table.dart`

Build a table where `dp[i][j]` is true when `s[i..j]` is a palindrome. A substring is a palindrome when its two ends match and the part inside them is also a palindrome. Substrings of length 0 or 1 are always palindromes. Fill the table from the right side of the string toward the left, so the inside of each substring is always ready when it is needed. Then count the true entries. Each substring is checked once, but storing the whole table takes n² memory.

- Time: O(n²)
- Space: O(n²)
