# Merge k Sorted Lists — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Divide and Conquer — `1_divide_and_conquer.kt`

Merging two sorted lists is easy: repeatedly take the smaller head. The trick
is to not merge everything into one growing list, but to pair the lists up and
merge each pair, which halves the number of lists. Repeat the pairing rounds
until only one list is left. Every node is touched once per round, and there
are only about log k rounds, so no node is ever re-walked k times.

- Time: O(N log k), where N is the total number of nodes
- Space: O(k) for the shrinking list of heads between rounds

## 2. Min-Heap — `2_min_heap.kt`

Only the current head of each list can be the next smallest value, so keep
those k heads in a min-heap. Pop the smallest, append it to the result, and
push that node's successor back into the heap. The heap never holds more than
k nodes, so each pop and push costs log k, and every node goes through the
heap exactly once.

- Time: O(N log k)
- Space: O(k) for the heap

## 3. Sequential Merge — `3_sequential_merge.kt`

Start with an empty result and merge the lists into it one at a time using the
two-list merge. It gives the right answer, but the accumulator keeps growing,
so early nodes get walked again on every later merge. With k lists, nodes from
the first list are visited up to k times.

- Time: O(N · k)
- Space: O(1)
