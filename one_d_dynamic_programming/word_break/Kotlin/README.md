# Word Break — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Trie + forward DP — `1_trie_dp.kt`

Put every dictionary word into a trie (a prefix tree), so one walk from a position
finds all words that start there. We track which prefixes `s[:i]` can be split.
When a prefix is reachable, we walk the trie from that spot and mark every word
end we hit as reachable. A walk stops as soon as the trie has no matching branch,
so each walk is at most as long as the longest word.

- Time: O(T + n · L) — T is the total length of all words, n is `s.length`, L is the longest word
- Space: O(T + n)

## 2. Hash set + bottom-up DP — `2_hashset_dp.kt`

`canReach[i]` is true when `s[:i]` can be split. To decide `canReach[i]`, look
back at most `maxLen` positions. For each start `j`, check whether `s.substring(j, i)`
is a word using a hash set. If `canReach[j]` is also true, then `s[:i]` is splittable.

- Time: O(T + n · L²) — each set lookup builds a substring of up to L characters
- Space: O(T + n)

## 3. Backtracking (no memo) — `3_backtracking.kt`

From a position, try every word that matches there and recurse on the rest of the
string. If any path reaches the end, return true. There is no memo, so the same
suffix can be solved again and again. For strings like `"aaaa…ab"` with words such as
`"a"` and `"aa"`, the number of paths grows exponentially.

- Time: O(2ⁿ · m · L) worst case — m is the dictionary size
- Space: O(n) for the recursion stack
