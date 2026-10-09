# Last Stone Weight — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Max-heap — `1_heap.py`

Each smash needs the two heaviest stones, and a heap hands out the largest value in O(log n). Pop the two heaviest; if they differ, push back their difference. Python's `heapq` is a min-heap, so the weights are stored negated to make the heaviest one come out first. Every smash removes at least one stone, so there are at most n - 1 smashes.

- Time: O(n log n)
- Space: O(n) for the heap

## 2. Sorted list with binary insertion — `2_sorted_list.py`

Keep the stones sorted. The two heaviest are always at the end, so removing them is O(1). The new difference is put back at its sorted position with a binary search (`bisect.insort`). The insertion itself shifts the items after it, and that shifting is the bottleneck.

- Time: O(n^2) in the worst case (the sort is O(n log n), but each insertion can shift up to n items)
- Space: O(n) for the sorted copy

## 3. Brute force — `3_bruteforce.py`

Each round, scan the whole list for the heaviest stone and remove it, then scan again for the second heaviest and remove it. Push the difference if they differ. Nothing is kept between rounds, so every round costs a full pass.

- Time: O(n^2), up to n rounds with a few linear scans each
- Space: O(n) for the copy of the input
