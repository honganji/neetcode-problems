# Generate Parentheses — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking — `1_backtracking.swift`

Build the string one character at a time and only ever take steps that can
still lead to a valid answer. You may add an opening parenthesis as long as
you have not used all `n` of them, and you may add a closing parenthesis only
if there is an unmatched opening one waiting for it. Those two rules make it
impossible to write something like `)(` or `(((` with no way to recover,
so every string that reaches length `2n` is well-formed. After exploring one
choice, remove the character and try the other — that undo step is what
"backtracking" means.

- Time: O(4ⁿ / √n), proportional to the number of valid strings produced
- Space: O(n) for the recursion stack and the string being built

## 2. Closure Number (Dynamic Programming) — `2_closure_number.swift`

Every well-formed string starts with an opening parenthesis, and that
parenthesis is closed somewhere. Whatever sits between that pair is itself a
well-formed string, and whatever comes after the closing parenthesis is too.
So every answer for `n` pairs looks like `(A)B` where `A` uses `i` pairs
and `B` uses the remaining `n - 1 - i`. Build a table of answers for 0, 1,
2, ... pairs and combine earlier rows to produce each new one until you reach
`n`.

- Time: O(4ⁿ / √n), each result string is assembled once
- Space: O(4ⁿ / √n) to keep the table of answers for every smaller size

## 3. Brute Force — `3_bruteforce.swift`

Treat each of the `2n` positions as a bit: 1 means `(` and 0 means `)`.
Counting from 0 up to `2^(2n) - 1` enumerates every possible string. For
each one, scan left to right keeping a running balance (+1 for opening, -1 for
closing); if the balance ever dips below zero a closing parenthesis came too
early, and if it does not end at zero the counts do not match. Keep only the
strings that pass both checks.

- Time: O(2^(2n) · n) to generate and validate every candidate
- Space: O(n) for the candidate being checked
