# Minimum Window Substring — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Sliding Window (have / need) — `1_sliding_window_have_need.py`

First count how many of each character `t` needs. Then slide a window over
`s` with two pointers: push the right edge forward one character at a time,
counting what is inside the window. Instead of comparing whole count tables,
keep a single number `have` — how many distinct characters currently meet
their required count — and compare it to `need`, the number of distinct
characters in `t`. The moment `have == need` the window is valid, so pull the
left edge in as far as it can go while staying valid, recording the shortest
window seen. Each pointer only ever moves forward, so the whole thing is one
pass.

- Time: O(|s| + |t|)
- Space: O(alphabet) for the two count tables

## 2. Sliding Window (missing counter) — `2_sliding_window_missing_count.py`

The same two-pointer window as #1, written more compactly. Keep one count
table seeded with `t`'s characters and a single `missing` counter that starts
at `|t|`. When the right edge takes in a character whose count is still
positive, that character was genuinely needed, so `missing` drops by one; the
count is decremented either way, so surplus characters go negative. When
`missing` hits zero the window is valid — shrink from the left, and if giving a
character back pushes its count above zero it was needed, so `missing` goes
back up. Same complexity as #1 with less bookkeeping, at the cost of being a
little less obvious to read.

- Time: O(|s| + |t|)
- Space: O(alphabet) for the single count table

## 3. Brute Force — `3_bruteforce.py`

Try every starting position in `s`. From each one, extend to the right with a
fresh copy of `t`'s counts, ticking off characters until everything in `t` is
covered; that gives the shortest valid window beginning at that start. Keep the
shortest one overall. Two small shortcuts keep it from being hopeless: stop
extending once the window is already as long as the best found so far, and
stop trying new starts once fewer than `|t|` characters remain.

- Time: O(|s|²)
- Space: O(alphabet) for the count table copied per start
