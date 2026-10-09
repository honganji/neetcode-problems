# Task Scheduler — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Counting formula — `1_counting_formula.dart`

The most frequent task sets the pace. Its copies must be at least `n + 1` slots apart, so they split the timeline into `maxFreq - 1` gaps of size `n + 1`, plus one final slot for each task that ties for the highest count. The other tasks fill the gaps. If there are more tasks than that layout holds, nothing has to be idle, so the answer is just the number of tasks.

- Time: O(N) — one pass to count, then O(1) math
- Space: O(1) — at most 26 distinct letters

## 2. Block sorting — `2_block_sorting.dart`

Split the timeline into blocks of `n + 1` slots. Each block runs the `n + 1` letters with the most copies left, and the list is re-sorted before every block. Two copies of one letter can never land in the same block, and a letter at the same position in consecutive blocks is exactly `n + 1` apart, so the cooldown is always respected. If tasks run out partway through a block we stop; otherwise the rest of the block is idle.

- Time: O(N) — every block runs at least one task, and each block costs a fixed 26·log 26 sort
- Space: O(1)

## 3. Max-heap simulation — `3_max_heap_simulation.dart`

Walk the clock one slot at a time. Tasks that are ready sit in a max-heap keyed by remaining copies. Run the top task, then park it in a cooldown queue with the time it becomes ready again. When that time arrives, move it back into the heap. If the heap is empty, the slot is idle. Dart's core library has no heap, so this version keeps the ready counts in a sorted list instead (at most 26 items). This copies how a real scheduler would behave, but it visits every idle slot, so it is slower when `n` is large.

- Time: O(answer) — one loop step per time slot; the heap holds at most 26 items
- Space: O(1)
