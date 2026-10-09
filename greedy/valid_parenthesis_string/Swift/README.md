# Valid Parenthesis String — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Greedy Range — `1_greedy_range.swift`

Instead of guessing how each `*` is used, track a range. `lo` is the fewest `(` that could still be open, and `hi` is the most. A `(` raises both, and a `)` lowers both. A `*` lowers `lo` (it closes one) and raises `hi` (it opens one). If `hi` ever goes below 0, even the most generous choice has no `(` left for some `)`, so the answer is false. `lo` is floored at 0 because a `*` can always be empty. At the end, the string is valid exactly when `0` is still a possible count, which means `lo == 0`. This is the same idea as tracking every possible open count, squeezed down to just the smallest and largest.

- Time: O(n)
- Space: O(1)

## 2. Two Stacks — `2_two_stacks.swift`

Match brackets the usual way with a stack, but keep the positions of unmatched `(` and of `*` in two separate stacks. Each `)` first uses the latest unmatched `(`. If there is none, it uses a `*`. At the end, each leftover `(` must be closed by a `*` that comes after it. Pairing the latest `(` with the latest `*` checks this, because a `*` placed before a `(` can never close it.

- Time: O(n)
- Space: O(n) for the two stacks

## 3. Interval DP — `3_interval_dp.swift`

Ask a smaller question for every substring: can `chars[i..<j]` be made valid? It can if its first character is a `*` that is empty and the rest is valid. It can also if the first character is `(` (or a `*` used as `(`) that is matched with some later `)` or `*` at position `k`, where the part between them and the part after `k` are both valid. Fill the table from short substrings to long ones, so every smaller answer is ready when it is needed. This is the most general way to think about matching, but it tries every split point, so it is much slower.

- Time: O(n³), with an O(n) split loop for each of the O(n²) substrings
- Space: O(n²) for the table
