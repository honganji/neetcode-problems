# Meeting Rooms II — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Sorted Two Pointers — `1_sorted_two_pointers.dart`

Which room a meeting uses does not matter, only how many rooms are busy at once. So
pull out all the start times and all the end times, and sort each list on its own.
Walk through the starts in order. If the earliest unused end comes after the current
start, every room is still busy, so we need a new one. Otherwise, a meeting has already
finished and its room is free, so we move the end pointer forward and reuse it. The
number of "new room" events is the answer. A meeting that ends exactly when another
starts counts as free, since `end <= start` means no overlap.

- Time: O(n log n) for the two sorts
- Space: O(n) for the two sorted lists

## 2. Min-Heap of End Times — `2_min_heap.dart`

Sort the meetings by start time. Keep a min-heap of the end times of the rooms in use,
so the room that frees up first is always on top. For each meeting, if the top room is
already free (its end is at or before this start), pop it and reuse that room. Then push
this meeting's end time. The heap never shrinks below what it has already grown to, so
its final size is the number of rooms needed. Dart's core library has no priority queue,
so the file includes a small hand-written min-heap.

- Time: O(n log n) for the sort, plus O(log n) per heap operation
- Space: O(n) for the heap

## 3. Brute-Force Overlap Count — `3_bruteforce.dart`

The number of rooms in use only goes up at a meeting's start time, so the peak must
happen at one of those starts. For each start time, count how many meetings are in
progress then (their start is at or before it and their end is after it). The largest
count is the answer. This is easy to reason about, but it checks every meeting against
every other one.

- Time: O(n²)
- Space: O(1)
