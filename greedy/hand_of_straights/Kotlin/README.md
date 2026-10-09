# Hand of Straights — Kotlin

Solutions ordered from most to least efficient. Only two techniques are meaningfully different for this problem (see the [top-level README](../README.md)).

## 1. ⭐ Sorted counts (greedy from the smallest value) — `1_sorted_counts.kt`

Count how many of each card there are. Then go through the distinct values from smallest to largest. The smallest value left has to be the lowest card of its groups, because no smaller card remains to start a group with it. So if it appears `c` times, it starts `c` groups at once: remove `c` copies of each of the next `groupSize` values. If any of those values has fewer than `c` copies left, the answer is `false`.

Sorting makes the "smallest first" order easy, and the counts let us handle all groups that share a start in one step.

- Time: O(n log n), dominated by sorting the distinct values
- Space: O(n) for the count map

## 2. Brute-force greedy (no counting) — `2_bruteforce.kt`

Keep the cards in a plain list. Repeatedly find the smallest remaining card, which must start the next group, and remove one copy of each of the next `groupSize` consecutive values from the list. If a needed value is missing, return `false`. This is the same greedy idea as solution 1, but with no sorting or hashing: every step is a linear scan.

- Time: O(n²), since each group needs a scan for the minimum and a scan per removed card
- Space: O(n) for the copied list
