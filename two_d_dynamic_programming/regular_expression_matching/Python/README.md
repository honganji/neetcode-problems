# Regular Expression Matching — Python

Solutions ordered from most to least efficient. Solutions 1 and 2 have the same
complexity; 1 is ranked first because it is the most direct DP.

## 1. ⭐ Bottom-up DP — `1_bottom_up_dp.py`

Let `dp[i][j]` be true when `s[i:]` matches `p[j:]`. Fill the table from the end of both
strings, so each answer only depends on answers for shorter suffixes. When `p[j+1]` is `*`,
there are two options: skip `p[j]*` entirely (`dp[i][j+2]`), or, if `p[j]` matches `s[i]`,
use up one character and stay on the same `p[j]*` (`dp[i+1][j]`). Each row only depends on
the row below it, so two rows are enough instead of the full table.

- Time: O(m·n), where m = len(s) and n = len(p)
- Space: O(n)

## 2. NFA simulation — `2_nfa_simulation.py`

Treat the pattern as a small state machine. State `j` means "next we must match `p[j]`",
and state `n` means "the whole pattern is consumed". A `x*` token gives two free moves: it can
be skipped (jump over it), and while it is active it can eat any number of matching
characters. Read `s` one character at a time, keeping the set of all states we could
currently be in. The string matches if the final set contains state `n`. Nothing is
backtracked, because every state set is built once per character.

- Time: O(m·n), since each of the m characters visits at most n states
- Space: O(n) for the current and next state sets

## 3. Backtracking — `3_backtracking.py`

Walk both strings from the front. If the next pattern token is followed by `*`, try two
choices: skip the token with zero matches, or match one character and stay on the same
token. Otherwise match one character and move forward in both strings. Nothing is cached,
so the same `(i, j)` position can be explored many times. It is short and easy to check,
but it gets very slow on patterns like `a*a*a*a*b`.

- Time: O(2^(m+n)) worst case (exponential)
- Space: O(m+n) for the recursion depth
