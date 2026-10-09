# Edit Distance — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Banded DP (Ukkonen) — `1_banded_dp.py`

Matching the two strings is a grid of choices, and the cheapest route through the grid stays close to the main diagonal. Every step away from the diagonal costs at least one edit, so if the answer is `d`, the best path never strays more than `d` cells from it. This solution fills only a narrow band of cells around the diagonal, starting with a band as wide as the length difference, and doubles the band until the answer fits inside it. Similar strings have a small answer, so most of the table is never touched.

- Time: O(m · d), where `d` is the answer (worst case O(m · n) when the strings are very different)
- Space: O(n)

## 2. DP table — `2_dp_table.py`

Build a table where `dp[i][j]` is the number of edits needed to turn the first `i` characters of `word1` into the first `j` characters of `word2`. If the last characters match, nothing is spent, so copy the diagonal value. Otherwise, take 1 plus the cheapest of replace, delete, or insert. Fill the table row by row, then read the bottom-right corner.

Only the previous row is ever read, so the table can be shrunk to two rows. That changes memory, not the idea.

- Time: O(m · n)
- Space: O(m · n) (O(n) with two rows)

## 3. Brute-force recursion — `3_bruteforce.py`

At each position, try every option: if the characters match, move on for free. If not, try replace, delete, and insert, and keep the cheapest. Nothing is remembered between calls, so the same sub-problems get solved again and again. It is correct but far too slow for the longest inputs. Python's default recursion limit (1000) can also be hit on long strings.

- Time: O(3^(m + n)) (exponential)
- Space: O(m + n) for the recursion stack
