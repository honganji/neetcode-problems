# Permutations — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Next Permutation — `1_next_permutation.py`

Start from the smallest arrangement (the sorted list) and repeatedly step to the
next one in lexicographic order. To step forward, find the rightmost position `i`
whose value is smaller than the value after it. Everything to the right of `i` is
already in descending order, so it can't be arranged any bigger. Swap `arr[i]` with
the smallest larger value in that suffix, then reverse the suffix so it becomes
ascending. Stop when the whole list is descending. Because every arrangement is
visited exactly once and in order, there are no duplicates and no bookkeeping.

- Time: O(n · n!) — there are n! results, and copying each one takes O(n)
- Space: O(1) extra, not counting the output

## 2. Backtracking with In-Place Swaps — `2_backtracking_swap.py`

Fill the list one position at a time. For position `start`, try every value still
available there by swapping it into place, recurse to fill the next position, then
swap back to undo the change. Each complete path down the recursion is one
permutation, and the undo step restores the list for the next choice.

- Time: O(n · n!)
- Space: O(n) for the recursion depth, not counting the output

## 3. Iterative Insertion — `3_iterative_insertion.py`

Start with a single empty permutation. For each number, take every permutation built
so far and insert the number into each possible spot. A permutation with `k` items
has `k + 1` spots. After all numbers are placed, the list holds every permutation.
This builds the answer level by level instead of with recursion.

- Time: O(n · n!)
- Space: O(n · n!), because the intermediate lists hold as many permutations as the answer
