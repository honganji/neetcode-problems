# Longest Palindromic Substring — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Manacher's algorithm — `1_manacher.swift`

Insert a `#` between every character (and at both ends), so even-length and odd-length palindromes both become odd-length. Then scan left to right, remembering the palindrome that reaches furthest to the right. When a new center falls inside that palindrome, its mirror image on the left already tells us how far its palindrome reaches, so we start from that value instead of from scratch. Only the parts that extend past the known palindrome are checked character by character, so each character is compared only a constant number of times.

- Time: O(n)
- Space: O(n)

## 2. Expand around center — `2_expand_around_center.swift`

Every palindrome has a center: a single character (odd length) or the gap between two characters (even length). There are only about 2n such centers. From each one, move outward while the characters on both sides match, and keep the longest palindrome seen. This is simple and needs no extra memory, but for a string like `aaaa...a` each center may expand almost to the edge.

- Time: O(n²)
- Space: O(1)

## 3. Dynamic programming table — `3_dp_table.swift`

Let `dp[i][j]` be true when `s[i..j]` is a palindrome. That holds when the two end characters match and the inside `s[i+1..j-1]` is itself a palindrome (or is only one or two characters long). Fill the table by starting index from right to left, so the inner entry is always ready before it is needed, and record the longest true entry. It is correct and easy to reason about, but the table uses quadratic memory.

- Time: O(n²)
- Space: O(n²)
