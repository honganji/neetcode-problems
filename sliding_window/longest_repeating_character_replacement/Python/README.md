# Longest Repeating Character Replacement — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Sliding Window + Running Max Frequency — `1_sliding_window_max_freq.py`

A window is "fixable" when the number of characters that are *not* the most
common letter is at most `k`, i.e. `length - maxFreq <= k`. Grow the window
one character at a time, keeping 26 counts and a running `maxFreq`. When the
window stops being fixable, drop one character from the left — so the window
never shrinks, it only slides forward at its current size.

The subtle part is that `maxFreq` is never decreased when a character leaves,
so it can be stale and too large. That is still correct: the answer is the
largest window size ever reached, and a window can only get bigger than the
best so far when a genuinely larger `maxFreq` appears. A stale `maxFreq` just
lets the window coast at a size it already earned earlier; it can never make
the window grow beyond what some real frequency justified.

- Time: O(n)
- Space: O(1) — the count array has a fixed 26 slots

## 2. Sliding Window + Recomputed Max — `2_sliding_window_recompute_max.py`

Same window and same `length - maxFreq <= k` test, but instead of trusting a
running maximum, scan the 26 counts for the true maximum each time you need
to decide whether to shrink. Because the maximum is always exact, the window
really does shrink until it is valid, and the correctness argument is the
plain one: every window you measure is a window you could actually fix. This
is the easier version to reason about, at the cost of a constant factor of 26.

- Time: O(26n), which is O(n)
- Space: O(1)

## 3. Brute Force — `3_bruteforce.py`

For every starting position, extend the substring to the right one character
at a time, keeping counts and the most common letter so far. Keep extending
while `length - maxCount <= k`; the moment the substring needs more than `k`
replacements, stop, because extending it further only adds more characters
to fix. Record the longest valid length seen from any start.

- Time: O(n²)
- Space: O(1) — one 26-slot count array per start, reused
