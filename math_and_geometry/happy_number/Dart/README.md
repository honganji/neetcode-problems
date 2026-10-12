# Happy Number — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Known Cycle — `1_known_cycle.dart`

Keep replacing the number with the sum of the squares of its digits. Every unhappy
number falls into the same loop: 4 → 16 → 37 → 58 → 89 → 145 → 42 → 20 → 4. So we
do not need to detect a loop at all. Stop as soon as we see 1 (happy) or 4 (we are
in the loop, so unhappy).

- Time: O(log n), since each step is one pass over the digits and the chain drops
  below 1000 after a few steps
- Space: O(1)

## 2. Floyd's Cycle Detection — `2_floyd_cycle.dart`

Think of the chain of numbers as a linked list. A happy number's chain ends at the
fixed point 1. An unhappy number's chain loops forever. Use two pointers: `slow`
moves one step at a time and `fast` moves two. If there is a loop, `fast` eventually
catches `slow` inside it. If `fast` reaches 1 first, the number is happy.

- Time: O(log n), the same number of steps as above, but each step does more work
- Space: O(1)

## 3. Hash Set — `3_hash_set.dart`

Remember every number the chain produces. If it reaches 1, the number is happy. If
it produces a number that is already in the set, the chain is looping and can never
reach 1, so the number is unhappy. This is the easiest idea to reason about, but it
stores every value it visits.

- Time: O(log n)
- Space: O(log n) for the set of visited values
