# Longest Substring Without Repeating Characters — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Sliding Window + Last Index — `1_sliding_window_last_index.dart`

Keep a window `[left, right]` that never contains a repeat, and a map from
each character to the last position where it was seen. When the character at
`right` was already seen inside the current window, the window can't keep
that older copy, so jump `left` straight to one past it — no need to creep
forward one step at a time. The check "inside the current window" matters: in
`"abba"` the second `a` was last seen at index 0, which is already behind
`left`, so moving `left` back there would wrongly widen the window.

- Time: O(n)
- Space: O(min(n, k)) where k is the alphabet size, for the map

## 2. Sliding Window + Set — `2_sliding_window_set.dart`

Same window idea, but the only bookkeeping is a set of the characters currently
inside it. When the character at `right` is already in the set, drop
characters from the left one by one until that duplicate is gone, then add the
new character. Each character enters the set once and leaves at most once, so
the total work is still linear, but `left` walks forward step by step instead
of jumping, which is why this ranks second.

- Time: O(n)
- Space: O(min(n, k)) where k is the alphabet size, for the set

## 3. Brute Force — `3_bruteforce.dart`

Try every starting position. From each one, extend to the right while adding
characters to a fresh set, and stop the moment a character is already there.
The size of the set at that point is the longest unique run starting at that
index; the answer is the best over all starts. Using a set makes each
extension step O(1), so this is O(n²) rather than O(n³).

- Time: O(n²)
- Space: O(min(n, k)) where k is the alphabet size, for the per-start set
