# Sliding Window Maximum — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Monotonic Deque — `1_monotonic_deque.kt`

Keep a deque of indices whose values are in decreasing order from front to
back, so the front is always the maximum of the current window. When a new
number arrives, anything at the back that is smaller or equal can never be the
answer again — the new number is bigger and will outlive it — so pop those
first, then push the new index. If the front index has slid out of the window,
drop it too. Each index is pushed and popped at most once, which is why the
whole pass is linear even though there is a loop inside a loop.

- Time: O(n)
- Space: O(k) for the deque

## 2. Max-Heap with Lazy Removal — `2_max_heap_lazy_removal.kt`

Push every number into a max-heap together with its index. The top of the heap
is the biggest value seen so far, but it might belong to a position that has
already left the window. Instead of searching the heap to delete old entries,
just peek at the top and discard it if its index is stale, repeating until the
top is fresh. Stale entries deeper in the heap are harmless because they only
matter once they reach the top, and by then they get thrown away.

- Time: O(n log n)
- Space: O(n) — stale entries can linger in the heap

## 3. Brute Force — `3_bruteforce.kt`

For every starting position, look at the `k` numbers in that window and pick
the largest. There are about `n` windows and each one costs `k` comparisons,
so this is fine for small inputs but far too slow when both `n` and `k` are
large.

- Time: O(n·k)
- Space: O(1) beyond the output
